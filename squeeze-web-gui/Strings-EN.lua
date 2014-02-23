-- EN Strings
return {
	['languages'] = {
		EN = "English",
		DE = "German",
	},
	['index'] = {
		title = "Web Configuration",
		language = "Language",
	},
	['system'] = {
		title = "System Configuration",
		hostname = "Hostname",
		location = "Location",
		timezone = "Time Zone",
		locale = "Locale",
		hostname_tip = "Hostname for your device",
		timezone_tip = "Select the timezone appropriate to your location",
		locale_tip = "Select the locale appropriate for your location",
		version = "Version",
		os_version = "OS Version",
		fedora_version = "Fedora Version",
		context = "This page allows you to set the basic system configuration for your device.",
	},
	['network'] = {
		title_eth  = "Ethernet Interface Configuration",
		title_wlan = "Wireless Interface Configuration",
		interface = "Interface",
		state = "State",
		ipv4 = "IP Address",
		static = "Static",
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
		wpa_psk = "WPA Password",
		int_down = "Interface Down",
		int_up = "Interface Up",
		int_downup = "Interface Down / Interface Up",
		ipaddr_tip = "Enter static IP address",
		netmask_tip = "Enter network mask",
		gateway_tip = "Enter router address",
		dns1_tip = "Enter 1st DNS server address",
		dns2_tip = "Enter 2nd DNS server address (optional)",
		dns3_tip = "Enter 3rd DNS server address (optional)",
		domain_tip = "Enter DNS domain (optional)",
		essid_tip = "Select network SSID",
		other_ssid_tip = "Enter SSID if not found",
		wpa_psk_tip = "Enter WPA Password",
		on_boot_tip = "Enable this inteface at boot time",
		dhcp_tip = "Use DHCP to obtain IP address information",
		context = "This page allows you to set the network configuration.",
	},
	['squeezelite'] = {
		title = "Squeezelite Player Configuration and Control",
		name = "Name",
		audio_output = "Audio Output",
		mac  = "MAC Address",
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
		name_tip = "Player name (optional)",
		mac_tip = "Player mac address, format: ab:cd:ef:12:34:56 (optional)",
		device_tip = "Select output device",
		rate_tip = "Rates supported by device, format: <maxrate> | <minrate>-<maxrate> | <rate1>,<rate2>,<rate3> (optional)",
		logfile_tip = "Write debug output to specified file",
		loglevel_tip = "Logging level, format: <log>=<level>, logs: all|slimproto|stream|decode|output, levels=info|debug|sdebug",
		priority_tip = "RT thread priority (1-99) (optional)",
		codec_tip = "Restrict codecs loaded, format: codec1, codec2, codec3 (optional)",
		buffer_tip = "Set buffer size, format: <stream buffer>:<output buffer> in Kbytes (optional)",
		alsa_tip = "Alsa parameters, format: <b>:<p>:<f>:<m>, b = buffer time in ms or size in bytes, p = period count or size in bytes, f sample format (16|24|24_3|32), m = use mmap (0|1) (optional)",
		resample_tip = "Enable resampling",
		dop_tip = "Enable DSD over PCM (DoP)",
		resample_params_tip = "Resampling parameters",
		dop_params_tip = "Delay when switching between PCM and DoP (ms)",
		vis_tip= "Enable Visulizer display in Jivelite",
		other_tip = "Other optional configuration parameters",
		server_tip = "Server IP address (optional)",
		advanced_tip = "Show advanced options",
		context = "This is the help text for squeezelite.",
	},
	['squeezeserver'] = {
		title = "Squeeze Server Control",
		web_interface = "SqueezeServer Web Interface",
		context = "This is the help text for squeezeboxserver.",
	},
	['storage'] = {
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
	['shutdown'] = {
		title = "Shutdown: Reboot or Halt the device",
		control = "Control",
		halt = "Halt",
		halt_force = "Force Halt",
		halt_desc = "To halt device.  Wait 30 seconds before removing power.",
		reboot = "Reboot",
		reboot_force = "Force Reboot",
		reboot_desc = "To reboot the device.",
		force_tip = "Use force if the device does not respond",
		normal_tip = "Use normally",
		context = "This is help text for shutdown menu.",
	},
	['faq'] = {
		title = "FAQ",
	},
	['header'] = {
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
	['footer'] = {
		title = "Notes",
		copyright = "Copyright",
		version = "Version",
	},
	['base'] = { -- these are shared between all pages
		status = "Status",
		active = "Active",
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
		options = "Options",
		help = "Help",
	},
}
