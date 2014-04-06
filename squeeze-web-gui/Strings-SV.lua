-- SV Strings
return {
	['languages'] = {
		EN = "English",
		DE = "German",
		NL = "Dutch",
		SV = "Swedish",
	},
	['index'] = {
		title = "Webbkonfiguration",
		language = "Språk",
	},
	['system'] = {
		title = "Systemkonfiguration",
		hostname = "Värdnamn",
		location = "Region",
		timezone = "Tidszon",
		locale = "Språkinställning",
		samba = "Samba",
		nb_name = "Namn för Samba",
		nb_group = "Arbetsgrupp för Samba",
		hostname_tip = "Värdnamn för din enhet",
		timezone_tip = "Välj lämplig tidszon för din region",
		locale_tip = "Välj lämplig språkinställning för din region",
		nb_name_tip = "Netbios-namn för fildelning med Samba",
		nb_group_tip = "Arbetsgrupp för fildelning med Samba",
		version = "Version",
		os_version = "OS-version",
		fedora_version = "Fedora-version",
		context =
		"<ul><li>Använd denna sida för att konfigurera det Linux-operativsystem som körs inuti din enhet.</li>" ..
		"<li><i><b>Värdnamn</b></i> anger namnet för din enhet. Värdnamnet kan vara annorlunda än namnet för spelaren som körs på enheten. Du kan troligen hitta detta namn på dina andra nätverksenheter, om de kan visa namnen för enheterna på ditt nätverk.</li>" ..
		"<li><i><b>Region</b></i>-inställningarna möjliggör val av ditt lands tidszon och språk i enheten.</li>" ..
		"<li><i><b>Samba</b></i>-inställningarna möjliggör inställning av Samba, den lokala fildelningsserver för Windows som körs inuti enheten.  Samba används till att komma åt diskar som monterats på andra enheter i ditt nätverk.  Diskar monteras på enheten via menyn Lagring.</li></ul>",
	},
	['network'] = {
		title_eth  = "Konfiguration av nätverksinterface för Ethernet",
		title_wlan = "Konfiguration av trådlöst nätverksinterface",
		interface = "Interface",
		state = "Tillstånd",
		ipv4 = "IP-adress",
		static = "Statisk",
		name  = "Namn",
		type  = "Typ",
		wpa_state = "WPA-läge",
		dhcp = "Använd DHCP",
		on_boot = "Vid systemstart",
		add_private = "Användarspecificerad (nedan):",
		ipaddr = "IP-adress",
		netmask= "Nätmask",
		gateway= "Gateway",
		dns1   = "DNS1",
		dns2   = "DNS2",
		dns3   = "DNS3",
		domain = "Domän",
		essid  = "Nätverksnamn",
		wpa_psk = "WPA-lösenord",
		int_down = "Interface av",
		int_up = "Interface på",
		int_downup = "Interface av / på",
		ipaddr_tip = "Ange statisk IP-adress",
		netmask_tip = "Ange nätverksmask",
		gateway_tip = "Ange IP-adress för router",
		dns1_tip = "Ange IP-adress för namnserver DNS1",
		dns2_tip = "Ange IP-adress för namnserver DNS2 (valfritt)",
		dns3_tip = "Ange IP-adress för namnserver DNS3 (valfritt)",
		domain_tip = "Ange DNS-domän (valfritt)",
		essid_tip = "Välj nätverksnamn (SSID)",
		other_ssid_tip = "Ange nätverksnamn (SSID) manuellt om inget hittats",
		wpa_psk_tip = "Ange WPA-lösenord",
		on_boot_tip = "Aktivera detta interface vid systemstart",
		dhcp_tip = "Använd DHCP för att få uppgifter om IP-adresser",
		error_ipaddr0 = "Fel vid inställning av IP-adress",
		error_gateway0 = "Fel vid inställning av gateway",
		error_netmask0 = "Fel vid inställning av nätmask",
		error_dns1 = "Fel vid inställning av DNS1",
		error_dns2 = "Fel vid inställning av DNS2",
		error_dns3 = "Fel vid inställning av DNS3",
		error_static = "Fel vid inställning av statisk adress - IP-adress, nätmask och gateway krävs",
		context =
		"<ul><li>Status för interfacet visas längst upp på sidan.  Om ingen IP-adress visas så fungerar inte interfacet ordentligt.</li>" ..
		"<li><i><b>Vid&nbsp;omstart</b></i> definierar om interfacet ska aktiveras vid systemstart.  Se till att åtminstone ett interface har denna inställning.</li>" ..
		"<li><i><b>DHCP</b></i> väljs vanligen för att få information om IP-adresser på ditt nätverk.  Nollställ det om du föredrar att definiera en statisk IP-adress.</li>" ..
		"<li><i>Spara</i> ändringar i konfigurationen och välj <i>Interface&nbsp;av&nbsp;/&nbsp;på</i> för att starta om interfacet med nya parametrar.</li></ul>",
		context_wifi = "<ul><li>För trådlösa nätverk kan du välja nätverk att använda från listan av funna <i>Nätverksnamn</i> eller definiera ditt eget ifall det är dolt.  Du bör också specificera ett WPA-lösenord.  Notera att WPA/WPA2 med pre-shared key är det enda autentiseringsval som konfigurationssidan stöder.</li></ul>",
	},
	['squeezelite'] = {
		title = "Konfiguration och kontroll av spelaren Squeezelite Player",
		name = "Namn",
		audio_output = "Ljudutgång",
		mac  = "MAC-adress",
		device = "Ljudenhet",
		rate = "Samplingsfrekvenser",
		logfile = "Loggfil",
		loglevel = "Loggningsnivå",
		priority = "Prioritet för realtidstråd",
		buffer = "Buffert",
		codec = "Ljudkodare",
		alsa = "Parametrar för Alsa",
		resample = "Omsampla",
		dop = "DoP",
		vis = "Visualiserare", 
		other = "Andra alternativ",
		server = "Serverns IP-adress",
		advanced = "Avancerat",
		bit_16 = "16 bitar",
		bit_24 = "24 bitar",
		bit_24_3 = "24_3 bitar",
		bit_32 = "32 bitar",
		mmap_off = "Ej MMAP",
		mmap_on = "MMAP",
		dop_supported = "Enheten stöder DoP",
		name_tip = "Spelarnamn (valfritt)",
		device_tip = "Välj utenhet",
		alsa_buffer_tip = "Buffertstorlek för Alsa i ms eller bytes (valfritt)",
		alsa_period_tip = "Periodantal eller periodstorlek för Alsa i bytes (valfritt)",
		alsa_format_tip = "Samplingsformat för Alsa (valfritt)",
		alsa_mmap_tip = "Stöd för MMAP i Alsa (valfritt)",
		rate_tip = "Maximal samplingsfrekvens som stöds eller kommaseparerad lista av samplingsfrekvenser (valfritt)",
		rate_delay_tip = "Fördröjning vid byte av samplingsfrekvens i ms (valfritt)",
		dop_tip = "Aktivera DSD över PCM (DoP)",
		dop_delay_tip = "Fördröjning vid byte mellan PCM och DoP i ms (valfritt)",
		advanced_tip = "Visa avancerade alternativ",
		resample_tip = "Aktivera omsampling",
		vis_tip= "Aktivera visualiserare i Jivelite",
		resample_recipe = "Recept för SoXr",
		resample_options = "Alternativ för SoXr",
		very_high = "Väldigt Hög",
		high = "Hög",
		medium = "Mellan",
		low = "Låg",
		quick = "Snabb",
		linear = "Linjär fas",
		intermediate = "Intermediär fas",
		minimum = "Minimumfas",
		steep = "Brant filter",
		resample_options = "Alternativ för SoXr",
		flags = "Flaggor",
		attenuation = "Dämpning",
		precision = "Noggrannhet",
		pass_end = "Passbandets slut",
		stop_start = "Stoppbandets början",
		phase = "Fas",
		async = "Asynkron",
		exception = "Vid undantag",
		resample_quality_tip = "Omsamplingskvalitet (högre kvalitet ökar CPU-belastningen)",
		resample_filter_tip = "Filtertyp för omsampling",
		resample_steep_tip = "Använd brant filter",
		resample_flags_tip = "Omsamplingsflaggor (hexadecimala heltal), endast för avancerade användare",
		resample_attenuation_tip = "Dämpning i dB för att undvika klippning (1dB om inget anges)",
		resample_precision_tip = "Antal bitars noggrannhet (HQ = 20, VHQ = 28)",
		resample_end_tip = "Passbandets slut uttryckt som en procentsats (Nyquist-frekvensen = 100%)",
		resample_start_tip = "Stoppbandets början uttryckt som en procentsats (måste vara större än passbandets slut)",
		resample_phase_tip = "Fasrespons (0 = minimum, 50 = linjär, 100 = maximum)",
		resample_async_tip = "Omsampla asynkront till maximal samplingsfrekvens (omsamplar annars till maximal synkron samplingsfrekvens)",
		resample_exception_tip = "Omsampla endast när önskad samplingsfrekvens inte stöds av utenheten",
		info = "Information",
		debug = "Avlusa",
		trace = "Spåra",
		loglevel_slimproto_tip = "Loggningsnivå för kontrollsessionen för Slimproto",
		loglevel_stream_tip = "Loggningsnivå för strömning",
		loglevel_decode_tip = "Loggningsnivå för avkodning",
		loglevel_output_tip = "Loggningsnivå för utdata",
		logfile_tip = "Skriv avlusningsinformation till specificerad fil",
		buffer_stream_tip = "Buffertstorlek för ström i Kbyte (valfritt)",
		buffer_output_tip = "Buffertstorlek för utgång i Kbyte (valfritt)",
		codec_tip = "Kommaseparerad lista av ljudkodare att ladda (valfritt - laddar alla avkodare om inget anges)",
		priority_tip = "Prioritet för realtidstråd (1-99) (valfritt)",
		mac_tip = "Spelarens MAC-adress, format: ab:cd:ef:12:34:56 (valfritt)",
 		server_tip = "Serverns IP-adress (valfritt)",
		other_tip = "Andra valfria konfigurationsparametrar",
		error_alsa_buffer = "Fel vid inställning av buffert för Alsa",
		error_alsa_period = "Fel vid inställning av period för Alsa",
		error_rate = "Fel vid inställning av samplingsfrekvens",
		error_rate_delay = "Fel vid inställning av fördröjning vid ändring av samplingsfrekvens",
		error_dop_delay = "Fel vid inställning av fördröjning för DoP",
		error_resample_precision = "Fel vid inställning av noggrannhet för omsampling",
		error_resample_attenuation = "Fel vid inställning av dämpning för omsampling",
		error_resample_start = "Fel vid inställning av stoppbandets början vid omsampling",
		error_resample_end = "Fel vid inställning av stoppband för omsampling",
		error_resample_endstart = "Fel vid inställning av omsamplingsparametrar - passbandets slut får inte överlappa stoppbandets början",
		error_resample_phase = "Fel vid inställning av fasrespons för omsampling",
		error_buffer_stream = "Fel vid inställning av buffertstorlek för ström",
		error_buffer_output = "Fel vid inställning av buffertstorlek för utgång",
		error_codec = "Fel vid inställning av ljudkodare",
		error_priority = "Fel vid inställning av prioritet för realtidstråd",
		error_mac = "Fel vid inställning av MAC-adress",
		error_server = "Fel vid inställning av server",
		context = 
		"<ul><li><i><b>Status</b></i>-arean längst upp på sidan visar status för den nuvarande Squeezelite-spelaren och kan uppdateras genom att klicka på <i>Uppdatera</i>-knappen. Spelaren visas som <i>aktiv / igång</i> om den fungerar som den ska. Om detta inte visas så kontrollera konfigurationsparametrarna och starta om spelaren.</li>" ..
		"<li>Konfigurationsparametrarna specificeras i fälten till vänster.  Uppdatera fälten och klicka på <i>Spara</i> för att spara dem eller på <i>Spara&nbsp;och&nbsp;starta&nbsp;om</i> för att spara dem och sedan starta om spelaren med de nya parametrarna.</li>" ..
		"<li><i><b>Namn</b></i> ger möjlighet att välja spelarens namn.  Om du lämnar det tomt, så kan du ställa in det inuti Squeezebox Server.</i>" ..
		"<li><i><b>Ljudenhet</b></i> specificerar vilken ljudenhet som används och måste alltid ha ett värde.  Vanligen bör du använda ett namn som börjar med <i>hw:</i> för att kunna driva utenhetens hårdvara direkt.  Om flera enheter visas, prova en åt gången och starta om spelaren varje gång för att finna rätt enhet för din DAC.</li>" ..
		"<li><i><b>Parametrar&nbsp;för&nbsp;Alsa</b></i> möjliggör detaljerade inställningar av ljudutgången för Linux, Alsa, och behövs vanligen inte för att din enhet ska fungera.  Justera parametrarna om spelarens status visar att den inte körs eller för att optimera ljudavspelning om du märker av kortvariga ljudavbrott. Det finns fyra parametrar:" ..
		"<ul>" ..
		"<li>Alsa: <i>buffertlängd</i> i ms, eller <i>buffertstorlek</i> i bytes (40 om inget anges). Välj ett större värde om du märker av kortvariga ljudavbrott.</li>" ..
		"<li>Alsa: <i>periodantal</i> eller <i>periodstorlek</i> i bytes (4 om inget anges).</li>" ..
		"<li>Alsa: <i>samplingsformat</i> antal databitar som för varje sample sänds till Alsa - prova med 16 om inga andra värden fungerar.</li>" ..
		"<li>Alsa: <i>MMAP</i> aktiverar eller avaktiverar MMAP-läge för Alsa, vilket minskar CPU-belastningen, prova att avaktivera om spelaren inte startar.</li>" ..
		"</ul>" ..
		"<li><i><b>Samplingsfrekvenser</b></i> möjliggör att specificera de samplingsfrekvenser som stöds av enheten så att den inte behöver påslagen då Squeezelite startas.  Specificera antingen en enstaka <i>maximal</i> samplingshastighet, eller alla samplingshastigheter som stöds, kommaseparerade.  Du kan också lägga till en fördröjning i ms vid byte av samplingsfrekvens om din DAC kräver detta.</li>" ..
		"<li><i><b>DoP</b></i> möjliggör att välja att din DAC stöder uppspelning av DSD över PCM (DoP).  Du kan också lägga till en fördröjning i ms vid byte mellan PCM och DoP.</li></ul>",
		context_resample = 
		"<p><ul><li><i><b>Omsampling</b></i> aktiverar omsampling via mjukvara (uppsampling) med det högkvalitativa programbiblioteket SoX Resampler library.  Om inget annat anges, uppsamplas ljudet till den maximala synkrona samplingshastigheten som utenheten stöder.</li>" ..
		"<li>Valet <i><b>Asynkron</b></i> resamplar alltid till utgångens maximala samplingshastighet.  Valet <i><b>Vid undantag</b></i> resamplar endast när utenheten inte stöder samplingshastigheten för spåret som spelas upp.</li>" .. 
		"<li><i><b>Recept&nbsp;för&nbsp;SoXr</b></i> specificerar grundläggande recept för SoXr:" ..
		"<ul><li><i>Kvalitet</i> möjliggör val av kvalitet för omsamplingen. Rekommendabelt är att endast använda <i>Hög</i> kvalitet, som används om inget annat anges, (eller <i>Väldigt Hög</i> kvalitet. Notera att högre kvalitet ökar CPU-belastningen, vilken också ökar med samplingsfrekvensen.</li>" ..
		"<li><i>Filter</i> möjliggör val av filtrets fasrespons." ..
		"<li><i>Brant</i> möjliggör val av ett brant cutoff-filter.</li></ul>"..
		"<li><i><b>Alternativ&nbsp;för&nbsp;SoXr</b></i> specificerar avancerade alternativ, vilka ger finkorniga justeringsmöjligheter:"..
		"<ul><li><i>Flaggor</i> specificerar alternativflaggor för SoXr (hexadecimala heltal, endast för avancerade användare).</li>"..
		"<li><i>Attenuation</i> specificerar dämpning i dB för att undvika klippning vid omsampling (1dB om inget anges).</li>"..
		"<li><i>Passbandets slut</i> specificerar var passbandet slutar, uttryckt som en procentsats (Nyquist-frekvensen = 100%).</li>"..
		"<li><i>Stoppbandets början</i> specificerar var stoppbandet börjar, uttryckt som en procentsats (Nyquist-frekvensen = 100%).</li>"..
		"<li><i>Fasrespons</i> specificerar filtrets fas mellan 0 och 100 (0 = minimumfas, 25 = intermediär fas, 50 = linjär fas).</li>" ..
		"</ul>",
		context_advanced = 
		"<p><ul><li><i><b>Advancerat</b></i> visar ytterligare alternativ, som du vanligen inte behöver ändra. Dessa inkluderar loggning, som används för att hjälpa till med att avlusa problem.</li>" ..
		"<li>Ändra <i><b>Loggningsnivå</b></i> för varje av de fyra loggningskategorierna för att ändra mängden av loggningsinformation som skrivs till loggfilen och visas i loggfönstret längst ned på denna sida. Klicka inuti loggfönstret för att starta eller stoppa uppdateringen av loggfönstret.</li></ul>",
	},
	['squeezeserver'] = {
		title = "Kontroll av servern Squeezebox Server",
		web_interface = "Webbgränssnitt för Squeezebox-servern",
		context =
		"<ul><li><i><b>Status</b></i>-arean längst upp på sidan visar status för den lokala Squeezebox-servern som kan köras på din enhet.  Den kan uppdateras genom att klicka på knappen <i>Uppdatera</i>. Servern kan <i>Aktivera</i>s, <i>Avaktivera</i>s och <i>Startas om</i> via de respektive knapparna. Servern visas som <i>aktiv / igång</i> om den fungerar som den ska.</li>" ..
		"<li>Om du redan har en Squeezebox-server igång på en annan maskin, behöver du inte aktivera denna server.</li>" ..
		"<li>Använd knappen <i>Webbgränssnitt&nbsp;för&nbsp;Squeezebox-servern</i> för att öppna en webbsession mot den lokala Squeezebox-servern, om den körs.</li></ul>",
	},
	['storage'] = {
		title = "Lagring",
		mounts = "Filsystem",
		localfs = "Montera lokal disk",
		remotefs = "Montera nätverksdisk",
		disk = "Disk",
		network = "Nätverksdisk",
		user = "Användarnamn",
		pass = "Lösenord",
		domain = "Domän",
		mountpoint = "Monteringspunkt",
		type = "Typ",
		options = "Alternativ",
		add = "Lägg till",
		remove = "Ta bort",
		unmount = "Avmontera",
		remount = "Återmontera",
		active = "aktiv",
		inactive = "inaktiv",
		mountpoint_tip = "Mappen i enhetens filsystem, där den monterade disken återfinns",
		disk_tip = "Lokal disk att montera",
		network_tip = "Nätverksdisk att montera",
		type_tip = "Typ av disk för montering",
		user_tip = "Användarnamn för CIFS-montering",
		pass_tip = "Lösenord för CIFS-montering",
		domain_tip = "Domän för CIFS-montering (valfritt)",
		options_tip = "Extra monteringsalternativ",
		context =
		"<ul><li>Använd denna meny för att koppla (montera) lokala diskar och nätverksdiskar till din enhet, för användning av den interna Squeezebox-servern.</li>" ..
		"<li>Stycket <i><b>Montera&nbsp;lokal&nbsp;disk</b></i> används till att koppla lokala diskar till enheten. Välj ett av alternativen för monteringspunkten. Detta är den sökväg i enhetens filsystem, där disken kommer att återfinnas. Välj ett av diskalternativen. Du behöver vanligen inte välja disktyp, eftersom denna detekteras automatiskt utifrån dess format.  Klicka på <i>Lägg&nbsp;till</i> för att knyta disken till enheten. Om detta går bra kommer en rad tillkomma i arean för <i>Monterade&nbsp;filsystem</i> längst upp på sidan, om inte så kommer ett felmeddelande. Om din disk har flera partitioner kan du behöva prova diskalternativen, ett åt gången, tills du hittar det där dina filer finns." .. 
		"<li>Stycket <i><b>Montera&nbsp;nätverksdisk</b></i> används till att koppla nätverksdiskar till din enhet." ..
		"<li>Monterade filsystem kommer att återkopplas när enheten startas om, ifall de är tillgängliga.  För att koppla bort dem klicka på knappen <i>Ta&nbsp;bort</i> bredvid filsystemets rad i arean för <i>Monterade&nbsp;filsystem</i>",
	},
	['shutdown'] = {
		title = "Avstängning: starta om eller stäng av enheten",
		control = "Kontrollera",
		halt = "Stäng av",
		halt_desc = "Stänger av enheten. Vänta 30 sekunder innan strömmatningen avlägsnas.",
		reboot = "Starta om",
		reboot_desc = "Startar om enheten.",
		context =
		"<ul><li>Använd denna meny för att starta om eller stänga av din enhet.</li>" ..
		"<li>Vänta 30 sekunder efter det att enheten har stoppats innan strömmatningen avlägsnas.</li></ul>",
	},
	['reboothalt'] = {
		halting = "Enheten stängs av - vänta 30 sekunder innan strömmatningen avlägsnas.",
		rebooting = "Enheten startas om",
	},
	['faq'] = {
		title = "FAQ",
	},
	['resample'] = {
		title = "Omsampla",
	},
	['header'] = {
		home = "Hem",
		system = "System",
		ethernet = "Ethernet-interface",
		wireless = "Trådlöst interface",
		storage = "Lagring",
		shutdown = "Avstängning",
		faq = "FAQ",
		help = "Hjälp",
		squeezelite = "Squeezelite-spelare",
		squeezeserver = "Squeezebox-server",
	},
	['footer'] = {
		copyright = "Upphovsrätt",
		version = "Version",
	},
	['base'] = { -- these are shared between all pages
		status = "Status",
		active = "Aktiv",
		service = "Service",
		refresh = "Uppdatera",
		enable  = "Aktivera",
		disable = "Avaktivera",
		restart = "Starta om",
		reset   = "Nollställ",
		save    = "Spara",
		save_restart = "Spara och starta om",
		configuration = "Konfiguration",
		options = "Alternativ",
		help = "Hjälp",
	},
}
