-- NL Strings
return {
	['languages'] = {
		EN = "English",
		DE = "German",
		NL = "Dutch",
	},
	['index'] = {
		title = "Web Configuratie",
		language = "Taal",
	},
	['system'] = {
		title = "Systeemconfiguratie",
		hostname = "Hostnaam",
		location = "Locatie",
		timezone = "Tijdzone",
		locale = "Taalregio",
		samba = "Samba",
		nb_name = "Samba Naam",
		nb_group = "Samba Werkgroep",
		hostname_tip = "Hostnaam van uw toestel",
		timezone_tip = "Selecteer de gewenste tijdzone",
		locale_tip = "Selecteer de taalregio van uw locatie",
		nb_name_tip = "Samba Netbios naam voor het delen van bestanden",
		nb_group_tip = "Samba Werkgroep voor het delen van bestanden",
		version = "Versie",
		os_version = "OS Versie",
		fedora_version = "Fedora Versie",
		context =
		"<ul><li>Via deze pagina kan u de instellingen aanpassen van het Linux besturingsysteem van uw apparaat.</li>" ..
		"<li><i><b>Hostname</b></i> is de naam van uw apparaat. Deze kan verschillen van de naam van de speler instantie die op dit apparaat actief is. Deze naam wordt getoont in de lijst van namen van machines in uw netwerk als andere apparaten deze tonen.</li>" ..
		"<li><i><b>Locatie</b></i> instellingen defini&euml;ren de tijdzone en taal van het apparaat volgens uw locatie.</li>" ..
		"<li><i><b>Samba</b></i> instellingen specificeren de instellingen van de bestandsdeling van de Windows Server in dit apparaat. Dit wordt gebruikt zodat u toegang heeft tot de schijven van andere machines op het netwerk. Schijven worden gemonteerd via het Opslag menu.</li></ul>",
	},
	['network'] = {
		title_eth  = "Ethernet Interface Configuratie",
		title_wlan = "Draadloze Interface Configuratie",
		interface = "Interface",
		state = "Status",
		ipv4 = "IP Adres",
		static = "Vast",
		name  = "Naam",
		type  = "Type",
		wpa_state = "Wpa Status",
		dhcp = "Gebruik DHCP",
		on_boot = "Bij Opstart",
		add_private = "Gebruikersspecifiek (hieronder):",
		ipaddr = "IP Adres",
		netmask= "Netwerkmasker",
		gateway= "Gateway",
		dns1   = "DNS1",
		dns2   = "DNS2",
		dns3   = "DNS3",
		domain = "Domein",
		essid  = "Netwerknaam",
		wpa_psk = "WPA Wachtwoord",
		int_down = "Interface Uit",
		int_up = "Interface Aan",
		int_downup = "Interface Uit / Interface Aan",
		ipaddr_tip = "Voer vast IP adres in",
		netmask_tip = "Voer Netwerkmasker in",
		gateway_tip = "Voer router adres in",
		dns1_tip = "Voer 1st DNS server adres in",
		dns2_tip = "Voer 2de DNS server adres in (optioneel)",
		dns3_tip = "Voer 3de DNS server adres in (optioneel)",
		domain_tip = "Voer DNS domein in (optioneel)",
		essid_tip = "Selecteer Netwerk naam (SSID)",
		other_ssid_tip = "Voer SSID in indien niet gevonden",
		wpa_psk_tip = "Voer WPA wachtwoord in",
		on_boot_tip = "Gebruik deze interface bij het opstarten",
		dhcp_tip = "Gebruik DHCP om een IP adres te bekomen",
		error_ipaddr0 = "Fout instelling IP adres",
		error_gateway0 = "Fout instelling gateway adres",
		error_netmask0 = "Fout instelling netwerkmasker",
		error_dns1 = "Fout instelling DNS1",
		error_dns2 = "Fout instelling DNS2",
		error_dns3 = "Fout instelling DNS3",
		error_static = "Fout instelling vast adres - IP adres, netwerkmasker en gateway zijn verplicht",
		context =
		"<ul><li>De huidige status van de interface vindt u bovenaan deze pagina. Als er geen IP adres getoont wordt dan werkt de interface niet correct.</li>" ..
		"<li><i><b>Bij Opstart</b></i> bepaalt of de interface wordt geactiveerd wanneer het apparaat wordt gestart. Zorg ervoor dat deze instelling bij ten minste een interface gezet is.</li>" ..
		"<li><i><b>DHCP</b></i> zorgt ervoor dat een IP adres wordt toegekend door uw netwerk. Schakel dit uit als u liever een vast IP adres gebruikt.</li>" ..
		"<li><i>Opslaan</i> van configuratie wijzigingen en selecteer <i>Interface Uit / Interface Aan</i> om te interface te herstarten met de nieuwe instellingen.</li></ul>",
		context_wifi = "<ul><li>U kunt een draadloos netwerk selecteren uit de lijst van gevonden <i>netwerknamen</i> of voer je eigen netwerknaam in indien deze verborgen is. U moet ook een WPA wachtwoord invoeren. Merk op dat WPA/WPA2 met een pre-shared key de enige ondersteunde authenticatie optie is.</li></ul>",
	},
	['squeezelite'] = {
		title = "Squeezelite Speler Configuratie en Controle",
		name = "Naam",
		audio_output = "Audio uitgang",
		mac  = "MAC Adres",
		device = "Audio Apparaat",
		rate = "Samplefrequentie",
		logfile = "Log Bestand",
		loglevel = "Log Niveau",
		priority = "RT Thread Prioriteit",
		buffer = "Buffer",
		codec = "Codecs",
		alsa = "Alsa Parameters",
		resample = "Hersamplen",
		dop = "DoP",
		vis = "Visualiser", 
		other = "Andere Opties",
		server = "Server IP Adres",
		advanced = "Geavanceerd",
		bit_16 = "16 bit",
		bit_24 = "24 bit",
		bit_24_3 = "24_3 bit",
		bit_32 = "32 bit",
		mmap_off = "Geen MMAP",
		mmap_on = "MMAP",
		dop_supported = "Apparaat ondersteund DoP",
		name_tip = "Naam van speler (optioneel)",
		device_tip = "Selecteer uitvoerapparaat",
		alsa_buffer_tip = "Alsa buffergrootte in ms of bytes (optioneel)",
		alsa_period_tip = "Alsa periode graaf of grootte in bytes (optioneel)",
		alsa_format_tip = "Alsa sample-formaat (optioneel)",
		alsa_mmap_tip = "Alsa MMAP ondersteuning (optioneel)",
		rate_tip = " Max ondersteunde samplefrequentie of door komma's gescheiden lijst van samplefrequentie (optioneel)",
		rate_delay_tip = "Vertraging schakelen tussen samplefrequenties in ms (optioneel)",
		dop_tip = "DSD via PCM inschakelen (DoP)",
		dop_delay_tip = "Vetraging schakelen tussen PCM en DoP in ms (optioneel)",
		advanced_tip = "Toon geavanceerde opties",
		resample_tip = "Inschakelen resampling",
		vis_tip= " Visualizer weergave inschakelen in Jivelite",
		resample_recipe = "Soxr Recept",
		resample_options = "Soxr Opties",
		very_high = "Zeer Hoog",
		high = "Hoog",
		medium = "Medium",
		low = "Laag",
		quick = "Snel",
		linear = "Lineaire Fase",
		intermediate = "Tussenliggende Fase",
		minimum = "Minimale Fase",
		steep = "Steile Filter",
		resample_options = "Soxr Opties",
		flags = "Vlaggen",
		attenuation = "Demping",
		precision = "Precisie",
		pass_end = "Passband einde",
		stop_start = "Stopband lancering",
		phase = "Fase",
		async = "Asynchrone",
		exception = "Door de uitzondering",
		resample_quality_tip = "Kwaliteit hersamplen (hogere kwaliteit gebruikt meer verwerkingskracht)",
		resample_filter_tip = "Hersamplen type filter",
		resample_steep_tip = "Gebruik steile filter",
		resample_flags_tip = "Hersamplen vlaggen (Hexadecimaal geheel getal), alleen geavanceerde gebruikers",
		resample_attenuation_tip = "Toe te passen demping in dB om verzadiging te vermijden (standaard 1dB)",
		resample_precision_tip = "Bits van precisie, (HQ = 20, VHQ = 28)",
		resample_end_tip = "Passband einde als percentage (Nyquist = 100%)",
		resample_start_tip = "Stopband start als percentage (moet groter zijn dan passband einde)",
		resample_phase_tip = "Fase respons (0 = minimum, 50 = linear, 100 = maximum)",
		resample_async_tip = "Hersamplen asynchroon naar maximale sample-rate (anders hersamplen naar synchrone rate)",
		resample_exception_tip = "Hersamplen alleen wanneer gewenste sample-rate niet ondersteund wordt door het uitvoerapparaat",
		info = "Info",
		debug = "Debug",
		trace = "Traceren",
		loglevel_slimproto_tip = "Slimproto controle sessie logboekregistratieniveau",
		loglevel_stream_tip = "Streaming logboekregistratieniveau",
		loglevel_decode_tip = "Decoderen logboekregistratieniveau",
		loglevel_output_tip = "Niveau van de logboekregistratie voor uitvoer",
		logfile_tip = "Debug uitvoer naar opgegeven bestand schrijven",
		buffer_stream_tip = "Stream buffergrootte in Kbytes (optioneel)",
		buffer_output_tip = "Uitvoer buffergrootte in Kbytes (optioneel)",
		codec_tip = "Door komma's gescheiden lijst met codecs te laden (optioneel - alle codecs worden geladen indien blanco)",
		priority_tip = "RT thread prioriteit (1-99) (optioneel)",
		mac_tip = "Mac adres van speler, formaat: ab:cd:ef:12:34:56 (optioneel)",
 		server_tip = "IP adres Server (optioneel)",
		other_tip = "Andere optionele configuratie parameters",
		error_alsa_buffer = "Fout instelling Alsa buffer",
		error_alsa_period = "Fout instelling Alsa periode",
		error_rate = "Fout instelling samplefrequentie",
		error_rate_delay = "Fout instelling samplefrequentie vertraging",
		error_dop_delay = "Fout instelling DoP vertraging",
		error_resample_precision = "Fout instelling ressample precisie",
		error_resample_attenuation = "Fout instelling ressample demping",
		error_resample_start = "Fout instelling hersamplen stop band start",
		error_resample_end = "Fout instelling hersamplen stop band",
		error_resample_endstart = "Fout instelling resampling parameters - pass band einde mag niet overlapping met stop band start",
		error_resample_phase = "Fout instelling hersamplen fase respons",
		error_buffer_stream = "Fout instelling Stream buffergrootte",
		error_buffer_output = "Fout instelling uitvoer buffergrootte",
		error_codec = "Fout instelling Codecs",
		error_priority = "Fout instelling RT Thread Prioriteit",
		error_mac = "Fout instelling MAC Adres",
		error_server = "Fout instelling Server",
		context = 
		"<ul><li>Het <i><b>Status</b></i> gebied bovenaan deze pagina toont de huidige status van de Squeezelite speler en kan vernieuwd worden door op de knop <i>Vernieuwen</i> te drukken. De speler heeft de status <i>actief / wordt uitgevoerd</i> wanneer deze correct wordt uitgevoerd. Controleer de instellingen en herstart de speler indien dit niet het geval is.</li>" ..
		"<li>Configuratie-opties zijn opgegeven in de velden aan de linkerkant. Stel elk veld in en druk op <i>Opslaan</i> om de instellinegn op te slaan of druk op <i>Opslaan en herstart</i> om ze op te slaan en de speler te herstarten met de nieuwe instellingen.</li>" ..
		"<li>Mbv de optie<i><b>Naam</b></i> kan je de speler een naam geven. Indien je dit veld leeg laat dan kan je de naam via LMS instellen.</i>" ..
		"<li><i><b>Audio Apparaat</b></i> bepaalt welke audio uitgang van het apparaat er gebruikt wordt en moet altijd ingesteld zijn. Gebruik steeds apparaten met namen die met <i>hw:</i> beginnen. Als er meerdere apparaten in de lijst staan probeer dan elk apparaat en herstart de speler telkens tot je het juiste apparaat voor jouw DAC gevonden hebt</li>" ..
		"<li><i>Mbv <b>Alsa&nbsp;Parameters</b></i>  kan je geavanceerde audio instellingen wijzigen van het Linux systeem (Alsa). In princiepe hoef je deze niet aan te passen. Wijzig deze parameters indien de status aangeeft dat uw audio apparaat niet werkt of om de audioweergave te optimaliseren indien de weergave onderbroken wordt. Er zijn vier parameters:" ..
		"<ul>" ..
		"<li>Alsa <i>buffertijd</i> in ms, of <i>buffergrootte</i> in bytes; (standaard 40), verhoog deze waarde indien de weergave steeds onderbroken wordt.</li>" ..
		"<li>Alsa <i>period graaf</i> of <i>grootte</i> in bytes; (standaard 4).</li>" ..
		"<li>Alsa <i>sample-formaat</i> aantal bits van data die naar Alsa gestuurd worden voor elke sample - probeer 16 als andere waarden niet werken.</li>" ..
		"<li>Alsa <i>MMAP</i> in- of uitschakelen van Alsa MMAP mode welke de cpu belasting verleint. Probeer deze uit te schakelen als de speler niet start.</li>" ..
		"</ul>" ..
		"<li>Mbv <i><b>Samplefrequentie</b></i> is het mogelijk om de samplefrequentie(s) in te stellen die ondersteund worden door uw audioapparaat zodat deze niet aanwezig hoeft te zijn wanneer Squeezelite start. Ofwel geef je een <i>maximum</i> samplefrequentie, ofwel geef je een lijst van alle ondersteunde samplefrequenties gescheiden door comma's. Het is ook mogelijk om een vertraging op te geven in ms voor het schakelen tussen samplefrequenties als uw DAC dit vereist.</li>" ..
		"<li>Mbv <i><b>DoP</b></i> kan je aangeven dat uw DAC ondersteuning biedt voor DSP over PCM (DoP) weergave. Je kan ook een vertraging (in ms) opgeven om te schakelen tussen PCM en DoP modes.</li></ul>",
		context_resample = 
		"<p><ul><li><i><b>Hersamplen</b></i> schakelt software hersamplen in (upsampling) en gebruikt een kwalitatief hoogwaardige SoX bibliotheek. Standaard wordt audio geupsampled naar de maximale ondersteunde synchrone samplefrequentie van het uitvoerapparaat.</li>" ..
		"<li><i><b>Asynchroon</b></i> zal steeds hersamplen naar de hoogst mogelijke samplefrequentie. <i><b>Bij Uitzondering</b></i> gaat alleen hersamplen indien de samplefrequentie van het bestand niet ondersteund wordt door het uitvoerapparaat.</li>" .. 
		"<li><i><b>Soxr&nbsp;Recept</b></i> geeft het te gebruiken basis Soxr recept aan:" ..
		"<ul><li><i>Kwaliteit</i> selecteert de kwaliteit bij het hersamplen. Het wordt aanbevolen om alleen <i>Hoge</i> kwaliteit (standaard) of <i>Zeer hoge</i> kwaliteit te gebruiken. Merk op dat hogere kwaliteit, samen met hogere samplefrequenties, ook meer cpu rekenkracht vereist.</li>" ..
		"<li><i>Filter</i> selecteert het te gebruiken filter fase respons." ..
		"<li><i>Steil</i> selecteert een steile cutoff filter.</li></ul>"..
		"<li><i><b>Soxr&nbsp;Opties</b></i> selecteert geavanceerde opties voor fijne korrel aanpassing:"..
		"<ul><li><i>Vlaggen</i> selecteert hexadecimale Soxr optie vlaggen (alleen voor geavanceerde gebruikers).</li>"..
		"<li><i>Demping</i> selecteert een toe te passen demping in dB om verzadiging van het audiosignaal te voorkomen tijdens het hersamplen (standaard 1dB).</li>"..
		"<li><i>Passband Eind</i> hiermee geeft u aan waar de passband eindigt als percentage; 100 is de Nyquist-frequentie.</li>"..
		"<li><i>Stopband Start</i> hiermee geeft u aan waar de stopband begint als percentage; 100 is de Nyquist-frequentie.</li>"..
		"<li><i>Fase Respons</i>  selecteert de fase van het filter tussen 0 en 100; 0 = Minimum fase, 25 = Intermediaire fase en 50 = Lineaire fase.</li>" ..
		"</ul>",
		context_advanced = 
		"<p><ul><li><i><b>Geavanceerd</b></i> toont bijkomende opties die je in normale omstandigheden niet hoeft te wijzigen. Deze omvatten oa logboeken om te helpen bij het verhelpen van problemen.</li>" ..
		"<li><i><b>Logniveau</b></i> aanpassen voor elk van de vier logboeken en loginformatie die getoont wordt in het logvenster onderaan deze pagina. Klik in het logvenster om het opfrissen te starten en te stoppen.</li></ul>",
	},
	['squeezeserver'] = {
		title = "Squeeze Server Controle",
		web_interface = "SqueezeServer Web Interface",
		context =
		"<ul><li>Het <i><b>Status</b></i> venster bovenaan deze pagina toont de huidige status van de lokale Squeezebox Server. De informatie in het venster kan vernieuwd worden door op <i>Vernieuwen</i> te drukken. De server kan je <i>Inschakelen</i>d, <i>Uitschekelen</i>d en <i>Herstarten</i> door op de respectievelijke knoppen te drukken. Als de server correct functioneert dan is de status <i>actief / in uitvoering</i></li>" ..
		"<li>Als er reeds een Squeezebox Server draait op een andere machine in je netwerk dan hoef je de lokale Squeezebox Server niet te activeren.</li>" ..
		"<li>Mbv de <i>SqueezeServer&nbsp;Web&nbsp;Interface</i> knop kan je een web browser sessie openen naar de lokale Squeezebox Server als deze actief is.</li></ul>",
	},
	['storage'] = {
		title = "Opslag",
		mounts = "Bestandssysteem",
		localfs = "Koppel lokale schijf",
		remotefs = "Koppel netwerkschijf",
		disk = "Schijf",
		network = "Netwerkschijf",
		user = "Gebruiker",
		pass = "Wachtwoord",
		domain = "Domein",
		mountpoint = "Koppelpunt",
		type = "Type",
		options = "Opties",
		add = "Toevoegen",
		remove = "Verwijderen",
		unmount = "Ontkoppel",
		remount = "Koppel",
		active = "actief",
		inactive = "niet actief",
		mountpoint_tip = "Locatie waar de schijf / netwerkschijf in het bestandssysteem verschijnt",
		disk_tip = "Te koppelen schijf",
		network_tip = "Te koppelen netwerkshijf",
		type_tip = "Type schijf / netwerkschijf te koppelen",
		user_tip = "Gebruikersnaam voor CIFS koppel",
		pass_tip = "Wachtwoord voor CIFS koppel",
		domain_tip = "Domein voor CIFS koppel (optioneel)",
		options_tip = "Extra koppelopties",
		context =
		"<ul><li>Gebruik dit menu om lokale en externe schijven te koppelen met dit apparaat zodat ze toegankelijk zijn voor de lokale Squeezebox Server.</li>" ..
		"<li>Via het <i><b>Koppel Lokale Schijf</b></i> sectie is het mogelijk om lokale schijven te koppelen. Selecteer een van de koppelpunten. Dit is de locatie waar de schijf verschijnt in het bestandssysteem. Selecteer een van de schijfopties. In normale omstandigheden hoef je geen type schijf te selecteren omdat dit automatisch gedetecteerd wordt. Klik <i>Toevoegen</i> om de schijf te koppelen met dit apparaat. Als dit gelukt is dan verschijnt de schijf in de lijst van <i>Gekoppelde Bestandssystemen</i> bovenaan deze pagina. Indien uw schijf meer dan &eacute;&eacute;n partitie heeft dan moet je erop letten dat je de gewenste koppelt.</li>" ..
		"<li>Via het <i><b>Koppel Netwerkschijf</b></i> sectie kan je netwerkschijven koppelen. Selecteer een van de koppelpunten. Voer daarna het adres van de netwerkschijf in en selecteer het type. Voor Windows (Cifs) schijven moet je een gebruikersnaam, wachtwoord en optioneel een domein invoeren. Klik <i>Toevoegen</i> om de schijf te koppelen met dit apparaat. Als dit gelukt is dan verschijnt de schijf in de lijst van <i>Gekoppelde Bestandssystemen</i> bovenaan deze pagina.</li>" ..
		"<li>Gekoppelde bestandsystemen zullen automatisch opnieuw gekoppeld worden wanneer dit apparaat herstart en als ze beschikbaar zijn. Om ze te ontkoppelen klik je op de betreffende <i>Ontkoppel</i> knop in de <i>Gekoppelde Bestandssystemen</i> sectie.</li></ul>",
	},
	['shutdown'] = {
		title = "Afsluiten: reboot of stoppen van het apparaat",
		control = "Controle",
		halt = "Stop",
		halt_desc = "Apparaat stoppen. Wacht 30 seconden voor het verwijderen van de stroom.",
		reboot = "Herstart",
		reboot_desc = "Om het apparaat te herstarten.",
		context =
		"<ul><li>Gebruik dit menu om het apparaat te herstarten of te stoppen (halt).</li>" ..
		"<li>Let erop om minstens 30 seconden te wachten alvorens de stroom te verwijderen.</li></ul>",
	},
	['reboothalt'] = {
		halting = "Apparaat sluit af - Wacht 30 seconden voor het verwijderen van de stroom.",
		rebooting = "Apparaat herstart",
	},
	['faq'] = {
		title = "FAQ",
	},
	['resample'] = {
		title = "Resamplen",
	},
	['header'] = {
		home = "Home",
		system = "Systeem",
		ethernet = "Ethernet Interface",
		wireless = "Draadloze Interface",
		storage = "Opslag",
		shutdown = "Aflsuiten",
		faq = "FAQ",
		help = "Help",
		squeezelite = "Squeezelite Speler",
		squeezeserver = "Squeeze Server",
	},
	['footer'] = {
		copyright = "Copyright",
		version = "Versie",
	},
	['base'] = { -- these are shared between all pages
		status = "Status",
		active = "Actieve",
		service = "Diensten",
		refresh = "Vernieuwen",
		enable  = "Inschakelen",
		disable = "Uitschakelen",
		restart = "Herstarten",
		reset   = "Reset",
		save    = "Opslaan",
		save_restart = "Opslaan en Herstarten",
		configuration = "Configuratie",
		options = "Opties",
		help = "Help",
	},
}