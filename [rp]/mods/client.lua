
engineSetAsynchronousLoading(true, true)

local mapped_models = {}

local models = {
	vehicles = {
		{"Mercedes-Benz-G63-2018", true, true, false, 579, "Mercedes-Benz G63 2018"};
		{"SeatLeonFR2019", true, true, false, 405, "Seat Leon FR 2019"};
		{"KoenigseggOne2014", true, true, false, 411, "Koenigsegg One 2014"};
		{"ToyotaLandCruiser200V8", true, true, false, 490, "Toyota Land Cruiser 200 V8"};
		{"McLarenP1", true, true, false, 587, "McLaren P1"};
		{"BMW_E34", true, true, false, 540, "BMW E34"};
		{"Mercedes-Benz-C63-AMG-Coupe", true, true, false, 562, "Mercedes-Benz C63 AMG Coupe"};
		{"Nissan-GT-R-R35-2014", true, true, false, 527, "Nissan GT-R R35 2014"};
		{"Mercedes-Benz-S-Class-1990", true, true, false, 445, "Mercedes-Benz S Class 1990"};
		{"Rolls-Royce-Cullinan-2018", true, true, false, 400, "Rolls-Royce Cullinan 2018"};
		{"Chrysler-300-2020", true, true, false, 604, "Chrysler 300 2020"};
		{"LandRoverRangeRoverEvoque2012", true, true, false, 489, "Land Rover Range Rover Evoque 2012"};
		{"BugattiChiron2017", true, true, false, 559, "Bugatti Chiron 2017"};
		{"LexusGS350FSport2012", true, true, false, 547, "Lexus GS350 F Sport 2012"};
		{"LamborghiniGallardo", true, true, false, 555, "Lamborghini Gallardo LP570-4 Superleggera '11 LQ"};
		{"LamborghiniAsterion", true, true, false, 451, "Lamborghini Asterion"};
		{"MaseratiGranTurismoMCSLine2008", true, true, false, 541, "Maserati GranTurismo MC S Line 2008"};
		{"PorscheCarrera2019", true, true, false, 526, "Porsche 911 (992) Carrera 2019"};
		{"SubaruImprezaWRXSTi", true, true, false, 529, "Subaru Impreza WRX STi '08"};
		{"LexusLS500FSport2019", true, true, false, 566, "Lexus LS 500 F Sport 2019"};
		{"FordShelbyGT5002013", true, true, false, 477, "Ford Shelby GT500 2013"};
		{"Mercedes-AMG-C63", true, true, false, 565, "Mercedes-AMG C63 Coupe 2016"};
		-- {"BMW750Li", true, true, 30001, 546, "BMW 750Li"};
		{"BMW750Li", true, true, false, 546, "BMW 750Li"};
		{"mer_c63", true, true, false, 466, "Mercedes-Benz C63 2010"};
		{"camry2019", true, true, false, 561, "Toyota Camry 2019"};
		{"dodge_challenger2015", true, true, false, 415, "Dodge Challenger 2015"};
		{"DodgeChargerSRT2020", true, true, false, 560, "Dodge Charger SRT 2020"};
		{"bmw-m5-2019", true, true, false, 421, "BMW M5 Competition 2019"};
		{"benGT", true, true, false, 542, "Bentley Continental GT"};
		{"ford_raptor_2018", true, true, false, 554, "Ford F150 Raptor 2017"};
		{"JeepWrangler", true, true, false, 500, "Jeep Wrangler"};
		{"jeep-grand-2014", true, true, false, 404, "Jeep Grand Cherokee SRT 2014"};

		{"copcarla", true, true, false, 596, "Police Car 1"};
		{"copcarsf", true, true, false, 597, "Police Car 2"};
		-- {"copcarvg", true, true, false, 598, "Police Car 3"};
		{"fbiranch", true, true, false, 598, "FBI Car 4"};
		
		{"MercedesBenzEClass2017", true, true, false, 567, "Mercedes Benz E Class 2017"};
		{"RangeRoverSVR2017", true, true, false, 458, "Land Rover Range Rover Sport SVR 2017"};
		{"MitsubishiLancerGT2014", true, true, false, 550, "Mitsubishi Lancer 2.0 GT 2014"};
		{"NissanVersa2019", true, true, false, 580, "Nissan Versa 2019"};
		{"ChevroletImpala2018", true, true, false, 426, "Chevrolet Impala 2018"};

		{"DHL", true, true, false, 482, "Peugeot Boxer DHL"};
		{"ToyotaSupra", true, true, false, 506, "Toyota Supra D.M.P."};

		{"ChevroletTahoe2015", true, true, false, 479, "Chevrolet Tahoe 2015"};
		{"NissanSkylineGT-R34", true, true, false, 436, "Nissan Skyline GT-R34"};
		{"Chevrolet454SS", true, true, false, 422, "Chevrolet 454SS C1500 1990"};
		{"ChevroletCapriceBrougham1986", true, true, false, 585, "Chevrolet Caprice Brougham 1986 2.1"};
		{"ChevroletCamaro2016", true, true, false, 549, "Chevrolet Camaro 2016"};
		{"ChevroletCapriceClassic1992", true, true, false, 467, "Chevrolet Caprice Classic 1992"};
		{"ChevroletCorvetteC7", true, true, false, 429, "Chevrolet Corvette C6"};
		-- {"ChevroletCorvette", true, true, false, 558, "Chevrolet Corvette Z06"};
		{"AudiRS7", true, true, false, 516, "Audi RS7"};
		{"patriot", true, true, false, 470, "Army Patriot"};
		{"defender", true, true, false, 601, "Defender"};
		{"cargobob", true, true, false, 548, "Cargobob"};
		{"Mercedes-BenzW223", true, true, false, 507, "Mercedes-Benz W223"};
		{"RRPhantomLimousine", true, true, false, 409, "Rolls Royce Phantom Limousine"};
		{"KiaOptima", true, true, false, 551, "Kia Optima"};
		{"VolvoXC90", true, true, 30001, 579, "Volvo XC90 2017"};
		{"HondaAccord", true, true, false, 492, "Honda Accord"};
		{"LexusLX570", true, true, 30002, 579, "Lexus LX 570"};
		{"HyundaiGenesisG90", true, true, 30003, 426, "Hyundai Genesis G90 2020"};
		{"ToyotaAvalon", true, true, 30004, 560, "Toyota Avalon Hybrid 2019"};
		{"PorscheMacan", true, true, 30005, 579, "Porsche Macan Turbo 2016"};
		{"InfinitiQ50EauRouge", true, true, 30006, 560, "Infiniti Q50 EauRouge"};
		{"Mercedes-BenzGLEAMG", true, true, 30007, 579, "Mercedes-Benz GLE AMG"};
		{"BMWM5", true, true, 30008, 579, "BMW M5 F90"};
		{"Mercedes-MaybachS650", true, true, 30009, 409, "Mercedes-Maybach S650"};
		-- {"ChevroletCapriceLS", true, true, 30006, 560, "Chevrolet Caprice LS 2016"};
		{"is350", true, true, 30010, 560, "Lexus IS350"};
		{"Phantom2021", true, true, 30011, 560, "Rolls Royce Phantom 2021"};
		
-- Season 3 
		{"BMWM8Competition", true, true, 30012, 560, "BMW M8 Competition"};
		{"HondaAccord2020", true, true, 30013, 560, "Honda Accord 2020"};

		{"BMWM340i", true, true, 30014, 560, "BMW M340i 2019"};
		{"BMWM4CSL", true, true, 30015, 560, "BMW M4 CSL"};
		{"BMW760i2022", true, true, 30016, 560, "BMW 760i 2022"};
		{"AudiRS3", true, true, 30017, 560, "Audi RS3 8V"};
		{"FerrariF430", true, true, 30018, 560, "Ferrari F430 Scuderia Pack 2008"};
		{"Cargoship", true, true, 30019, 560, "Driveable San Fierro Cargoship"};


		{"AMCJavelinSpeedevil-1968", true, true, 30020, 560, "AMC Javelin Speedevil 1968"};
		{"BentleyContinental-2020", true, true, 30021, 560, "Bentley Continental 2020"};
		{"ChevroletC10Low-1972", true, true, 30022, 560, "Chevrolet C10 Low 1972"};
		{"FordFocusRS3-2018", true, true, 30023, 560, "Ford Focus RS3 2018"};
		{"JeepGrandCherokeeSRT-2014", true, true, 30024, 560, "Jeep Grand Cherokee SRT 2014"};
		{"LexusLX570-2021", true, true, 30025, 560, "Lexus LX570 2021"};
		{"Mazda3-2008", true, true, 30026, 560, "Mazda3 2008"};
		{"Mazda3FullTuning-2008", true, true, 30027, 560, "Mazda 3 FullTuning 2008"};
		{"MercedesBenzSClassW222-2019", true, true, 30028, 560, "MercedesBenz SClass W222 2019"};
		{"MiniCooperl-2002", true, true, 30029, 560, "Mini Cooperl 2002"};
		{"RollsRoyceDawn-2016", true, true, 30030, 560, "RollsRoyce Dawn 2016"};
		{"LamborghiniGallardo-2008", true, true, 30031, 560, "Lamborghini Gallardo 2008"};
		-- {"PorscheTaycanTurboS-2020", true, true, 30032, 560, "Porsche Taycan Turbo S '20"};
		{"FordFocusST-2019", true, true, 30033, 560, "Ford Focus ST 2019"};
		{"HondaCivicEK3", true, true, 30034, 560, "Honda Civic EK3"};
		{"NissanSkylineGT-R33", true, true, 30035, 560, "Nissan Skyline GT-R 33"};
		{"Nissan240SX", true, true, 30036, 560, "Nissan 240SX"};
		{"BMWM1", true, true, 30037, 560, "BMW M1"};
		{"MitsubishiLancerEvolutionVIII", true, true, 30038, 560, "Mitsubishi Lancer Evolution VIII"};
		{"NissanFairladyZ30", true, true, 30039, 560, "Nissan Fairlady Z 30"};
		{"ToyotaSupraA90", true, true, 30040, 560, "Toyota Supra A90"};
		{"BugattiDivo-2019", true, true, 30041, 560, "Bugatti Divo 2019"};
		{"RollsRoyceWraith-2022", true, true, 30042, 560, "RollsRoyce Wraith 2022"};
		{"TeslaSemi", true, true, 30043, 560, "Tesla Semi"};
		{"TeslaRoadster-2020", true, true, 30044, 560, "Tesla Roadster 2020"};
		{"TeslaCybertruck", true, true, 30045, 560, "Tesla Cybertruck"};
		{"Mclaren720s-2022", true, true, 30046, 560, "Mclaren 720s 2022"};
		{"LamborghiniAventador-2018", true, true, 30047, 560, "Lamborghini Aventador 2018"};
		{"ChevroletCorvette-2020", true, true, 30048, 560, "Chevrolet Corvette 2020"};
		{"MercedesBenzSClass-2021", true, true, 30049, 560, "MercedesBenz SClass 2021"};
		{"FordTaurus-2015", true, true, 30050, 560, "Ford Taurus 2015"};
		{"CadillacDTS-2006", true, true, 30051, 560, "Cadillac DTS 2006"};
		{"FordFusion-2020", true, true, 30052, 560, "FordFusion-2020"};
		{"CadillacCTS-V-2019", true, true, 30053, 560, "Cadillac CTS-V 2019"};
		{"ToyotaSequoia-2011", true, true, 30054, 560, "Toyota Sequoia 2011"};
		{"page-MAZ-206", true, true, 30055, 560, "Bus"};
		{"VolkswagenUp-2014", true, true, 30056, 560, "Volkswagen Up 2014"};
		{"FordExplorerST-2021", true, true, 30057, 560, "Ford Explorer ST 2021"};
		{"BruteAmbulance", true, true, false, 416, "Brute Ambulance"};
		{"LAPDCVPI01CentralDivision", true, true, 30058, 560, "LAPD CVPI 01 Central Division"};
		{"LexusISF-2014", true, true, 30059, 560, "Lexus IS F 2014"};
		{"firetruk", true, true, false, 407, "Firetruk"};
		-- {"military-ferry", true, true, 30060, 454, "Military Ferry"};
		{"HummerH2", true, true, 30060, 560, "Hummer H2"};
		{"BRABUSG500-2020", true, true, 30061, 560, "BRABUS G500 2020"};
		{"LandRoverRangeRoverSupercharged-2008", true, true, 30062, 560, "Land Rover Range Rover Supercharged 2008"};
		{"InfinitiQ60", true, true, 30063, 560, "Infiniti Q60"};
		{"KiaCeratoGT-2022", true, true, 30064, 560, "Kia Cerato GT 2022"};
		{"SubaruBRZ", true, true, 30065, 560, "Subaru BRZ"};
		{"Mercedes-BenzVisionAVTR", true, true, 30066, 560, "Mercedes-Benz Vision AVTR"};
		-- {"ChevroletCapriceLS-2015", true, true, 30067, 560, "Chevrolet Caprice LS 2015"};
		{"HyundaiVeloster", true, true, 30067, 560, "Hyundai Veloster"};
		{"GMCSierra-2019", true, true, 30068, 560, "GMC Sierra 2019"};
		{"ChevroletSilverado-2000", true, true, 30069, 560, "Chevrolet Silverado 2000"};
		{"ToyotaHiLux-2014", true, true, 30070, 560, "Toyota HiLux 2014"};
		{"NISSANDDSN-2014", true, true, 30071, 560, "Nissan DDSN 2014"};
		{"CadillacEscalade-2021", true, true, 30072, 560, "Cadillac Escalade 2021"};
		{"MustangGT-2020", true, true, 30073, 560, "Mustang GT 2020"};
		{"BentleyTurboR-1991", true, true, 30074, 560, "Bentley Turbo R 1991"};
		{"Mercedes-BenzAMGGTRCoupe", true, true, 30075, 560, "Mercedes-Benz AMG GTR Coupe"};
		{"TeslaModelSPlaid", true, true, 30076, 560, "Tesla Model S Plaid"};
		{"GMCSierra", true, true, 30077, 560, "GMC Sierra"};
		{"AstonMartinDBSSuperleggera-2019", true, true, 30078, 560, "Aston Martin DBS Superleggera 2019"};
		
		{"AudiRS7-2021", true, true, 30079, 560, "Audi RS7 2021"};
		{"Mercedes-BenzCLS63", true, true, 30080, 560, "Mercedes-Benz CLS 63"};
		{"AstonMartinVulcanHQ-2016", true, true, 30081, 560, "Aston Martin Vulcan HQ 2016"};
		{"AudiR8V10-2020", true, true, 30082, 560, "Audi R8 V10 2020"};
		{"BMWM2CSL", true, true, 30083, 560, "BMW M2 CSL"};
		{"FiatAbarth595", true, true, 30084, 560, "Fiat Abarth 595"};
		{"BentleyMullinerBacalar", true, true, 30085, 560, "Bentley Mulliner Bacalar"};
		{"RollsRoyceWraith", true, true, 30086, 560, "Rolls Royce Wraith"};
		{"HyundaiSonataTurbo-2020", true, true, 30087, 560, "Hyundai Sonata Turbo 2020"};
		{"VAZ-2329Lesnik", true, true, 30088, 560, "VAZ-2329 Lesnik"};
		{"N417SPPolice", true, true, false, 497, "N417SP Police"};
		{"Mercedes-BenzE63AMG", true, true, 30089, 560, "Mercedes-Benz E63s"};
		{"Mercedes-BenzE63AMGW212", true, true, 30090, 560, "Mercedes-Benz E63 AMG W212"};


		{"BicycleStork", true, true, false, 509, "Bicycle Stork"};


	-- 	{"elegant", true, true, false, 445, "Mercedes-Benz 1992"};
	-- 	{"audi_a6", true, true, false, 551, "Audi A6"};
	-- 	{"dodge_challenger2015", true, true, false, 415, "Dodge Challenger 2015"};
	-- 	{"MercedesBenzS63AMG2014", true, true, false, 426, "Mercedes Benz S63 AMG 2014"};
	-- 	{"NissanPatrolnismo", true, true, false, 579, "Nissan Patrol nismo"};
	-- 	{"RollsRoyceWraith14", true, true, false, 401, "Rolls Royce Wraith 14"};
	-- 	{"FerrariF12Berlinetta", true, true, false, 451, "Ferrari F12 Berlinetta"};
	-- 	-- {"LexusISF", true, true, false, 547};
	-- 	{"LexusIS300RocketBunny", true, true, false, 547, "Lexus IS300 Rocket Bunny"};
	-- 	{"BMW_M5_E60_2009", true, true, false, 540, "BMW M5 E60 2009"}; --546
	-- 	{"ToyotaCorolla", true, true, false, 546, "Toyota Corolla"}; --546
	-- 	-- {"MercuryGrandMarquis", true, true, false, 507, "Mercury Grand Marquis"}; --402
	-- 	{"HondaAccord", true, true, false, 550, "Honda Accord"};
	-- 	{"ToyotaCamry2010", true, true, false, 405, "Toyota Camry 2010"};
	-- 	{"DodgeChargerSRT2020", true, true, false, 560, "Dodge Charger SRT 2020"};
	-- 	{"VolkswagenGolfGTI2014", true, true, false, 589, "Volkswagen Golf GTI 2014"};
	-- 	{"HyundaiSonata2015", true, true, false, 421, "Hyundai Sonata 2015"};
	-- 	{"NissanAltima17", true, true, false, 529, "Nissan Altima 17"};
	-- 	{"FordTaurus2010", true, true, false, 580, "Ford Taurus 2010"};
	-- 	{"FordMustangGT2013", true, true, false, 562, "Ford Mustang GT 2013"};
	-- 	-- {"ChevroletSuburban2015", true, true, false, 490, "Chevrolet Suburban 2015"};
	-- 	-- {"SubaruLegacy", true, true, false, 467, "Subaru Legacy"};
	-- 	-- {"FordExplorer2013", true, true, false, 400, "Ford Explorer 2013"}; -- has problem 
	-- 	--https://updatesa.multitheftauto.com/sa/trouble/?v=1.5.9-9.21166.0.000&id=867DFA0004403B4FB4A11C2F197CED13&tr=gta-upgrade-fail&id=400&upgid=1009&frame=15
	-- 	{"FordF150Lobo", true, true, false, 418, "Ford F150 Lobo"};
	-- 	{"ChevroletCaprice1989", true, true, false, 458, "Chevrolet Caprice 1989"};
	-- --- police vehicles
	-- 	{"PoliceCharger", true, true, false, 598, "Police - Charger"};
	-- 	{"PoliceFord", true, true, false, 597, "Police - Ford"};
	-- 	{"PoliceSwatTaho", true, true, false, 490, "Police - SWAT Taho"};
	-- 	{"PoliceTaho", true, true, false, 599, "Police - Taho"};


	-- 	-- {"561", true, true, false, 561, "KIA Optima"}; -- bad
	-- 	{"496", true, true, false, 496, "Mini John Cooper Works GP 2013"};

	-- 	{"587", true, true, false, 587, "Porsche 911 Carrera"};
	-- 	{"439", true, true, false, 558, "BMW Z4sDrive35i Roadster"};
	-- 	{"551", true, true, false, 541, "Bugatti Centodieci EB110"};
	-- 	-- {"405", true, true, false, 405, "Ferrari Aperta17"};
	-- 	{"555", true, true, false, 555, "Mazda MX5"};

	-- 	-- {"585", true, true, false, 585, "lexus ES350"};
	-- 	{"507", true, true, false, 507, "Lexus LFA2011"};
	-- 	{"526", true, true, false, 526, "Lexus LS460"};

	-- 	{"451", true, true, false, 439, "BMW 750Li"};
	-- 	-- {"445", true, true, false, 445, "Mercedes-Benz 560SEL"};
	-- 	{"467", true, true, false, 467, "Nissan GTR"};
	-- 	{"516", true, true, false, 516, "BMW5-Series-528ixDrive"};

	-- 	{"400", true, true, false, 411, "Lamborghini Veneno14"};
		
	-- 	{"604", true, true, false, 604, "BMW M5 F90 Competition S5P 2019"};
	-- 	{"527", true, true, false, 527, "Aston Martin DBS Superleggera"};
	-- 	{"559", true, true, false, 559, "Dodge Challenger 1970"};
	-- 	{"477", true, true, false, 506, "Ferrari Laferrari"};
	-- 	-- {"489", true, true, false, 489, "Lexus LX"};
	-- 	{"LEXUSIS350F", true, true, false, 566, "LEXUS IS350 F-SPORT 2014"};
	-- 	{"rancher", true, true, false, 505, "Range Rover Sport 2012"};
	-- 	{"lexusLSF", true, true, false, 585, "Lexus LS 500 F Sport 2019"}; --492
	-- 	{"euros", true, true, false, 492, "Audi RS5 Coupe 2020"};
	-- 	{"Mercedes-AMG-C63", true, true, false, 565, "Mercedes-AMG C63 Coupe 2016"};
	-- 	{"mer_c63", true, true, false, 466, "Mercedes-Benz C63 2010"};
	-- 	-- {"ToyotaSupra", true, true, false, 474, "Toyota Supra A80"};
	-- 	{"camry2019", true, true, false, 561, "Toyota Camry 2019"};
	-- 	{"MercedesBenzGLECoupe", true, true, false, 479, "Mercedes Benz GLE Coupe"};

	};

	skins = {
		-- {"HelenaDouglasv23", true, true, false, 191, "Helena Douglas 1"};
		-- {"HelenaCasualv22", true, true, false, 192, "Helena Douglas 2"};
		-- {"bfori", true, true, false, 105, "Skin 1"};
		-- {"bmycr", true, true, false, 106, "Skin 2"};
		-- {"male01", true, true, false, 107, "Skin 3"};
		-- {"Fem2", true, true, false, 214, "Skin 4"};
		-- {"Male3", true, true, false, 84, "Skin 5"};
		-- {"Randm2", true, true, false, 308, "Skin 6"};
		{"sfpolice", true, true, false, 280, "SF Police Officer"};
		{"sfpd1", true, true, false, 281, "SF Police Officer"};
		{"fbi", true, true, false, 286, "FBI"};
		{"wmyplt", true, true, false, 311, "Army General"};
		{"general2", true, true, false, 255, "Army General 2"};
		{"guard163", true, true, false, 163, "Guard 1"};
		{"guard164", true, true, false, 164, "Guard 2"};
		{"detective", true, true, false, 308, "Detective"};
		{"businesswoman", true, true, false, 9, "Businesswoman"};
		{"army_female", true, true, false, 191, "Army Female"};
		{"lapd1", true, true, false, 267, "Cop"};
		{"maffa", true, true, false, 111, "Man"};
		-- {"army", true, true, false, 287, "Army"};
		{"swat", true, true, false, 285, "SWAT"};
		{"vbfycpd", true, true, false, 257, "Police Female"};



		-- {"skin_1", true, true, false, 1, "Skin 1"};
		{"skin_2", true, true, false, 106, "Skin 2"};
		{"skin_3", true, true, false, 87, "Skin 3"};
		{"skin_4", true, true, false, 107, "Skin 4"};
		{"skin_5", true, true, false, 188, "Skin 5"};
		{"skin_6", true, true, false, 184, "Skin 6"};
		{"skin_7", true, true, false, 152, "Skin 7"};
		{"skin_8", true, true, false, 84, "Skin 8"};
		{"skin_9", true, true, false, 64, "Skin 9"};
		{"skin_10", true, true, false, 75, "Skin 10"};
		{"skin_11", true, true, false, 222, "Skin 11"};
		{"skin_12", true, true, false, 105, "Skin 12"};
		{"skin_13", true, true, false, 116, "Skin 13"};
		{"brideoutfit", true, true, false, 90, "Bride outfit"};
		{"skin_14", true, true, false, 60, "Skin 14"};
		{"skin_15", true, true, false, 53, "Skin 15"};
		{"skin_16", true, true, false, 102, "Skin 16"};
		{"skin_17", true, true, false, 103, "Skin 17"};
		{"skin_18", true, true, false, 104, "Skin 18"};
		{"skin_19", true, true, false, 108, "Skin 19"};
		{"skin_20", true, true, false, 109, "Skin 20"};
		{"skin_21", true, true, false, 110, "Skin 21"};
		{"skin_22", true, true, false, 312, "Skin 22"};
		{"skin_23", true, true, false, 287, "Army"};
	
	};
}


local downloadfiles = {}
local grouped_files = {}
local files_count = {}
local loadedModels = {}


local loadedTxd = {}
local loadedDff = {}


for i,v in ipairs(models.vehicles) do
	local customModel = v[4]
	local model = customModel or v[5]
	if not grouped_files[model] then
		grouped_files[model] = {}
	end
	models.vehicles[i][8] = v[1]
	models.vehicles[i][1] = "vehicles/"..v[1]
	if customModel then
		local modelId = engineRequestModel("vehicle")
		if modelId then
			mapped_models[tostring(customModel)] = modelId
		end
	end
	if v[2] then
		downloadfiles["models/"..v[1]..".txd"] = {'txd', model, customModel}
		table.insert(grouped_files[model], "models/"..v[1]..".txd")
		files_count[model] = #grouped_files[model]
	end
	if v[3] then
		downloadfiles["models/"..v[1]..".dff"] = {'dff', model, customModel}
		table.insert(grouped_files[model], "models/"..v[1]..".dff")
		files_count[model] = #grouped_files[model]
	end
end


for i,v in ipairs(models.skins) do
	if not grouped_files[v[5]] then
		grouped_files[v[5]] = {}
	end
	models.skins[i][8] = v[1]
	models.skins[i][1] = "skins/"..v[1]
	if v[2] then
		downloadfiles["models/"..v[1]..".txd"] = {'txd', v[5]}
		table.insert(grouped_files[v[5]], "models/"..v[1]..".txd")
		files_count[v[5]] = #grouped_files[v[5]]
	end
	if v[3] then
		downloadfiles["models/"..v[1]..".dff"] = {'dff', v[5]}
		table.insert(grouped_files[v[5]], "models/"..v[1]..".dff")
		files_count[v[5]] = #grouped_files[v[5]]
	end
end

-- addEventHandler("onClientResourceStart", resourceRoot,
-- function ()
-- 	for i,v in ipairs(models) do
-- 		if v[2] then
-- 			downloadFile("models/"..v[1]..".txd")
-- 		end
-- 		if v[3] then
-- 			downloadFile("models/"..v[1]..".dff")
-- 		end
-- 	end
-- end
-- )


addEventHandler("onClientResourceStop", resourceRoot,
function ()
    for _,modelId in pairs(mapped_models) do
        engineFreeModel(modelId)
    end

	for k,v in pairs(loadedTxd) do
		for i,v in ipairs(models.vehicles) do
			if v[1] == k then
				unloadModel(v)
				break
			end
		end
	end
end
)

addEventHandler("onClientFileDownloadComplete", resourceRoot,
function (fileName, success)
	local d = downloadfiles[fileName]
	if d then
		files_count[d[2]] = files_count[d[2]]-1
		local fc = files_count[d[2]]
		if fc == 0 then
			-- outputDebugString("downloaded  vehicle id = "..tostring(d[2]))
			loadModelFiles(d[2])
			-- for i,file in ipairs(grouped_files[d[2]]) do
			-- 	local t, model = downloadfiles[file][1], downloadfiles[file][2]
			-- 	if t == "txd" then
			-- 		local txd = engineLoadTXD(file)
			-- 		engineImportTXD(txd, model)
			-- 	elseif t == "dff" then
			-- 		local dff = engineLoadDFF(file)
			-- 		engineReplaceModel(dff, model)
			-- 	end
			-- end
			loadedModels[d[2]] = true
			-- files_count[d[2]] = nil
			-- grouped_files[d[2]] = nil
		end
	end
end
)

function loadModelFiles (modelname)
	for i,file in ipairs(grouped_files[modelname]) do
		local t, model, customModel = downloadfiles[file][1], downloadfiles[file][2], downloadfiles[file][3]
		if customModel and mapped_models[tostring(customModel)] then
			model = mapped_models[tostring(customModel)]
			checkNearbyVehiclesModel(customModel)
		end
		if t == "txd" then
			loadedTxd[modelname] = engineLoadTXD(file)
			engineImportTXD(loadedTxd[modelname], model)
		elseif t == "dff" then
			loadedDff[modelname] = engineLoadDFF(file)
			engineReplaceModel(loadedDff[modelname], model)
		end
	end
end




local sx, sy = guiGetScreenSize()

UI = {
    window = {},
    label = {},
    button = {},
    gridlist = {},
	tabpanel = {},
	tab = {},
	rectangle = {}
}

function UIKitReady ()
	eui = exports["UIKit"]
	local srx, sry = eui:uiGetReferenceScreenSize()

	UI.window[1] = eui:uiCreateWindow(false, false, 500, 460, "Custom Mods")
	eui:uiSetVisible(UI.window[1], false)

	UI.tabpanel[1] = eui:uiCreateTabPanel(0, 80, 500, 310, "", tocolor(10, 10, 10, 0), UI.window[1])
	eui:uiSetProperty(UI.tabpanel[1], "title_shown", false)
	
	UI.label["Notes"] = eui:uiCreateLabel(0, 390, 500, 30, {en="Double click to activate/deactivate", ar="انقر مرتين للتفعيل / إلغاء التفعيل"}, tocolor(255, 255, 255, 255), "center", "center", UI.window[1])
	UI.button[1] = eui:uiCreateButton(5, 460-40, 490, 35, {en="Close", ar="إغلاق"}, _, UI.window[1])


	-- vehicles
	UI.tab[1] = eui:uiCreateTab("Vehicles Mods", "Vehicles Mods", UI.tabpanel[1])
	eui:uiSetSelectedTab(UI.tabpanel[1], UI.tab[1])

	UI.gridlist[1] = eui:uiCreateGridList(0, 10, 500, 255, tocolor(10, 10, 10, 0), UI.tab[1])
	eui:uiGridListAddColumn(UI.gridlist[1], "Name", 0.7)
	eui:uiGridListAddColumn(UI.gridlist[1], "Model", 0.3)
	eui:uiSetAlign(UI.gridlist[1], "left", "center")
	UI.button[2] = eui:uiCreateButton(5, 270, 490, 35, {en="Activate/Deactivate All", ar="تفعيل/إلغاء تفعيل الكل"}, _, UI.tab[1])

	for i,v in ipairs(models.vehicles) do
		local row = eui:uiGridListAddRow(UI.gridlist[1])
		eui:uiGridListSetItemText(UI.gridlist[1], row, 1, tostring(v[6]))
		eui:uiGridListSetItemText(UI.gridlist[1], row, 2, v[4] and tostring(v[4]) or tostring(v[5]))
		eui:uiGridListSetItemData(UI.gridlist[1], row, 1, v)
		if v[7] then
			eui:uiGridListSetItemColor(UI.gridlist[1], row, 1, tocolor(0, 255, 0, 255))
			eui:uiGridListSetItemColor(UI.gridlist[1], row, 2, tocolor(0, 255, 0, 255))
		else
			eui:uiGridListSetItemColor(UI.gridlist[1], row, 1, tocolor(255, 0, 0, 255))
			eui:uiGridListSetItemColor(UI.gridlist[1], row, 2, tocolor(255, 0, 0, 255))
		end
	end


	-- skins
	UI.tab[2] = eui:uiCreateTab("Skins Mods", "Skins Mods", UI.tabpanel[1])
	UI.gridlist[2] = eui:uiCreateGridList(0, 10, 500, 255, tocolor(10, 10, 10, 0), UI.tab[2])
	eui:uiGridListAddColumn(UI.gridlist[2], "Name", 0.7)
	eui:uiGridListAddColumn(UI.gridlist[2], "Model", 0.3)
	eui:uiSetAlign(UI.gridlist[2], "left", "center")
	UI.button[3] = eui:uiCreateButton(5, 270, 490, 35, {en="Activate/Deactivate All", ar="تفعيل/إلغاء تفعيل الكل"}, _, UI.tab[2])

	for i,v in ipairs(models.skins) do
		local row = eui:uiGridListAddRow(UI.gridlist[2])
		eui:uiGridListSetItemText(UI.gridlist[2], row, 1, tostring(v[6]))
		eui:uiGridListSetItemText(UI.gridlist[2], row, 2, tostring(v[5]))
		eui:uiGridListSetItemData(UI.gridlist[2], row, 1, v)
		if v[7] then
			eui:uiGridListSetItemColor(UI.gridlist[2], row, 1, tocolor(0, 255, 0, 255))
			eui:uiGridListSetItemColor(UI.gridlist[2], row, 2, tocolor(0, 255, 0, 255))
		else
			eui:uiGridListSetItemColor(UI.gridlist[2], row, 1, tocolor(255, 0, 0, 255))
			eui:uiGridListSetItemColor(UI.gridlist[2], row, 2, tocolor(255, 0, 0, 255))
		end
	end


	UI.rectangle["loading"] = eui:uiCreateRectangle(false, sry-60, 300, 40, "bg_default", true, true, true, true)
	eui:uiSetVisible(UI.rectangle["loading"], false)

	eui:uiCreateLabel(0, 0, 300, 40, "Loading custom vehicles...", tocolor(255, 255, 255, 255), "center", "center", UI.rectangle["loading"])

	if first_loading then
		eui:uiSetVisible(UI.rectangle["loading"], true)
		first_loading = nil
	end
end
addEventHandler("onClientUIReady", resourceRoot, UIKitReady)
addEvent("onClientUIKitReady", true)
addEventHandler("onClientUIKitReady", root, UIKitReady)


bindKey("F5", "down",
function ()
	if not getElementData(localPlayer, "character:id") then return end
	if eui:uiGetVisible(UI.window[1]) then
		eui:uiSetVisible(UI.window[1], false)
		showCursor(false)
	else
		eui:uiSetVisible(UI.window[1], true)
		showCursor(true)
	end
end
)



addEventHandler("onClientUIClick", root,
function ()
	if source == UI.button[1] then
		eui:uiSetVisible(UI.window[1], false)
		showCursor(false)
	
	elseif source == UI.button[2] then
		if isPedInVehicle(localPlayer) then
			exports.notifications:output({en="Exit your vehicle first", ar="اخرج من السيارة أولاً"}, 3500, "error")
			return
			-- triggerLatentServerEvent("mods:removePedFromVehicle", localPlayer)
		end
		for row = 0, #models.vehicles-1 do
			local v = eui:uiGridListGetItemData(UI.gridlist[1], row, 1)
			local node = xmlFindChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"), 0)
			if not node then
				node = xmlCreateChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"))
			end
			if node then
				local value = xmlNodeGetValue(node)
				if value == "true" then
					xmlNodeSetValue(node, "false")
					unloadModel(v)
					eui:uiGridListSetItemColor(UI.gridlist[1], row, 1, tocolor(255, 0, 0, 255))
					eui:uiGridListSetItemColor(UI.gridlist[1], row, 2, tocolor(255, 0, 0, 255))
				else
					xmlNodeSetValue(node, "true")
					loadModel(v)
					eui:uiGridListSetItemColor(UI.gridlist[1], row, 1, tocolor(0, 255, 0, 255))
					eui:uiGridListSetItemColor(UI.gridlist[1], row, 2, tocolor(0, 255, 0, 255))
				end
				xmlSaveFile(settingsFile)
			end
		end
	
	elseif source == UI.button[3] then
		for row = 0, #models.skins-1 do
			local v = eui:uiGridListGetItemData(UI.gridlist[2], row, 1)
			local node = xmlFindChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"), 0)
			if not node then
				node = xmlCreateChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"))
			end
			if node then
				local value = xmlNodeGetValue(node)
				if value == "true" then
					xmlNodeSetValue(node, "false")
					unloadModel(v)
					eui:uiGridListSetItemColor(UI.gridlist[2], row, 1, tocolor(255, 0, 0, 255))
					eui:uiGridListSetItemColor(UI.gridlist[2], row, 2, tocolor(255, 0, 0, 255))
				else
					xmlNodeSetValue(node, "true")
					loadModel(v)
					eui:uiGridListSetItemColor(UI.gridlist[2], row, 1, tocolor(0, 255, 0, 255))
					eui:uiGridListSetItemColor(UI.gridlist[2], row, 2, tocolor(0, 255, 0, 255))
				end
				xmlSaveFile(settingsFile)
			end
		end
	end
end
)

addEventHandler("onClientUIDoubleClick", root,
function ()
	if source == UI.gridlist[1] or source == UI.gridlist[2] then
		local row = eui:uiGridListGetSelectedItem(source)
		if (row ~= -1) then
			if source == UI.gridlist[1] then
				if isPedInVehicle(localPlayer) then
					exports.notifications:output({en="Exit your vehicle first", ar="اخرج من السيارة أولاً"}, 3500, "error")
					return
					-- triggerLatentServerEvent("mods:removePedFromVehicle", localPlayer)
				end
			end
			local v = eui:uiGridListGetItemData(source, row, 1)
			local node = xmlFindChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"), 0)
			if not node then
				node = xmlCreateChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"))
			end
			if node then
				local value = xmlNodeGetValue(node)
				if value == "true" then
					xmlNodeSetValue(node, "false")
					unloadModel(v)
					eui:uiGridListSetItemColor(source, row, 1, tocolor(255, 0, 0, 255))
					eui:uiGridListSetItemColor(source, row, 2, tocolor(255, 0, 0, 255))
				else
					xmlNodeSetValue(node, "true")
					loadModel(v)
					eui:uiGridListSetItemColor(source, row, 1, tocolor(0, 255, 0, 255))
					eui:uiGridListSetItemColor(source, row, 2, tocolor(0, 255, 0, 255))
				end
				xmlSaveFile(settingsFile)
			end
		end
	end
end
)


addEventHandler("onClientResourceStart", resourceRoot,
function()
	settingsFile = xmlLoadFile("settings.xml")
	if not settingsFile then
		settingsFile = xmlCreateFile("settings.xml", "models")
		for i,v in ipairs(models.vehicles) do
			local node = xmlCreateChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"))
			xmlNodeSetValue(node, "false")
		end
		for i,v in ipairs(models.skins) do
			local node = xmlCreateChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"))
			xmlNodeSetValue(node, "false")
		end
		xmlSaveFile(settingsFile)
	end

	if getElementData(localPlayer, "character:id") then

		first_loading = true

		for i,v in ipairs(models.vehicles) do
			local node = xmlFindChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"), 0)
			if not node then
				node = xmlCreateChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"))
			end
			if node then
				local value = xmlNodeGetValue(node)
				if value == "true" then
					models.vehicles[i][7] = true
				end
			end
		end

		for i,v in ipairs(models.skins) do
			local node = xmlFindChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"), 0)
			if not node then
				node = xmlCreateChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"))
			end
			if node then
				local value = xmlNodeGetValue(node)
				if value == "true" then
					models.skins[i][7] = true
				end
			end
		end

		-- Async:setDebug(true);
		Async:setPriority("low");
		
		local v_i = 1
		Async:foreach(models.vehicles, function(v)
			local node = xmlFindChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"), 0)
			if not node then
				node = xmlCreateChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"))
			end
			if node then
				local value = xmlNodeGetValue(node)
				if value == "true" then
					loadModel(v)
					models.vehicles[v_i][7] = true
				end
			end
			if (v_i == #models.vehicles) then
				exports["UIKit"]:uiSetVisible(UI.rectangle["loading"], false)
				first_loading = nil
			end
			v_i = v_i + 1
		end)

		local s_i = 1
		Async:foreach(models.skins, function(v)
			local node = xmlFindChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"), 0)
			if not node then
				node = xmlCreateChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"))
			end
			if node then
				local value = xmlNodeGetValue(node)
				if value == "true" then
					loadModel(v)
					models.skins[s_i][7] = true
				end
			end
			s_i = s_i + 1
		end)
	
	else

		for i,v in ipairs(models.vehicles) do
			local node = xmlFindChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"), 0)
			if not node then
				node = xmlCreateChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"))
			end
			if node then
				local value = xmlNodeGetValue(node)
				if value == "true" then
					loadModel(v)
					models.vehicles[i][7] = true
				end
			end
		end
		for i,v in ipairs(models.skins) do
			local node = xmlFindChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"), 0)
			if not node then
				node = xmlCreateChild(settingsFile, "v_"..string.gsub(v[8], "/", "_"))
			end
			if node then
				local value = xmlNodeGetValue(node)
				if value == "true" then
					loadModel(v)
					models.skins[i][7] = true
				end
			end
		end
	
	end
end
)


function loadModel (v)
	local model = v[4] or v[5]
	if loadedModels[model] then
		loadModelFiles(model)
	else
		if v[2] then
			downloadFile("models/"..v[1]..".txd")
		end
		if v[3] then
			downloadFile("models/"..v[1]..".dff")
		end
	end
end

function unloadModel (v)
	local model = v[4] or v[5]
	if not v[4] then
		engineRestoreModel(model)
	end
	if isElement(loadedTxd[model]) then
		destroyElement(loadedTxd[model])
	end
	if isElement(loadedDff[model]) then
		destroyElement(loadedDff[model])
	end
	loadedTxd[model] = nil
	loadedDff[model] = nil
	if v[4] then
		checkNearbyVehiclesModel(v[4], v[5])
	end
end


function checkNearbyVehiclesModel (custome_model, org_model)
	for i,source in ipairs(getElementsByType("vehicle", root, true)) do
		if tostring(getElementData(source, "customModel")) == tostring(custome_model) then
			-- if org_model then
				-- outputChatBox("org_model = "..tostring(org_model))
			-- 	local m = getElementModel(source)
			-- 	if m ~= org_model then
			-- 		local handling = getVehicleHandling(source)
			-- 		setElementModel(source, org_model)
			-- 		for k,v in pairs(handling) do
			-- 			setVehicleHandling(source, k, v)
			-- 		end
			-- 	end
			-- else
				checkCustomModel(source)
			-- end
		end
	end
end


addEventHandler("onClientResourceStart", resourceRoot,
function ()
	for i,source in ipairs(getElementsByType("vehicle", root, true)) do
		checkCustomModel(source)
	end
end
)

addEventHandler("onClientElementStreamIn", root,
function ()
	if getElementType(source) == "vehicle" then
		checkCustomModel(source)
	end
end
)

addEventHandler("onClientElementDataChange", root,
function (theKey, oldValue, newValue)
	if theKey == "customModel" then
		if getElementType(source) == "vehicle" then
			checkCustomModel(source)
		end
	end
end
)

function checkCustomModel (element)
	local custom_model = getElementData(element, "customModel")
	if custom_model then
		local model = mapped_models[tostring(custom_model)]
		if model then
			local m = getElementModel(element)
			if m ~= model then
				local handling = getVehicleHandling(element)
				setElementModel(element, model)
				for k,v in pairs(handling) do
					setVehicleHandling(element, k, v)
				end
			end
		end
	end
end


function getMappedModel (model)
	local m = mapped_models[tostring(model)]
	if m then
		return m
	end
	return model
end



-- addCommandHandler("mass",
-- function (_, customModel)
-- 	if not isPedInVehicle(localPlayer) then return end
-- 	local vehicle = getPedOccupiedVehicle(localPlayer)
-- 	setVehicleHandling(vehicle, "mass", 50)
-- 	local handling = getVehicleHandling(vehicle)
-- 	outputChatBox("mass = "..tostring(handling["mass"]))
-- 	outputChatBox("done")
-- end, false, false)


