-- strings table - to do: only load required language?

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

local strings = {
	['languages'] = {
		['EN'] = "English",
		['DE'] = "German",
	},
	['index'] = {
		['EN'] = {
			title = "Web Configuration",
			language = "Language",
		},
	},
	['system'] = {
		['EN'] = {
			title = "System Configuration",
			hostname = "Host Name",
			timezone = "Time Zone",
			locale = "Locale",
			hostname_tip = "***",
			timezone_tip = "***",
			locale_tip = "***",
			os_version = "OS Version: ",
			fedora_version = "Fedora Version: ",
		},
	},
	['network'] = {
		['EN'] = {
			title_eth  = "Ethernet Interface Configuration",
			title_wlan = "Wireless Interface Configuration",
			name  = "Name",
			type  = "Type",
			wpa_state = "Wpa State",
			dhcp = "Use DHCP",
			on_boot = "On Boot",
			add_private = "User Specified (below):",
			ipaddr = "IP Address",
			netmask= "Netmask",
			gateway= "Gateway",
			dns1   = "DNS1",
			dns2   = "DNS2",
			dns3   = "DNS3",
			domain = "Domain",
			essid  = "Network Name",
			wpa_psk = "Wireless Password",
			int_down = "Interface Down",
			int_up = "Interface Up",
			int_downup = "Interface Down / Interface Up",
			ipaddr_tip = "***",
			netmask_tip = "***",
			gateway_tip = "***",
			dns1_tip = "***",
			dns2_tip = "***",
			dns3_tip = "***",
			domain_tip = "***",
			essid_tip = "***",
			wpa_psk_tip = "***",
			on_boot_tip = "***",
			dhcp_tip = "***",
		},
	},
	['squeezelite'] = {
		['EN'] = { 
			title = "Squeezelite Player Configuration and Control",
			name = "Name",
			mac  = "MAC Address",
			default_mac = "Default MAC to eth0 if not populated",
			device = "Audio Device",
			rate = "Sample Rates",
			logfile = "Log File",
			loglevel = "Log Level",
			priority = "RT Thread Priority",
			buffer = "Buffer",
			codec = "Codec",
			alsa = "Alsa Params",
			resample = "Resample",
			dop = "DoP",
			vis = "Visulizer", 
			other = "Other Options",
			server = "Server IP Address",
			advanced = "(Advanced)",
			name_tip = "Set the player name",
			mac_tip = "Set mac address, format ab:cd:ef:12:34:56",
			device_tip = "Specify output device",
			rate_tip = "***",
			logfile_tip = "Write debug output to specified file",
			loglevel_tip = "Set logging level, format: &lt;log&gt;=&lt;level&gt; [&lt;log&gt;=&lt;level&gt; &lt;log&gt;=&lt;level&gt; ...], logs: all|slimproto|stream|decode|output, levels=info|debug|sdebug",
			priority_tip = "Set RT thread priority (1-99)",
			buffer_tip = "***",
			codec_tip = "Restrict codecs loaded, format: codec1, codec2, codec3",
			alsa_tip = "***",
			resample_tip = "***",
			dop_tip = "***",
			vis_tip= "***",
			other_tip = "***",
			server_tip = "***",
			advanced_tip = "***",
		},
	},
	['squeezeserver'] = {
		['EN'] = {
			title = "Squeeze Server Control",
			web_interface = "SqueezeServer Web Interface",
		},
	},
	['storage'] = {
		['EN'] = {
			title = "Storage",
			mounts = "Mounted File Systems",
			localfs = "Mount Local Disk",
			cifs = "Mount Windows Share",
			nfs = "Mount NFS Share",
			disk = "Disk",
			network = "Network",
			user = "User",
			pass = "Password",
			mountpoint = "Mountpoint",
			type = "Type",
			options = "Options",
			mount = "Mount",
			unmount = "Unmount",
			mount_perm = "Mount Permanently",
		},
	},
	['shutdown'] = {
		['EN'] = {
			title = "Shutdown: Reboot or Halt the device",
			control = "Control",
			halt = "Halt",
			halt_desc = "To halt the device, press the <b>Halt</b> button and wait at least 30 seconds before removing power for the process to complete",
			reboot = "Reboot",
			reboot_desc = "To reboot the device, press the <b>Reboot</b> button",
			force_desc = "Force (-f) reboot / halt ",
		},
	},
	['faq'] = {
		['EN'] = {
			title = "FAQ",
		},
	},
	['help'] = {
		['EN'] = {
			title = "Help",
			help = "Help",
			text = "Coming soon...",
		},
	},
	['header'] = {
		['EN'] = {
			home = "Home",
			system = "System",
			ethernet = "Ethernet Interface",
			wireless = "Wireless Interface",
			storage = "Storage",
			shutdown = "Shutdown",
			faq = "FAQ",
			help = "Help",
			squeezelite = "Squeezelite Player",
			squeezeserver = "Squeeze Server",
		},
	},
	['footer'] = {
		['EN'] = {
			copyright = "Copyright",
			version = "Version",
		},
	},
	['base'] = { -- these are shared between all pages
		['EN'] = {
			brand_name = "Open Squeeze",
			logo_small = "static/os-logo-146x50.png",
			logo_small_alt = "Logo (small)",
			logo_small_width = "146",
			logo_small_height = "50",
			logo_large = "static/os-logo-541x288.png",
			logo_large_alt = "Logo (large)",
			logo_large_width = "541",
			logo_large_height = "288",
			status = "Status",
			service = "Service",
			refresh = "Refresh",
			enable  = "Enable",
			disable = "Disable",
			start   = "Start",
			stop    = "Stop",
			restart = "Restart",
			enable_start = "Enable and Start",
			disable_stop = "Disable and Stop",
			reset   = "Reset",
			save    = "Save",
			save_restart = "Save and Restart",
			configuration = "Configuration",
		},
		['DE'] = {},
	},
}

-- add metamethods so categories fallback to base within same language
for section, _ in pairs(strings) do
	if section ~= 'base' and section ~= 'languages' then
		for lang, _ in pairs(strings[section]) do
			setmetatable(strings[section][lang], { __index = strings['base'][lang] })
		end
	end
end

return strings
