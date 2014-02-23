-- SqueezeliteConfig - shared between squeeze-web-gui-lua and jivelite

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

local io, string, os, tonumber, tostring = io, string, os, tonumber, tostring
local util, log = util, log

module(...)

local configFile    = "/etc/sysconfig/squeezelite"
local configFileTmp = "/tmp/squeezelite.config"

function params()
	return {
		'name', 'mac', 'rate', 'device', 'logfile', 'loglevel', 'priority', 'buffer', 'codec', 'alsa', 'other', 'server',
		'dop', 'dop_params', 'resample', 'resample_params', 'vis'
	}
end

function get()
	local config = {}

	local conf = io.open(configFile, "r")
	if conf == nil then
		log.error("unable to read: " .. configFile)
		return config
	end

	for line in conf:lines() do
		if string.match(line, "NAME") then
			config.name = string.match(line, '^NAME="%-n%s(.-)"')
		end
		if string.match(line, "MAC") then	
			config.mac = string.match(line, '^MAC="%-m%s(.-)"')
		end
		if string.match(line, "MAX_RATE") then	
			config.rate = string.match(line, '^MAX_RATE="%-r%s(.-)"')
		end
		if string.match(line, "AUDIO_DEV") then
			config.device = string.match(line, '^AUDIO_DEV="%-o%s(.-)"')
		end
		if string.match(line, "BUFFER") then
			config.buffer = string.match(line, '^BUFFER="%-b%s(.-)"')
		end
		if string.match(line, "CODEC") then
			config.codec = string.match(line, '^CODEC="%-c%s(.-)"')
		end
		if string.match(line, "ALSA_PARAMS") then
			config.alsa = string.match(line, '^ALSA_PARAMS="%-a%s(.-)"')
		end
		if string.match(line, "LOG_FILE") then
			config.logfile = string.match(line, '^LOG_FILE="%-f%s(.-)"')
		end
		if string.match(line, "LOG_LEVEL") then
			config.loglevel = string.match(line, '^LOG_LEVEL="%-d%s(.-)"')
		end
		if string.match(line, "PRIORITY") then
			config.priority = string.match(line, '^PRIORITY="%-p%s(.-)"')
		end
		if string.match(line, "UPSAMPLE") then
			config.resample = string.match(line, '^UPSAMPLE="%-u')
			config.resample_params = string.match(line, '^UPSAMPLE="%-u%s(.-)"')
		end
		if string.match(line, "DOP") then
			config.dop = string.match(line, '^DOP="%-D')
			config.dop_params = string.match(line, '^DOP="%-D%s(.-)"')
		end
		if string.match(line, "VISULIZER") then
			config.vis = string.match(line, '^VISULIZER="%-v"')
		end
		if string.match(line, "OPTIONS") then
			config.other = string.match(line, '^OPTIONS="(.-)"')
		end
		if string.match(line, "SERVER_IP") then
			config.server = string.match(line, '^SERVER_IP="%-s%s(.-)"')
		end
	end

	conf:close()

	return config
end

local function commalist(str, regexp)
	str = str .. ','
	regexp = "^" .. regexp .. "$"
	local match = false
	for w in string.gmatch(str, "(.-),") do
		if not string.match(w, regexp) then
			return false
		end
		match = true
	end
	return match
end

function validate(c)
	-- return error token or nil
	-- may change config for automagic...
	if c.name and string.match(c.name, "^(.-)%s") then
		c.name = string.match(c.name, "^(.-)%s")
	end
	if c.mac and not string.match(c.mac, "%x%x:%x%x:%x%x:%x%x:%x%x:%x%x") then
		return 'mac'
	end
	if c.priority and not (string.match(c.priority, "^%d+$") and tonumber(c.priority) >= 1 and tonumber(c.priority) <= 99) then
		return 'priority'
	end
	if c.rate and not (string.match(c.rate, "^%d+$") or string.match(c.rate, "^%d+%-%d+$") or commalist(c.rate,"%d+")) then
		return 'rate'
	end
	if c.buffer and not (string.match(c.buffer, "^%d+$") or string.match(c.buffer, "^%d+:%d+$")) then
		return 'buffer'
	end
	if c.codec and not commalist(c.codec, "%l+") then
		return 'codec'
	end
	if c.alsa and not (string.match(c.alsa, "^%d+") or string.match(c.alsa, "^%d-:%d-$") or string.match(c.alsa, "^%d-:%d-$:%.-$") or 
					   string.match(c.alsa, "^%d-:%d-:%.-:%d$") or string.match(c.alsa, "^%d-:%d-:%.-:%d-:%d$")) then
		return 'alsa'
	end
	if c.loglevel and not string.match(c.loglevel, "^%l+=%l+$") then
		return 'loglevel'
	end
	if c.server and not (string.match(c.server, "^%d+%.%d+%.%d+%.%d+$") or c.server == '^localhost$') then
		return 'server'
	end
	-- add resample param validation?
	if c.dop_params and not string.match(c.dop_params, "^%d+$") then
		return 'dop_params'
	end
	return nil
end

function set(config)
	local outconf = io.open(configFileTmp, "w")

	if outconf then
		outconf:write("# created by squeeze-web-gui-lua " .. os.date() .. "\n")

		if config.name     then outconf:write('NAME="-n ' .. config.name .. '"\n') end
		if config.mac      then outconf:write('MAC="-m ' .. config.mac .. '"\n') end
		if config.priority then outconf:write('PRIORITY="-p ' .. config.priority .. '"\n') end
		if config.rate     then outconf:write('MAX_RATE="-r ' .. config.rate .. '"\n') end
		if config.device   then outconf:write('AUDIO_DEV="-o ' .. config.device .. '"\n') end
		if config.buffer   then outconf:write('BUFFER="-b ' .. config.buffer .. '"\n') end
		if config.codec    then outconf:write('CODEC="-c ' .. config.codec .. '"\n') end
		if config.alsa     then outconf:write('ALSA_PARAMS="-a ' .. config.alsa .. '"\n') end
		if config.logfile  then outconf:write('LOG_FILE="-f ' .. config.logfile .. '"\n') end
		if config.loglevel then outconf:write('LOG_LEVEL="-d ' .. config.loglevel .. '"\n') end
		if config.vis      then outconf:write('VISULIZER="-v"\n') end
		if config.server   then outconf:write('SERVER_IP="-s ' .. config.server .. '"\n') end
		if config.other    then outconf:write('OPTIONS="' .. config.other .. '"\n') end
		if config.resample_params then
			outconf:write('UPSAMPLE="-u ' .. config.resample_params .. '"\n')
		elseif config.resample then
			outconf:write('UPSAMPLE="-u"\n')
		end
		if config.dop_params then
			outconf:write('DOP="-D ' .. config.dop_params .. '"\n')
		elseif config.dop then
			outconf:write('DOP="-D"\n')
		end
		
		outconf:close()
		
		util.execute("sudo sp-squeezeliteConfigUpdate " .. configFileTmp)
		util.execute("rm " .. configFileTmp)

		log.debug("wrote and updated config")
	else
		log.error("unable to write: " .. configFileTmp)
	end
end
