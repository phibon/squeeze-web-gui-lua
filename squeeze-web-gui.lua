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

-- status: very incomplete proof of concept code using Turbo.lua
-- See http://turbolua.org.

local turbo = require('turbo')
local io    = require('io')
local lfs   = require('lfs')

local SqueezeliteConfig = require('squeeze-web-gui.SqueezeliteConfig')
local strings           = require("squeeze-web-gui.Strings")

-----------------------------------------------------------------------------------------

-- configuration

-- server port
local PORT = 8081

-- paths to our templates and static content
local path  = "."
local templ_path  = path .. '/templ/'
local static_path = path .. '/static/'

-- languages supported and default
local languages = { 'EN', 'DE' }
local language = 'EN'

-- version string
-- local version = { release = 'test' }

-- debug mode - log rather than execute
local debug = arg[1] and arg[1] == '--debug'

------------------------------------------------------------------------------------------

--utils
local log = turbo.log

function execute(cmd)
	if debug then
		log.debug("execute: " .. cmd)
		return 
	end
	os.execute(cmd)
end

function capture(cmd)
	if debug then
		log.debug("capture: " .. cmd)
		return "capture: " .. cmd
	end
	local f = assert(io.popen(cmd, 'r'))
	local s = assert(f:read('*a'))
	f:close()
	return s
end

function dump(o)
	for k, v in pairs(o) do
		_, k = pcall(tostring, k)
		_, v = pcall(tostring, v)
		print((k or "") .. " -> " .. (v or ""))
	end
end

if debug then
	-- log string misses, excluded params which start with p_
	local func = function(t, str) 
					 if not string.match(str, "^p_") then
						 log.debug("missing string [" .. language .. "]: " .. str)
					 end
				 end
	setmetatable(strings['base'][language], { __index = func })
end

------------------------------------------------------------------------------------------

-- setup handlers
local templ = turbo.web.Mustache.TemplateHelper(templ_path)

local IndexHandler       = class("IndexHandler", turbo.web.RequestHandler)
local SystemHandler      = class("SystemHandler", turbo.web.RequestHandler)
local EthernetHandler    = class("EthernetHandler", turbo.web.RequestHandler)
local WirelessHandler    = class("WirelessHandler", turbo.web.RequestHandler)
local SqueezeliteHandler = class("SqueezeliteHandler", turbo.web.RequestHandler)
local SqueezeserverHandler = class("SqueezeserverHandler", turbo.web.RequestHandler)
local ShutdownHandler    = class("ShutdownHandler", turbo.web.RequestHandler)
local FaqHandler         = class("FaqHandler", turbo.web.RequestHandler)
local HelpHandler        = class("HelpHandler", turbo.web.RequestHandler)

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

additional_methods = {
	renderResult = function(self, template, t)
					   self:write( templ:render('header.html', strings['header'][language]) )
					   self:write( templ:render(template, t) )
					   self:write( templ:render('footer.html', strings['footer'][language]))
				   end,
	serviceActions = function(self, service)
						 for action, val in pairs(service_actions) do
							 if self:get_argument(action, false) then
								 for _, str in ipairs(val) do
									 execute(string.format(str, service))
								 end
							 end
						 end
					 end
}

IndexHandler:include(additional_methods)
SystemHandler:include(additional_methods)
EthernetHandler:include(additional_methods)
WirelessHandler:include(additional_methods)
SqueezeliteHandler:include(additional_methods)
SqueezeserverHandler:include(additional_methods)
ShutdownHandler:include(additional_methods)
FaqHandler:include(additional_methods)
HelpHandler:include(additional_methods)

------------------------------------------------------------------------------------------

-- index.html
function IndexHandler:get()
	local lang = self:get_argument('locale', false)
	if lang and strings['languages'][lang] then
		language = lang
	end

	local t = { p_languages = {} }

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

	local info = capture("ls -l /etc/localtime")
	local zone = string.match(info, "->%s" .. zonefiles .. "(.-)\n")

	t['p_zones'] = {}
	for _, v in ipairs(zones) do
		t['p_zones'][#t['p_zones']+1] = { zone = v, selected = (v == zone and "selected" or "") }
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
		execute("sudo csos-timeZone " .. newzone)
	end
	self:_response()
end

------------------------------------------------------------------------------------------

-- ethernet.html
function EthernetHandler:_response()
	local t = {}

	t['p_status'] = capture("ifconfig eth0")

	setmetatable(t, { __index = strings['ethernet'][language] })
	self:renderResult('ethernet.html', t)
end

function EthernetHandler:get()
	self:_response()
end

------------------------------------------------------------------------------------------

-- wireless.html
function WirelessHandler:_response()
	local t = {}

	t['p_status'] = capture("ifconfig wlan0")

	setmetatable(t, { __index = strings['wireless'][language] })
	self:renderResult('wireless.html', t)
end

function WirelessHandler:get()
	self:_response()
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

	t['p_status'] = capture('systemctl status squeezelite.service')
	if config.logfile then
		local logfile = io.open(config.logfile, "r")
		if logfile then
			logfile:close()
			t['p_status'] = t['p_status'] .. capture('tail ' .. config.logfile)
		end
	end
	
	t['p_devices'] = {}
	local device_info = capture("squeezelite -l")
	local inc = {}
	if device_info then
		for line in string.gmatch(device_info, "(.-)\n") do
			local id = string.match(line, "%s-(.-)%s-%-")
			if id then
				id = string.gsub(id, "sysdefault:", "hw:")  -- replace sysdefault:* with hw:*
				id = string.gsub(id, "default:", "hw:")     -- replace default:* with hw:*
				if not inc[id] then
					t['p_devices'][#t['p_devices']+1] = { device = id, selected = (id == config.device and "selected" or "") }
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
			self:_response(err)
			return
		end
		
		SqueezeliteConfig.set(config)

		if self:get_argument('squeezelite_config_saverestart', false) then
			execute(string.format(service_actions['restart'][1], 'squeezelite.service'))
		end
	end

	self:_response()
end


------------------------------------------------------------------------------------------

-- squeezeserver.html
function SqueezeserverHandler:_response()
	local t = {
		p_status = capture('systemctl status squeezeboxserver.service')
	}

	local logfile = io.open("/var/log/squeezeboxserver/server.log", "r")
	if logfile then
		logfile:close()
		t['p_status'] = t['p_status'] .. capture('tail /var/log/squeezeboxserver/server.log')
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

-- shutdown.html
function ShutdownHandler:get()
	self:renderResult('shutdown.html', strings['shutdown'][language])
end

function ShutdownHandler:post()
	local force = self:get_argument("force", false)
	if self:get_argument("halt", false) then
		execute("sudo csos-halt" .. (force and " -f" or ""))
	end
	if self:get_argument("reboot", false) then
		execute("sudo csos-reboot" .. (force and " -f" or ""))
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
    { "^/index.html$", IndexHandler },
    { "^/system.html$", SystemHandler },
    { "^/ethernet.html$", EthernetHandler },
    { "^/wireless.html$", WirelessHandler },
    { "^/squeezelite.html$", SqueezeliteHandler },
    { "^/squeezeserver.html$", SqueezeserverHandler },
    { "^/shutdown.html$", ShutdownHandler },
    { "^/faq.html$", FaqHandler },
    { "^/help.html$", HelpHandler },
	{ "^/static/(.*)$", turbo.web.StaticFileHandler, static_path }
}):listen(PORT)

turbo.ioloop.instance():start()
