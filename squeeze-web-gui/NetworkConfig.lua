-- NetworkConfig

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

local io, string, os, ipairs, pairs, tonumber, tostring = io, string, os, ipairs, pairs, tonumber, tostring
local util, log = util, log

module(...)

local configFilePrefix = "/etc/sysconfig/network-scripts/ifcfg-"
local configFileTmp    = "/tmp/ifcfg.config"

function params(wireless)
	local t = {
		'device', 'type', 'dhcp', 'onboot', 'ipaddr0', 'netmask0', 'gateway0', 'dns1', 'dns2', 'dns3', 'domain'
	}
	if wireless then
		t[#t+1] = 'essid'
		t[#t+1] = 'wpa_psk'
	end
	return t
end

function get(int, is_wireless)
	local config = {}

	local conf = io.open(configFilePrefix .. int, "r")
	if conf then
		for line in conf:lines() do
			local k, v = string.match(line, "^(.-)=(.*)")
			if k and v then
				config[ string.lower(k) ] = string.match(v, '^"(.*)"$') or v
			end
		end
		config.dhcp = (config.bootproto == "dhcp")
		config.onboot = (config.onboot ~= "no")
		conf:close()
	else
		log.debug("unable to open: " .. configFilePrefix .. int)
	end

	if is_wireless then
		local pskconf = util.capture("sudo sp-keysRead " .. int)
		if pskconf then
			pskconf = pskconf .. "\n"
			for line in string.gmatch(pskconf, "(.-)\n") do
				local k, v = string.match(line, "^(.-)=(.*)")
				if k and v then
					config[ string.lower(k) ] = string.match(v, "^'(.*)'$") or v
				end
			end
		end
	end

	return config
end

function scan_wifi()
	local status = {}
	local scan   = {}

	local step1 = util.capture("sudo wpa_cli status")
	for line in string.gmatch(step1, "(.-)\n") do
		local k, v = string.match(line, "(.-)=(.*)")
		if k and v then
			status[k] = string.lower(v)
		end
	end	

	local step2 = util.capture("sudo wpa_cli scan")
	if string.match(step2, "OK") then
		local step3 = util.capture("sudo wpa_cli scan_results")
		for line in string.gmatch(step3, "(.-)\n") do
			local bssid, freq, signal, flags, ssid = string.match(line, "(%x+:%x+:%x+:%x+:%x+:%x+)%s+(.+)%s+(.+)%s+(.+)%s+(.+)")
			if ssid then
				scan[#scan+1] = { ssid = ssid, flags = flags, signal = tonumber(signal) }
			end
		end
	end

	return scan, status
end

function _ip_validate(s, mask)
	local ip1, ip2, ip3, ip4 = string.match(s, "^(%d+)%.(%d+)%.(%d+)%.(%d+)$")
	if ip1 and ip2 and ip3 and ip4 then
		ip1 = tonumber(ip1)
		ip2 = tonumber(ip2)
		ip3 = tonumber(ip3)
		ip4 = tonumber(ip4)
		if mask and ip1 >= 0 and ip1 <= 255 and ip2 >= 0 and ip2 <= 255 and ip3 >= 0 and ip3 <= 255 and ip4 >= 0 and ip4 <= 255 then
			return true
		end
		if ip1 >= 0 and ip1 < 224 and ip2 >= 0 and ip2 <= 255 and ip3 >= 0 and ip3 <= 255 and ip4 > 0 and ip4 < 255 then
			return true
		end
	end
	return false
end

function validate(c)
	-- return error token or nil
	for _, v in ipairs({ 'ipaddr0', 'gateway0', 'dns1', 'dns2', 'dns3' }) do
		if c[v] and not _ip_validate(c[v]) then
			return v
		end
	end
	if c.netmask0 and not _ip_validate(c.netmask0, true) then
		return 'netmask0'
	end
	if (c.ipaddr0 or c.netmask0 or c.gateway0) and not (c.ipaddr0 and c.netmask0 and c.gateway0) then
		return 'static'
	end
	return nil
end

function set(config, int, is_wireless)
	local inconf = io.open(configFilePrefix .. int, "r")
	local outconf = io.open(configFileTmp, "w")

	local bootproto = config.dhcp and 'dhcp' or 'none'
	local static_param = {}
	local static_found = {}

	for _, v in ipairs({'ipaddr0', 'netmask0', 'gateway0', 'dns1', 'dns2', 'dns3', 'domain' }) do
		static_param[v] = true
	end

	if inconf and outconf then
		outconf:write("# created by squeeze-web-gui-lua " .. os.date() .. "\n")

		-- put SCAN_SSID=1 at start of file if required
		if is_wireless and config[force_scan] then
			outconf:write("SCAN_SSID=1\n")
		end

		-- read each existing line and update if required
		for line in inconf:lines() do
			local k, v = string.match(line, "^(.-)=(.*)")
			if k then
				if k == 'BOOTPROTO' then
					outconf:write("BOOTPROTO=" .. bootproto .. "\n")
				elseif static_param[string.lower(k)] then
					if not config.dhcp then
						outconf:write(k .. "=" .. config[string.lower(k)] .. "\n")
					end
					static_found[string.lower(k)] = true
				elseif k == 'ONBOOT' then
					outconf:write("ONBOOT=" .. (config.onboot and "yes" or "no") .. "\n")
				elseif k == 'SCAN_SSID' then
					-- ignored as added above
				elseif k == "ESSID" then
					outconf:write('ESSID="' .. config.essid .. '"\n')
				else
					outconf:write(line .. "\n")
				end
			end
		end

		-- add in remaining static parameters if not already present and not dhcp
		if not config.dhcp then
			for k, _ in pairs(static_param) do
				if not static_found[k] and config[k] then
					outconf:write(string.upper(k) .. "=" .. config[k] .. "\n")
				end
			end
		end

		outconf:close()
		inconf:close()

		util.execute("sudo sp-ifcfgUpdate " .. configFileTmp .. " " .. int)
		util.execute("rm " .. configFileTmp)

		log.debug("wrote and updated config")
	else
		if not inconf then
			log.error("unable to read: " .. configFilePrefix .. int)
		end
		if not outconf then
			log.error("unable to write: " .. configFileTmp)
		end
	end

	if is_wireless then
		local keys = io.open(configFileTmp, "w")
		if keys then
			keys:write("# created by squeeze-web-gui-lua " .. os.date() .. "\n")
			keys:write("WPA_PSK='" .. (config.wpa_psk or "") .. "'\n")
			keys:close()

			util.execute("sudo sp-keysUpdate " .. configFileTmp .. " " .. int)
			util.execute("rm " .. configFileTmp)

			log.debug("wrote and updated keys")
		else
			log.error("unable to write: " .. configFileTmp)
		end
	end
end
