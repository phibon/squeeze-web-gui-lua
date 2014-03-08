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
		samba = "Samba",
		nb_name = "Samba Name",
		nb_group = "Samba Workgroup",
		hostname_tip = "Hostname for your device",
		timezone_tip = "Select the timezone appropriate to your location",
		locale_tip = "Select the locale appropriate for your location",
		nb_name_tip = "Netbios name for samba file sharing",
		nb_group_tip = "Workgroup for Samba file sharing",
		version = "Version",
		os_version = "OS Version",
		fedora_version = "Fedora Version",
		context =
		"<ul><li>Use this page to set the configurations for the linux operating system running within your device.</li>" ..
		"<li><i><b>Hostname</b></i> sets the name for your device. This may be different from the name given to the player instance running on the device. You are likely to see this name from other devices on your network if they show names of machines on your network.</li>" ..
		"<li><i><b>Location</b></i> settings enable the timezone and language settings of the device to be set to your country.</li>" ..
		"<li><i><b>Samba</b></i> settings enable you to specify the settings for the local Windows file sharing server (Samba) within the device.  This is used so you can access disks which are mounted on device from other machines on your network.  Disks are mounted on the device using the Storage menu.</li></ul>",
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
		error_ipaddr0 = "Error setting IP Address",
		error_gateway0 = "Error setting Gateway",
		error_netmask0 = "Error setting Netmask",
		error_dns1 = "Error setting DNS1",
		error_dns2 = "Error setting DNS2",
		error_dns3 = "Error setting DNS3",
		error_static = "Error setting static address - IP Address, Netmask and Gateway required",
		context =
		"<ul><li>The current status of the interface is shown at the top of the page.  If no IP address is shown then the interface is not working correctly.</li>" ..
		"<li><i><b>On&nbsp;Boot</b></i> defines if the interface is activated when your device starts.  Ensure at least one of the interfaces has this set.</li>" ..
		"<li><i><b>DHCP</b></i> is normally selected to obtain IP addresing from your network.  Clear it if you prefer to define static IP address information.</li>" ..
		"<li><i>Save</i> conifiguration changes and select <i>Interface&nbsp;Down&nbsp;/&nbsp;Interface&nbsp;Up</i> to restart the interface with new parameters.</li></ul>",
		context_wifi = "<ul><li>For wireless networks you can select which network to use from the list of detected <i>Network&nbsp;Names</i> or define your own if it is hidden.  You should also specify a WPA Password.  Note that WPA/WPA2 with a pre-shared key is the only authentication option supported by the configuration page.</li></ul>",
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
		vis = "Visuliser", 
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
		error_mac = "Error setting MAC Address",
		error_priority = "Error setting RT Thread Priority",
		error_rate = "Error setting Rate",
		error_buffer = "Error setting Buffer",
		error_code = "Error setting Codec",
		error_alsa = "Error setting Alsa Params",
		error_loglevel = "Error setting Log Level",
		error_server = "Error settting Server",
		error_dop_params = "Error setting DoP Params",
		context = 
		"<ul><li>The <i><b>Status</b></i> area at the top of the page shows the current Squeezelite Player status and may be refreshed by pressing the <i>Refresh</i> button. Squeezelite can be <i>Enable</i>d, <i>Disable</i>d and <i>Restart</i>ed  using the respective buttons. The player will be reported as <i>active / running</i> if it is running correctly. If it fails to show this then check the configuration options and restart the player.</li>" ..
		"<li>Configuration options are specified in the fields to the left.  Update each field and click <i>Save</i> to store them or <i>Save&nbsp;and&nbsp;Restart</i> to store them and then restart the player using the new options.</li>" ..
		"<li><i><b>Name</b></i> allows you to specify the player name.  If you leave it blank, you can set the player name from within Squeezebox Server.</i>" ..
		"<li><i><b>Audio Device</b></i> specifies which audio output device to use and should always be set.  You should normally prefer devices with names starting <i>hw:</i> to directly drive the hardware output device.  If multiple devices are listed, try each device in turn and restart the player each time to find the correct device for your DAC.</li>" ..
		"<li><i><b>Alsa&nbsp;Params</b></i> specifies detailed Alsa configuration parameters and is not normally needed for your device to work.  Use it if the player status shows it is not running or to optimise audio playback if you experience drop outs. This field contains four parameters separated by ':' (colons), for example: '40:4:16:1'. Each field can be left out to use the default. They are:" ..
		"<ul>" ..
		"<li>Alsa <i>buffer time</i> in ms, or <i>buffer size</i> in bytes; (default 40), increase if you experience drop outs</li>" ..
		"<li>Alsa <i>period count</i> or <i>period size</i> in bytes; (default 4)</li>" ..
		"<li>Alsa <i>sample format</i> - one of 32, 24, 24_3 or 16; (default autodetect), try 16 if other values do not work</li>" ..
		"<li>Alsa <i>MMAP</i> - one of 0 or 1; (default autodetect), try 0 if other values do not work</li>" ..
		"</ul>" ..
		"<li>You may want to try '::16:0' or ':::0' if your device fails to start. Try '100:::' if you are experiencing drop outs.</li>" ..
		"<li><i><b>Sample&nbsp;Rates</b></i> allows you to specify the sample rates supported by the device so that it does not need to be present when Squeezelite is started.  Ether specify a single <i>maximum</i> sample rate, specify the <i>minimum</i> and <i>maximum</i> rates separated by '-' (dash without spaces), or specify all supported rates separated by commas.</li>" ..
		"<li><i><b>Resample</b></i> enables software resampling (upsampling) using the parameters specified. These are described in more detail <a href='/resample.html'>here</a>.</li>" ..
		"<li>Select <i><b>Dop</b></i> to indicate that your DAC supports DSP over PCM (DoP) playback. You may also specify a delay in ms when switching between PCM and DoP modes.</i>" ..
		"<li>Select <i><b>Visuliser</b></i> to enable support of the visuliser display within HDMI user interface.</li></ul>",
		context_advanced = 
		"<p><ul><li><i><b>Advanced</b></i> options shows additional options which you will normally not need to adjust. These include logging which is used to help debug problems.</li>" ..
		"<li>Adjust <i><b>Log&nbsp;Level</b></i> to adjust the level of logging information written to the <i><b>Log&nbsp;File</b></i> and shown in the log window at the bottom of this page. Click in the log window to start and stop update of the log window. Common log level settings are:</li>" ..
		"<ul><li>output=info</li><li>output=debug</li><li>decode=debug</li><li>all=debug</li></ul>" ..
		"</ul>",
	},
	['squeezeserver'] = {
		title = "Squeeze Server Control",
		web_interface = "SqueezeServer Web Interface",
		context =
		"<ul><li>The <i><b>Status</b></i> area at the top of the page shows the current status of the local Squeezebox Server which can run on your device.  It may be refreshed by pressing the <i>Refresh</i> button. The server can be <i>Enable</i>d, <i>Disable</i>d and <i>Restart</i>ed  using the respective buttons. The server will be reported as <i>active / running</i> if it is running correctly.</li>" ..
		"<li>If you have already have a Squeezebox server running on a different machine, you do not need to enable this server.</li>" ..
		"<li>Use the <i>SqueezeServer&nbsp;Web&nbsp;Interface</i> button to open a web session to the local Squeezebox Server if it is running.</li></ul>",
	},
	['storage'] = {
		title = "Storage",
		mounts = "File Systems",
		localfs = "Mount Local Disk",
		remotefs = "Mount Network Share",
		disk = "Disk",
		network = "Network Share",
		user = "User",
		pass = "Password",
		domain = "Domain",
		mountpoint = "Mountpoint",
		type = "Type",
		options = "Options",
		add = "Add",
		remove = "Remove",
		unmount = "Unmount",
		remount = "Remount",
		active = "active",
		inactive = "inactive",
		mountpoint_tip = "Location where mount appears on device filesystem",
		disk_tip = "Disk to mount",
		network_tip = "Network share to mount",
		type_tip = "Type of disk/share being mounted",
		user_tip = "Username for CIFS mount",
		pass_tip = "Password for CIFS mount",
		domain_tip = "Domain for CIFS mount (optional)",
		options_tip = "Additional mount options",
		context =
		"<ul><li>Use this menu to attach (mount) local and remote disks to your device for use with the internal Squeezebox Server.</li>" ..
		"<li>The <i><b>Mount&nbsp;Local&nbsp;Disk</b></i> section is used to attach local disks. Select one of the mountpoint options. This is the path where it will appear on the device file system. Select one of the disk options. You will not normally need to select the type of the disk as this is detected automatically from it's format.  Click <i>Add</i> to attach the disk to the device. If this is sucessful then an entry will appear in the <i>Mounted&nbsp;File&nbsp;Systems</i> area at the top of the page otherwise an error will be shown. If your disk has multiple partitions you may need to try each disk option in turn to find the correct one for your files.</li>" ..
		"<li>The <i><b>Mount&nbsp;Network&nbsp;Share</b></i> section is used to attach network shares. Select one of the mountpoint options. Then add the network share location and select the type of network share.  For Windows (Cifs) shares you will also be asked for a username, password and domain. You may not need to include all of these details. Click <i>Add</i> to attach the disk to the device. If this is successful then an entry will appear in the <i>Mounted&nbsp;File&nbsp;Systems</i> area at the top of the page otherwise an error will be shown.</li>" ..
		"<li>Mounted file systems will be re-attached when the device restarts if they are available.  To disconnect them click the <i>Remove</i> button alongside the mount entry in the <i>Mounted&nbsp;File&nbsp;Systems</i> area.</li></ul>",
	},
	['shutdown'] = {
		title = "Shutdown: Reboot or Halt the device",
		control = "Control",
		halt = "Halt",
		halt_desc = "To halt device.  Wait 30 seconds before removing power.",
		reboot = "Reboot",
		reboot_desc = "To reboot the device.",
		context =
		"<ul><li>Use this menu to reboot or shutdown (halt) your device.</li>" ..
		"<li>Please wait 30 seconds after halting the device before removing the power.</li></ul>",
	},
	['reboothalt'] = {
		halting = "Device shutting down - please wait 30 seconds before removing power",
		rebooting = "Device rebooting",
	},
	['faq'] = {
		title = "FAQ",
	},
	['resample'] = {
		title = "Resample",
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
