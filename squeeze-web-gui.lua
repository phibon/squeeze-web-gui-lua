#!/usr/bin/env luajit

-- Web Configuration and Control Interface (lua version) for a 
-- Wandboard Squeeze Player
--
-- Copyright (C) 2014 Adrian Smith <triode1@btinternet.com>
--
-- This file is part of squeeze-web-gui-lua.
--
-- squeeze-web-gui-lua is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- squeeze-web-gui-lua is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with squeeze-web-gui-lua. If not, see <http://www.gnu.org/licenses/>.

local turbo = require('turbo')
local io    = require('io')
local lfs   = require('lfs')

-- globals accessed by required modules
log   = turbo.log
util  = {}

local NetworkConfig     = require('squeeze-web-gui.NetworkConfig')
local SqueezeliteConfig = require('squeeze-web-gui.SqueezeliteConfig')
local StorageConfig     = require('squeeze-web-gui.StorageConfig')
local strings           = require("squeeze-web-gui.Strings")

------------------------------------------------------------------------------------------

-- configuration

-- release version id
local release = "test"

-- server port
local PORT = 8081

-- paths to our templates and static content
local path  = "."
local templ_path  = path .. '/templ/'
local static_path = path .. '/static/'

-- interface ids
local eth_id  = "eth0"
local wlan_id = "wlan0"

-- languages supported and default
local languages = { 'EN', 'DE' }
local language = 'EN'

------------------------------------------------------------------------------------------

-- utils
local debug      = arg[1] and arg[1] == '--debug'
local test_mode  = arg[1] and arg[1] == '--test'

util.execute = function(cmd)
	if test_mode then
		log.debug("execute: " .. cmd)
		return 
	end
	os.execute(cmd)
end

util.capture = function(cmd)
	if test_mode then
		log.debug("capture: " .. cmd)
		return "capture: " .. cmd
	end
	local f = assert(io.popen(cmd, 'r'))
	local s = assert(f:read('*a'))
	f:close()
	return s
end

if test_mode then
	-- log string misses, excluded params which start with p_
	local func = function(t, str) 
					 if not string.match(str, "^p_") then
						 log.debug("missing string [" .. language .. "]: " .. str)
					 end
				 end
	setmetatable(strings['base'][language], { __index = func })
end

if not debug and not test_mode then
	log.categories.debug   = false
	log.categories.success = false
end

------------------------------------------------------------------------------------------

-- setup handlers
local templ = turbo.web.Mustache.TemplateHelper(templ_path)

local PageHandler = class("PageHandler", turbo.web.RequestHandler)

-- cached param and strings table for footer
local footer_t = { release = release }
setmetatable(footer_t, { __index = strings['footer'][language] })

-- common actions
local service_actions = {
	--refresh does nothing - systemctl status is called in _response handler
	enable         = { "sudo systemctl enable %s" },
	disable        = { "sudo systemctl disable %s" },
	start          = { "sudo systemctl start %s" },
	stop           = { "sudo systemctl stop %s" },
	restart        = { "sudo systemctl restart %s" },
	enableAndStart = { "sudo systemctl enable %s", "sudo systemctl start %s" },
	disableAndStop = { "sudo systemctl disable %s", "sudo systemctl stop %s" },
}

function PageHandler:renderResult(template, t)
	self:write( templ:render('header.html', strings['header'][language]) )
	self:write( templ:render(template, t) )
	self:write( templ:render('footer.html', footer_t) )
end

function PageHandler:serviceActions(service)
	for action, val in pairs(service_actions) do
		if self:get_argument(action, false) then
			for _, str in ipairs(val) do
				local cmd = string.format(str, service)
				log.debug("service action: " .. cmd)
				util.execute(cmd)
			end
		end
	end
end

local IndexHandler       = class("IndexHandler", PageHandler)
local SystemHandler      = class("SystemHandler", PageHandler)
local NetworkHandler     = class("NetworkHandler", PageHandler)
local SqueezeliteHandler = class("SqueezeliteHandler", PageHandler)
local SqueezeserverHandler = class("SqueezeserverHandler", PageHandler)
local StorageHandler     = class("StorageHandler", PageHandler)
local ShutdownHandler    = class("ShutdownHandler", PageHandler)
local FaqHandler         = class("FaqHandler", PageHandler)
local HelpHandler        = class("HelpHandler", PageHandler)

------------------------------------------------------------------------------------------

-- index.html
function IndexHandler:get()
	local lang = self:get_argument('locale', false)
	if lang and strings['languages'][lang] then
		language = lang
		setmetatable(footer_t, { __index = strings['footer'][language] })
	end

	local t = { p_languages = {}, p_eth_id = eth_id, p_wlan_id = wlan_id }

	local l = t['p_languages']
	for _, v in ipairs(languages) do
		l[#l+1] = { lang = v, desc = strings['languages'][v], selected = (v == language and "selected" or "") }
	end

	setmetatable(t, { __index = strings['index'][language] })
	self:renderResult('index.html', t)
end

------------------------------------------------------------------------------------------

-- system.html
local zonefiles = "/usr/share/zoneinfo/"

function _zones(dir)
	local attr = lfs.attributes(zonefiles .. (dir or ""))
	local t = {}
	if attr and attr.mode == "directory" then
		for file in lfs.dir(zonefiles .. (dir or "")) do
			if not (file == "." or file == ".." or file == "posix" or file == "right" or file == "posixrules" or
					string.match(file, "%.tab$")) then
				local path = dir and (dir .. "/" .. file) or file
				if lfs.attributes(zonefiles .. path).mode == "directory" then
					for _, v in ipairs(_zones(path)) do
						table.insert(t, v)
					end
				else
					table.insert(t, path)
				end
			end
		end
	end
	return t
end

function SystemHandler:_response()
	local t = {}
	local zones = _zones()
	table.sort(zones)

	local info = util.capture("ls -l /etc/localtime")
	local zone = string.match(info, "->%s" .. zonefiles .. "(.-)\n")

	t['p_zones'] = {}
	for _, v in ipairs(zones) do
		table.insert(t['p_zones'], { zone = v, selected = (v == zone and "selected" or "") })
	end

	setmetatable(t, { __index = strings['system'][language] })
	self:renderResult('system.html', t)
end

function SystemHandler:get()
	self:_response()
end

function SystemHandler:post()
	local newzone = self:get_argument("timezone", false)
	if newzone then
		log.debug("setting timezone to " .. newzone)
		util.execute("sudo csos-timeZone " .. newzone)
	end
	self:_response()
end

------------------------------------------------------------------------------------------

-- network.html
function NetworkHandler:_response(type, err)
	local int = (type == "eth" and eth_id or wlan_id)
	local is_wireless = (int == wlan_id)
	local config = NetworkConfig.get(int, is_wireless)
	local t = {}

	t['p_error'] = err and (strings['squeezelite'][language]["error_" .. err] or 'validation error - ' .. err)

	t['p_iftype'] = type
	t['p_is_wlan'] = is_wireless
	t['p_onboot_checked'] = config.onboot == "true" and "checked" or ""
	t['p_dhcp_checked']   = config.bootproto == "dhcp" and "checked" or ""

	t['p_status'] = util.capture("ifconfig " .. int)

	for _, v in ipairs(NetworkConfig.params(is_wireless)) do
		t["p_"..v] = config[v]
	end

	if is_wireless then
		local scan, status = NetworkConfig.scan_wifi()

		t['p_wpa_state'] = status['wpa_state']

		t['p_essids'] = {}
		local essids = {}
		for _, v in ipairs(scan) do
			table.insert(t['p_essids'], { id = v.ssid, selected = (v.ssid == config.essid and "selected" or "") })
			essids[v.ssid] = true
		end

		-- put previous selection on top of list if not already there
		if not essids[config.essid] then
			table.insert(t['p_essids'], 1, { id = config.essid, selected = "selected" })
		end
		-- add option to add private network
		table.insert(t['p_essids'], { id = strings['network'][language]['add_private'] })
	end

	setmetatable(t, { __index = strings['network'][language] })
	self:renderResult('network.html', t)
end

function NetworkHandler:get(type)
	self:_response(type)
end

function NetworkHandler:post(type)
	local int = (type == "eth" and eth_id or wlan_id)
	local is_wireless = (int == wlan_id)

	if self:get_argument('network_config_save', false) then
		local other_ssid = self:get_argument('other_ssid', false)

		local config = {}
		for _, v in ipairs(NetworkConfig.params(is_wireless)) do
			config[v] = self:get_argument(v, false)
		end

		if other_ssid then
			config['essid'] = other_ssid
		end

		local err = NetworkConfig.validate(config)
		if err then
			log.debug("validation error: " .. err)
			self:_response(type, err)
			return
		end

		if is_wireless then
			local scan, status = NetworkConfig.scan_wifi()
			local ssid_found = false
			for _, v in ipairs(scan) do
				if config.essid == v.ssid then
					ssid_found = true
				end
			end
			config['force_scan'] = not ssid_found
		end
		
		NetworkConfig.set(config, int, is_wireless)
	end

	if self:get_argument("network_ifdown", false) or self:get_argument("network_ifdownup", false) then
		log.debug("ifdown " .. int)
		util.execute("sudo ifdown " .. int)
	end
	if self:get_argument("network_ifup", false) or self:get_argument("network_ifdownup", false) then
		log.debug("ifup " .. int)
		util.execute("sudo ifup " .. int)
	end

	self:_response(type)
end

------------------------------------------------------------------------------------------

-- squeezelite.html
function SqueezeliteHandler:_response(err)
	local config = SqueezeliteConfig.get()
	local t = {}

	t['p_error'] = err and (strings['squeezelite'][language]["error_" .. err] or 'validation error - ' .. err)

	for _, v in ipairs(SqueezeliteConfig.params()) do
		t["p_"..v] = config[v]
	end
	t['p_resample_checked'] = config.resample and "checked" or ""
	t['p_dop_checked']      = config.dop and "checked" or ""
	t['p_vis_checked']      = config.vis and "checked" or ""

	t['p_status'] = util.capture('systemctl status squeezelite.service')
	if config.logfile then
		local logfile = io.open(config.logfile, "r")
		if logfile then
			logfile:close()
			t['p_status'] = t['p_status'] .. util.capture('tail ' .. config.logfile)
		end
	end
	
	t['p_devices'] = {}
	local device_info = util.capture("squeezelite -l")
	local inc = {}
	if device_info then
		for line in string.gmatch(device_info, "(.-)\n") do
			local id = string.match(line, "%s-(.-)%s-%-")
			if id then
				id = string.gsub(id, "sysdefault:", "hw:")  -- replace sysdefault:* with hw:*
				id = string.gsub(id, "default:", "hw:")     -- replace default:* with hw:*
				if not inc[id] then
					table.insert(t['p_devices'], { device = id, selected = (id == config.device and "selected" or "") })
					inc[id] = 1
				end
			end
		end
	end
	if not inc[config.device] then
		-- add previously selected device at top of list if it is not included as it may have been turned off
		table.insert(t['p_devices'], 1, { device = config.device, selected = "selected" })
	end

	setmetatable(t, { __index = strings['squeezelite'][language] })
	self:renderResult('squeezelite.html', t)
end

function SqueezeliteHandler:get()
	self:_response()
end

function SqueezeliteHandler:post()
	self:serviceActions('squeezelite.service')

	if self:get_argument('squeezelite_config_save', false) or self:get_argument('squeezelite_config_saverestart', false) then
		local config = {}
		for _, v in ipairs(SqueezeliteConfig.params()) do
			config[v] = self:get_argument(v, false)
		end

		local err = SqueezeliteConfig.validate(config)
		if err then
			log.debug("validation error: " .. err)
			self:_response(err)
			return
		end
		
		SqueezeliteConfig.set(config)

		if self:get_argument('squeezelite_config_saverestart', false) then
			util.execute(string.format(service_actions['restart'][1], 'squeezelite.service'))
		end
	end

	self:_response()
end

------------------------------------------------------------------------------------------

-- squeezeserver.html
function SqueezeserverHandler:_response()
	local t = {
		p_status = util.capture('systemctl status squeezeboxserver.service')
	}

	local logfile = io.open("/var/log/squeezeboxserver/server.log", "r")
	if logfile then
		logfile:close()
		t['p_status'] = t['p_status'] .. util.capture('tail /var/log/squeezeboxserver/server.log')
	end

	setmetatable(t, { __index = strings['squeezeserver'][language] })
	self:renderResult('squeezeserver.html', t)
end

function SqueezeserverHandler:get()
	self:_response()
end

function SqueezeserverHandler:post()
	self:serviceActions('squeezeboxserver.service')
	self:_response()
end

------------------------------------------------------------------------------------------

-- storage.html
function _ids(tab)
	local t = {}
	for _, v in ipairs(tab) do
		t[#t+1] = { id = v }
	end
	return t
end

function StorageHandler:_response()
	local t = {}

	t['p_status']      = StorageConfig.status()
	t['p_disks']       = _ids(StorageConfig.localdisks())
	t['p_mountpoints'] = _ids(StorageConfig.mountpoints())
	t['p_types_local'] = _ids({ '', 'vfat', 'ext2', 'ext3', 'ext4' }, true)
	t['p_types_net']   = _ids({ '', 'cifs' ,'nfs' }, true)

	local umount_str = strings['storage'][language]['unmount']

	for _, v in ipairs(StorageConfig.get()) do
		if v.type ~= 'cifs' and v.type ~= 'nfs' then
			t['p_local'] = t['p_local'] or {}
			table.insert(t['p_local'], { p_spec = v.spec, p_mountp = v.mountp, p_type = v.type, p_opt = v.opt, p_perm = v.perm, 
										 p_unmount = umount_str })
		else
			t['p_net'] = t['p_net'] or {}
			table.insert(t['p_net'], { p_spec = v.spec, p_mountp = v.mountp, p_type = v.type, p_opt = v.opt, p_perm = v.perm,
									   p_unmount = umount_str })
		end
	end

	setmetatable(t, { __index = strings['storage'][language] })
	self:renderResult('storage.html', t)
end

function StorageHandler:get()
	self:_response()
end

function StorageHandler:post()
	local spec = self:get_argument('spec', false)
	local mountp = self:get_argument('mountpoint', false)
	local type = self:get_argument('type', false)
	local opts = self:get_argument('options', false)

	if self:get_argument('localfs_mount', false) or self:get_argument('netfs_mount', false) then
		util.execute("sudo umount " .. mountp)
		util.execute("sudo mount " .. (type and ("-t " .. type .. " ") or "") .. (opts and ("-o " .. opts .. " ") or "") ..
					 spec .. " " .. mountp)
		-- if mount worked then persist, storing opts passed not those parsed from active mounts
		local mounts = StorageConfig.get()
		for _, v in ipairs(mounts) do
			if spec == v.spec and mountp == v.mountp then
				v.opts = opts
				v.perm = true
				break
			end
		end
		StorageConfig.set(mounts)
	end

	if self:get_argument('localfs_unmount', false) or self:get_argument('net_unmount', false) then
		util.execute("sudo umount " .. mountp)
		-- remove mount from persited mounts
		local mounts = StorageConfig.get()
		local i = 1
		while mounts[i] do
			if mountp == mounts[i].mountp then
				table.remove(mounts, i)
				break
			end
			i = i + 1
		end
		StorageConfig.set(mounts)
	end

	self:_response()
end

------------------------------------------------------------------------------------------

-- shutdown.html
function ShutdownHandler:get()
	self:renderResult('shutdown.html', strings['shutdown'][language])
end

function ShutdownHandler:post()
	local force = self:get_argument("force", false)
	if self:get_argument("halt", false) then
		log.debug("halt")
		util.execute("sudo csos-halt" .. (force and " -f" or ""))
	end
	if self:get_argument("reboot", false) then
		log.debug("restart")
		util.execute("sudo csos-reboot" .. (force and " -f" or ""))
	end
	self:renderResult('shutdown.html', strings['shutdown'][language])
end

------------------------------------------------------------------------------------------

-- faq.html
function FaqHandler:get()
	self:renderResult('faq.html', strings['faq'][language])
end

------------------------------------------------------------------------------------------

-- help.html
function HelpHandler:get()
	self:renderResult('help.html', strings['help'][language])
end

------------------------------------------------------------------------------------------

-- register pages and start server
turbo.web.Application({
    { "^/$", IndexHandler },
    { "^/index%.html$", IndexHandler },
    { "^/system%.html$", SystemHandler },
    { "^/network%-(.-)%.html$", NetworkHandler },
    { "^/squeezelite%.html$", SqueezeliteHandler },
    { "^/squeezeserver%.html$", SqueezeserverHandler },
    { "^/storage%.html$", StorageHandler },
    { "^/shutdown%.html$", ShutdownHandler },
    { "^/faq%.html$", FaqHandler },
    { "^/help%.html$", HelpHandler },
	{ "^/static/(.*)$", turbo.web.StaticFileHandler, static_path }
}):listen(PORT)

turbo.ioloop.instance():start()
