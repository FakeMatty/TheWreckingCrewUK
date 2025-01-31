/*
        Different Ammobox v 1.0
        by Demonized.
       
        1: place a marker named DMZ_DA anywhere you want the players to see their ammobox, all will see their box in same position.
        2: place this in init line of any unit.
                _null = this execVM "DMZ_DA.sqf";
        3: save this script as DMZ_DA.sqf and place it in your mission folder.
               
        For more classnames on ammoboxes or weapons and magazines go here:
                http://forums.bistudio.com/showthread.php?t=73241&page=2
				edited by FakeMatty
*/
 
_marker = "crate";  // marker used to spawn.
_boxType = "I_supplyCrate_F";  // the type of ammobox used.
_timer = 240;  // time in seconds until box is refilled.
 
_weapons = [];
_magazines = [["SmokeShell",5], ["SmokeShellYellow",5], ["SmokeShellRed",5], ["SmokeShellGreen",5], ["SmokeShellPurple",5], ["SmokeShellBlue",5], ["SmokeShellOrange",5], ["HandGrenade",5], ["Chemlight_green",5], ["Chemlight_yellow",5], ["Chemlight_red",5], ["Chemlight_blue",5]];
_items = [["ACE_EarPlugs",1],["ACE_MapTools",1],["rhsusf_ANPVS_14",1],["ACE_Flashlight_XL50", 1],["ACE_IR_Strobe_Item",1],["ACE_HandFlare_White",5],["ACE_HandFlare_Green",5]];
 
_tmp_weapons = [];
_tmp_magazines = [];
_tmp_items = [];
 
// load available to Section Commander only.
if (g_class == "BAF_SL") then {
                _tmp_weapons =
                [
                                ["UK3CB_BAF_L85A2_RIS",1],
                                ["ACE_Vector",1],
								["UK3CB_BAF_L131A1",1]
								
                ];
           
                _tmp_magazines =
                [
                                ["30Rnd_556x45_Stanag",50],
								["30Rnd_556x45_Stanag_Tracer_Red",50],
                                ["UK3CB_BAF_17Rnd_9mm",15]
								
                               
                ];
               
                _tmp_items = [
                                
                                ["ACE_MapTools",1],
                                ["ACE_fieldDressing",20],
                                ["ACE_morphine",10],
								["UK3CB_BAF_SpecterLDS_Dot_3D",1],
								["UK3CB_BAF_LLM_IR",1],
								["SatchelCharge_Remote_Mag",1],
								["DemoCharge_Remote_Mag",1],
								["ACE_M26_Clacker",1],
								["UK3CB_BAF_Eotech",1],
								["STKR_Predator",1],
								["ACRE_PRC343",1]
               
                ];
};
 
// load available to Rifleman only.
 if (g_class == "BAF_RF") then {
        _tmp_weapons =
        [
								["UK3CB_BAF_L85A2_RIS",1],
								["UK3CB_BAF_L131A1",1],
								["launch_NLAW_F",3],
								["UK3CB_BAF_Javelin_Slung_Tube", 2],
								["rhs_weap_fim92",1],
								["UK3CB_BAF_Javelin_CLU",1],
								["UK3CB_BAF_AT4_AT_Launcher",2]
								
        ];
       
        _tmp_magazines =
        [
								
								
								["rhs_fim92_mag", 2],
								["30Rnd_556x45_Stanag",50],
								["30Rnd_556x45_Stanag_Tracer_Red",50],
                                ["UK3CB_BAF_17Rnd_9mm",15]
			];
		
		_tmp_items = [
								 
                                ["ACE_MapTools",1],
                                ["ACE_fieldDressing",20],
                                ["ACE_morphine",10],
								["UK3CB_BAF_SpecterLDS_Dot_3D",1],
								["UK3CB_BAF_LLM_IR",1],
								["UK3CB_BAF_Eotech",1],
								["STKR_Predator",1],
								["ACRE_PRC343",1]
		];
		


					
};
 
// load available to Grenadier only.
 if (g_class == "BAF_G") then {
        _tmp_weapons =
        [
            ["UK3CB_BAF_L85A2_UGL",1],
            ["ACE_Vector",1],
			["UK3CB_BAF_L131A1",1],
			["rhs_weap_fim92",1],
			["launch_NLAW_F",2],
			["UK3CB_BAF_AT4_AT_Launcher",2]
			
		];
       
        _tmp_magazines =
        [
            
			 ["30Rnd_556x45_Stanag",50],
             ["UK3CB_BAF_17Rnd_9mm",15],
			 ["1Rnd_HE_Grenade_shell", 40],
	         ["1Rnd_Smoke_Grenade_shell", 10],
	         ["1Rnd_SmokeRed_Grenade_shell", 10],
	         ["1Rnd_SmokeGreen_Grenade_shell", 10],
	         ["1Rnd_SmokeYellow_Grenade_shell", 10],
	         ["1Rnd_SmokePurple_Grenade_shell", 10],
			 ["UGL_FlareWhite_F", 10],
	         ["1Rnd_SmokeBlue_Grenade_shell", 10],
			 ["rhs_fim92_mag",2]
        ];
		
		_tmp_items = 
		[
			 
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["UK3CB_BAF_SpecterLDS_Dot_3D",1],
			 ["UK3CB_BAF_LLM_IR",1],
		     ["UK3CB_BAF_Eotech",1],
			 ["STKR_Predator",1],
			 ["ACRE_PRC343",1]
		];
};
 
// load available to Automatic Rifleman only.
 if (g_class == "BAF_AR") then {
        _tmp_weapons =
        [
            ["UK3CB_BAF_L110A2",1],
			["UK3CB_BAF_AT4_AT_Launcher",2],
			["UK3CB_BAF_L131A1",1]
			 
		];
       
        _tmp_magazines =
        [
            
			["UK3CB_BAF_100Rnd",10],
			["UK3CB_BAF_100Rnd_T",5],
			["UK3CB_BAF_200Rnd",10],
			["UK3CB_BAF_200Rnd_T",5],
            ["UK3CB_BAF_17Rnd_9mm",15]
        ];
		
		_tmp_items = 
		[
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["UK3CB_BAF_SpecterLDS_Dot_3D",1],
		     ["UK3CB_BAF_Eotech",1],
			 ["UK3CB_BAF_LLM_IR",1],
			 ["STKR_Predator",1],
			 ["ACRE_PRC343",1]
		];
};
 
// load available to Section 2IC only.
 if (g_class == "BAF_2") then {
        _tmp_weapons =
        [
            ["UK3CB_BAF_L85A2_RIS",1],
			["UK3CB_BAF_AT4_AT_Launcher",2],
			["ACE_Vector",1],
			["UK3CB_BAF_L131A1",1]  
		];
       
        _tmp_magazines =
        [
             ["30Rnd_556x45_Stanag",50],
             ["UK3CB_BAF_17Rnd_9mm",15],
			 ["rhs_m136_mag", 2]
        ];
		
		_tmp_items = 
		[
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["UK3CB_BAF_SpecterLDS_Dot_3D",1],
		     ["UK3CB_BAF_Eotech",1],
			 ["UK3CB_BAF_LLM_IR",1],
			 ["STKR_Predator",1],
			 ["ACRE_PRC343",1]
		];
};
 
// load available to GPMG Gunner only.
 if (g_class == "BAF_MG") then {
         _tmp_weapons =
        [
            ["UK3CB_BAF_L7A2",1],
			["UK3CB_BAF_AT4_AT_Launcher",2],
			["UK3CB_BAF_L131A1",1]  
		];
       
        _tmp_magazines =
        [
            ["UK3CB_BAF_75Rnd",20],
			["UK3CB_BAF_75Rnd_T",10],
			
            ["UK3CB_BAF_17Rnd_9mm",15]
        ];
		
		_tmp_items = 
		[
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["STKR_Predator",1],
			 ["ACRE_PRC343",1]
		];
};
 
// load available to Marksman only.
 if (g_class == "BAF_MARK") then {
       _tmp_weapons =
        [
            ["UK3CB_BAF_L129A1_FGrip",1],
			["ACE_Vector",1],
			["UK3CB_BAF_L131A1",1],
			["launch_NLAW_F",3],
			["rhs_weap_fim92",1],
			["UK3CB_BAF_AT4_AT_Launcher",2]
			  
		];
       
        _tmp_magazines =
        [
            ["UK3CB_BAF_20Rnd",25],
			["UK3CB_BAF_20Rnd_T",10],
			["rhs_fim92_mag",2],			
			["UK3CB_BAF_17Rnd_9mm",15]
        ];
		
		_tmp_items = 
		[
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["UK3CB_BAF_TA648_308",1],
			 ["UK3CB_BAF_LLM_IR",1],
			 ["STKR_Predator",1],
			 ["ACRE_PRC343",1]
		     
		];
};
 if (g_class == "BAF_MED") then {
       _tmp_weapons =
        [
            ["UK3CB_BAF_L85A2_RIS",1],
			["UK3CB_BAF_L131A1",1]
			  
		];
       
        _tmp_magazines =
        [
            ["30Rnd_556x45_Stanag",50],
             ["UK3CB_BAF_17Rnd_9mm",15]
        ];
		
		_tmp_items = 
		[
			
			["ACE_fieldDressing",50],
			["ACE_morphine",50],
			["ACE_epinephrine",50],
			["ACE_bloodIV",50],
			["ACE_bodyBag",10],
			["UK3CB_BAF_SpecterLDS_Dot_3D",1],
		    ["UK3CB_BAF_Eotech",1],
			["UK3CB_BAF_LLM_IR",1],
			["STKR_Predator",1],
			["ACRE_PRC343",1]
		];
};
// Load availible to US Section Lead Only
if (g_class == "US_SL") then {
                _tmp_weapons =
                [
                                ["rhs_weap_m4a1_carryhandle_m203",1],
                                ["ACE_Vector",1],
								["rhsusf_weap_m1911a1",1]
								
                ];
           
                _tmp_magazines =
                [
                                ["30Rnd_556x45_Stanag",50],
								["30Rnd_556x45_Stanag_Tracer_Red",50],
                                ["rhsusf_mag_7x45acp_MHP",15],
								["1Rnd_HE_Grenade_shell", 40],
	                            ["1Rnd_Smoke_Grenade_shell", 10],
	                            ["1Rnd_SmokeRed_Grenade_shell", 10],
	                            ["1Rnd_SmokeGreen_Grenade_shell", 10],
	                            ["1Rnd_SmokeYellow_Grenade_shell", 10],
	                            ["1Rnd_SmokePurple_Grenade_shell", 10],
                             	["1Rnd_SmokeBlue_Grenade_shell", 10],
								["UGL_FlareWhite_F", 10]
								
                               
                ];
               
                _tmp_items = [
                                
                                ["ACE_MapTools",1],
                                ["ACE_fieldDressing",20],
                                ["ACE_morphine",10],
								["SatchelCharge_Remote_Mag",1],
								["DemoCharge_Remote_Mag",1],
								["ACE_M26_Clacker",1],
								["UK3CB_BAF_TA31F_3D",1],
								["rhsusf_acc_compm4",1],
								["rhsusf_acc_anpeq15A",1],
								["UK3CB_BAF_Eotech",1],
								["rhsusf_assault_eagleaiii_ucp",1],
								["ACRE_PRC148",1]
               
                ];
};
 
// load available to US Fire Team Lead only.
 if (g_class == "US_TL1") then {
        _tmp_weapons =
        [
								["rhs_weap_m4a1_carryhandle_grip2",1],
								["rhsusf_weap_m1911a1",1],
								["ACE_Vector",1]
        ];
       
        _tmp_magazines =
        [
								["30Rnd_556x45_Stanag",50],
								["30Rnd_556x45_Stanag_Tracer_Red",50],
                                ["rhsusf_mag_7x45acp_MHP",15]
			];
		
		_tmp_items = [
								
                                ["ACE_MapTools",1],
                                ["ACE_fieldDressing",20],
                                ["ACE_morphine",10],
								["UK3CB_BAF_TA31F_3D",1],
								["UK3CB_BAF_Eotech",1],
								["rhsusf_acc_compm4",1],
								["rhsusf_acc_anpeq15A",1],
								["rhsusf_assault_eagleaiii_ucp",1],
								["ACRE_PRC148",1]
		];
								
};
 
// load available to US FireTeam Lead only.
 if (g_class == "US_TL2") then {
       _tmp_weapons =
        [
								["rhs_weap_m4a1_carryhandle_grip2",1],
								["ACE_Vector",1],
								["rhsusf_weap_m1911a1",1]
        ];
       
        _tmp_magazines =
        [
								["30Rnd_556x45_Stanag",50],
								["30Rnd_556x45_Stanag_Tracer_Red",50],
                                ["rhsusf_mag_7x45acp_MHP",15]
			];
		
		_tmp_items = [
								
                                ["ACE_MapTools",1],
                                ["ACE_fieldDressing",20],
                                ["ACE_morphine",10],
								["UK3CB_BAF_TA31F_3D",1],
								["UK3CB_BAF_Eotech",1],
								["rhsusf_acc_compm4",1],
								["rhsusf_acc_anpeq15A",1],
								["rhsusf_assault_eagleaiii_ucp",1],
								["ACRE_PRC148",1]
		];
};
 
// load available to US Rifleman only.
 if (g_class == "US_R1") then {
        _tmp_weapons =
        [
            ["rhs_weap_m4a1_carryhandle_grip2",1],
			["rhsusf_weap_m1911a1",1],
			["rhs_weap_fim92",1],
			["UK3CB_BAF_AT4_AT_Launcher",4]
			 
		];
       
        _tmp_magazines =
        [
            
			["rhs_m136_mag", 4],
			["rhs_fim92_mag",2],
			["30Rnd_556x45_Stanag",50],
			["30Rnd_556x45_Stanag_Tracer_Red",50],
            ["rhsusf_mag_7x45acp_MHP",15]
        ];
		
		_tmp_items = 
		[
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["UK3CB_BAF_TA31F_3D",1],
		     ["UK3CB_BAF_Eotech",1],
			 ["rhsusf_acc_compm4",1],
			 ["rhsusf_acc_anpeq15A",1],
			 ["rhsusf_assault_eagleaiii_ucp",1],
			 ["ACRE_PRC148",1]
		];
};
 
// load available to US Automatic Rifleman only.
 if (g_class == "US_AR2") then {
        _tmp_weapons =
        [
            ["rhs_weap_m249_pip_S",1],
			["UK3CB_BAF_AT4_AT_Launcher",2],
			["rhsusf_weap_m1911a1",1]  
		];
       
        _tmp_magazines =
        [
             ["rhs_200rnd_556x45_M_SAW",25],
			 
             ["rhsusf_mag_7x45acp_MHP",15]
        ];
		
		_tmp_items = 
		[
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["rhsusf_acc_ELCAN",1],
			 ["rhsusf_acc_anpeq15A",1],
		     ["UK3CB_BAF_Eotech",1],
			 ["rhsusf_acc_compm4",1],
			 ["rhsusf_assault_eagleaiii_ucp",1],
			 ["ACRE_PRC148",1]
		];
};
 
// load available toUS Automatic Rifleman only.
 if (g_class == "US_AR1") then {
         _tmp_weapons =
        [
            ["rhs_weap_m249_pip_S",1],
			["UK3CB_BAF_AT4_AT_Launcher",2],
			["rhsusf_weap_m1911a1",1]  
		];
       
        _tmp_magazines =
        [
            ["rhs_200rnd_556x45_M_SAW",25],
			
            ["rhsusf_mag_7x45acp_MHP",15]
        ];
		
		_tmp_items = 
		[
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["rhsusf_acc_ELCAN",1],
			 ["rhsusf_acc_anpeq15A",1],
		     ["UK3CB_BAF_Eotech",1],
		     
			 ["rhsusf_assault_eagleaiii_ucp",1],
			 ["ACRE_PRC148",1]
		];
};
 
// load available to US Grenadier only.
 if (g_class == "US_G") then {
       _tmp_weapons =
        [
            ["rhs_weap_m4a1_carryhandle_m203",1],
			["ACE_Vector",1],
			["rhsusf_weap_m1911a1",1],
			["rhs_weap_fim92",1],
			["UK3CB_BAF_AT4_AT_Launcher",2]
			  
		];
       
        _tmp_magazines =
        [
            ["30Rnd_556x45_Stanag",50],
			["rhs_fim92_mag",2],		
			["rhsusf_mag_7x45acp_MHP",15],
			
								["1Rnd_HE_Grenade_shell", 40],
	                            ["1Rnd_Smoke_Grenade_shell", 10],
	                            ["1Rnd_SmokeRed_Grenade_shell", 10],
	                            ["1Rnd_SmokeGreen_Grenade_shell", 10],
	                            ["1Rnd_SmokeYellow_Grenade_shell", 10],
	                            ["1Rnd_SmokePurple_Grenade_shell", 10],
                             	["1Rnd_SmokeBlue_Grenade_shell", 10],
								["UGL_FlareWhite_F", 10]
        ];
		
		_tmp_items = 
		[
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["UK3CB_BAF_TA31F_3D",1],
		     ["UK3CB_BAF_Eotech",1],
			 ["rhsusf_acc_compm4",1],
			 ["rhsusf_acc_anpeq15A",1],
			 ["rhsusf_assault_eagleaiii_ucp",1],
			 ["ACRE_PRC148",1]
		     
		];
};
//load availible to US marksmen only
 if (g_class == "US_MARK") then {
       _tmp_weapons =
        [
            ["rhs_weap_m14ebrri",1],
			["rhsusf_weap_m1911a1",1],
			["rhs_weap_fim92",1],
			["UK3CB_BAF_Javelin_Slung_Tube", 2],
			["UK3CB_BAF_Javelin_CLU",1],
			["UK3CB_BAF_AT4_AT_Launcher",2]
			  
		];
       
        _tmp_magazines =
        [
             ["rhsusf_20Rnd_762x51_m118_special_Mag",25],
			 ["rhs_fim92_mag",2],
             ["rhsusf_mag_7x45acp_MHP",15]
        ];
		
		_tmp_items = 
		[
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
		     ["rhsusf_acc_LEUPOLDMK4",1],
			 ["rhsusf_acc_anpeq15A",1],
			 ["rhsusf_assault_eagleaiii_ucp",1],
			 ["bipod_01_F_blk",1],
			 ["ACRE_PRC148",1]
		];
};
//load availible to US Medic Only
 if (g_class == "US_MED") then {
       _tmp_weapons =
        [
             ["rhs_weap_m4a1_carryhandle_grip2",1],
	         ["rhsusf_weap_m1911a1", 1]
			  
		];
       
        _tmp_magazines =
        [
             ["30Rnd_556x45_Stanag",50],
			 ["30Rnd_556x45_Stanag_Tracer_Red",50],
			 
             ["rhsusf_mag_7x45acp_MHP",15]
        ];
		
		_tmp_items = 
		[
			
			 ["ACE_fieldDressing",50],
			 ["ACE_morphine",50],
			 ["ACE_epinephrine",50],
			 ["ACE_bloodIV",50],
			 ["ACE_bodyBag",10],
			 ["UK3CB_BAF_TA31F_3D",1],
			 ["UK3CB_BAF_Eotech",1],
			 ["rhsusf_acc_compm4",1],
			 ["rhsusf_acc_anpeq15A",1],
			 ["rhsusf_assault_eagleaiii_ucp",1],
			 ["ACRE_PRC148",1]
		];
};
//load availible to Marines Seciton lead only
 if (g_class == "USMC_SL") then {
                _tmp_weapons =
                [
                                ["rhs_weap_m16a4_carryhandle_M203",1],
                                ["ACE_Vector",1],
								["rhsusf_weap_m1911a1",1]
								
                ];
           
                _tmp_magazines =
                [
                                ["30Rnd_556x45_Stanag",50],
								["30Rnd_556x45_Stanag_Tracer_Red",50],
                                ["rhsusf_mag_7x45acp_MHP",15]
								
								
                               
                ];
               
                _tmp_items = [
                                
                                ["ACE_MapTools",1],
                                ["ACE_fieldDressing",20],
                                ["ACE_morphine",10],
								["SatchelCharge_Remote_Mag",1],
								["DemoCharge_Remote_Mag",1],
								["ACE_M26_Clacker",1],
								["UK3CB_BAF_TA31F_3D",1],
								["UK3CB_BAF_Eotech",1],
								["rhsusf_acc_compm4",1],
								["rhsusf_acc_anpeq15A",1],
								["rhsusf_assault_eagleaiii_ocp",1],
								["1Rnd_HE_Grenade_shell", 40],
	                            ["1Rnd_Smoke_Grenade_shell", 10],
	                            ["1Rnd_SmokeRed_Grenade_shell", 10],
	                            ["1Rnd_SmokeGreen_Grenade_shell", 10],
	                            ["1Rnd_SmokeYellow_Grenade_shell", 10],
	                            ["1Rnd_SmokePurple_Grenade_shell", 10],
                             	["1Rnd_SmokeBlue_Grenade_shell", 10],
								["ACRE_PRC148",1],
								["UGL_FlareWhite_F", 10]
               
                ];
};
 
// load available to Marines Section Lead only.
 if (g_class == "USMC_TL1") then {
        _tmp_weapons =
        [
								["rhs_weap_m16a4_carryhandle_M203",1],
								["rhsusf_weap_m1911a1",1],
								["ACE_Vector",1],
								["UK3CB_BAF_AT4_AT_Launcher",2]
        ];
       
        _tmp_magazines =
        [
								["30Rnd_556x45_Stanag",50],
								["30Rnd_556x45_Stanag_Tracer_Red",50],
                                ["rhsusf_mag_7x45acp_MHP",15],
								["rhs_m136_mag", 2]
			];
		
		_tmp_items = [
								
                                ["ACE_MapTools",1],
                                ["ACE_fieldDressing",20],
                                ["ACE_morphine",10],
								["UK3CB_BAF_TA31F_3D",1],
								["UK3CB_BAF_Eotech",1],
								["rhsusf_acc_anpeq15A",1],
								["rhsusf_assault_eagleaiii_ocp",1],
								["1Rnd_HE_Grenade_shell", 40],
	                            ["1Rnd_Smoke_Grenade_shell", 10],
	                            ["1Rnd_SmokeRed_Grenade_shell", 10],
	                            ["1Rnd_SmokeGreen_Grenade_shell", 10],
	                            ["1Rnd_SmokeYellow_Grenade_shell", 10],
	                            ["1Rnd_SmokePurple_Grenade_shell", 10],
                             	["1Rnd_SmokeBlue_Grenade_shell", 10],
								["ACRE_PRC148",1],
								["UGL_FlareWhite_F", 10]
		];
								
};
 
// load available to marines team lead only.
 if (g_class == "USMC_TL2") then {
        _tmp_weapons =
        [
								["rhs_weap_m16a4_carryhandle_M203",1],
								["rhsusf_weap_m1911a1",1],
								["ACE_Vector",1],
								["UK3CB_BAF_AT4_AT_Launcher",2]
        ];
       
        _tmp_magazines =
        [
								["30Rnd_556x45_Stanag",50],
								["30Rnd_556x45_Stanag_Tracer_Red",50],
                                ["rhsusf_mag_7x45acp_MHP",15],
								["rhs_m136_mag", 2]
			];
		
		_tmp_items = [
								
                                ["ACE_MapTools",1],
                                ["ACE_fieldDressing",20],
                                ["ACE_morphine",10],
								["UK3CB_BAF_TA31F_3D",1],
								["UK3CB_BAF_Eotech",1],
								["rhsusf_acc_compm4",1],
								["rhsusf_acc_anpeq15A",1],
								["1Rnd_HE_Grenade_shell", 40],
	                            ["1Rnd_Smoke_Grenade_shell", 10],
	                            ["1Rnd_SmokeRed_Grenade_shell", 10],
	                            ["1Rnd_SmokeGreen_Grenade_shell", 10],
	                            ["1Rnd_SmokeYellow_Grenade_shell", 10],
	                            ["1Rnd_SmokePurple_Grenade_shell", 10],
                             	["1Rnd_SmokeBlue_Grenade_shell", 10],
								["rhsusf_assault_eagleaiii_ocp",1],
								["ACRE_PRC148",1],
								["UGL_FlareWhite_F", 10]
		];
};
 
// load available to marines team lead only.
 if (g_class == "USMC_TL3") then {
         _tmp_weapons =
        [
								["rhs_weap_m16a4_carryhandle_M203",1],
								["rhsusf_weap_m1911a1",1],
								["ACE_Vector",1],
								["UK3CB_BAF_AT4_AT_Launcher",2]
        ];
       
        _tmp_magazines =
        [
								["30Rnd_556x45_Stanag",50],
								["30Rnd_556x45_Stanag_Tracer_Red",50],
                                ["rhsusf_mag_7x45acp_MHP",15],
								["rhs_m136_mag", 2]
			];
		
		_tmp_items = [
								
                                ["ACE_MapTools",1],
                                ["ACE_fieldDressing",20],
                                ["ACE_morphine",10],
								["UK3CB_BAF_TA31F_3D",1],
								["UK3CB_BAF_Eotech",1],
								["rhsusf_acc_compm4",1],
								["rhsusf_acc_anpeq15A",1],
								["1Rnd_HE_Grenade_shell", 40],
	                            ["1Rnd_Smoke_Grenade_shell", 10],
	                            ["1Rnd_SmokeRed_Grenade_shell", 10],
	                            ["1Rnd_SmokeGreen_Grenade_shell", 10],
	                            ["1Rnd_SmokeYellow_Grenade_shell", 10],
	                            ["1Rnd_SmokePurple_Grenade_shell", 10],
                             	["1Rnd_SmokeBlue_Grenade_shell", 10],
								["rhsusf_assault_eagleaiii_ocp",1],
								["ACRE_PRC148",1],
								["UGL_FlareWhite_F", 10]
		];
};
 
// load available to Rifleman only.
 if (g_class == "USMC_R1") then {
        _tmp_weapons =
        [
            ["rhs_weap_m16a4_grip",1],
			["rhsusf_weap_m1911a1",1],
			["rhs_weap_fim92",1],
			["UK3CB_BAF_AT4_AT_Launcher",2],
			["UK3CB_BAF_Javelin_CLU",1],
			["UK3CB_BAF_Javelin_Slung_Tube", 2]
		];
       
        _tmp_magazines =
        [
             ["30Rnd_556x45_Stanag",50],
			 ["30Rnd_556x45_Stanag_Tracer_Red",50],
			 
			 
             ["rhsusf_mag_7x45acp_MHP",15],
			 
			 ["rhs_fim92_mag", 2]
			 
        ];
		
		_tmp_items = 
		[
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			["UK3CB_BAF_TA31F_3D",1],
		     ["UK3CB_BAF_Eotech",1],
			 ["rhsusf_acc_compm4",1],
			 ["rhsusf_acc_anpeq15A",1],
			 ["rhsusf_assault_eagleaiii_ocp",1],
			 ["ACRE_PRC148",1]
		];
};
 
// load available to Rifleman only.
 if (g_class == "USMC_R2") then {
        _tmp_weapons =
        [
            ["rhs_weap_m16a4_grip",1],
			["rhsusf_weap_m1911a1",1],
			["UK3CB_BAF_AT4_AT_Launcher",2],
			["rhs_weap_fim92",1],
			["UK3CB_BAF_Javelin_CLU",1],
			["UK3CB_BAF_Javelin_Slung_Tube", 2]
		];
       
        _tmp_magazines =
        [
             ["30Rnd_556x45_Stanag",50],
			 ["30Rnd_556x45_Stanag_Tracer_Red",50],
			 
			 
             ["rhsusf_mag_7x45acp_MHP",15],
			 
			 ["rhs_fim92_mag", 2]
			 
        ];
		
		_tmp_items = 
		[
			
		
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["UK3CB_BAF_TA31F_3D",1],
		     ["UK3CB_BAF_Eotech",1],
			 ["rhsusf_acc_compm4",1],
			 ["rhsusf_acc_anpeq15A",1],
			 ["rhsusf_assault_eagleaiii_ocp",1],
			 ["ACRE_PRC148",1]
		];
};
 
// load available to Rifleman only.
 if (g_class == "USMC_R3") then {
       _tmp_weapons =
        [
            ["rhs_weap_m16a4_grip",1],
			["rhsusf_weap_m1911a1",1],
			["UK3CB_BAF_AT4_AT_Launcher",2],
			["rhs_weap_fim92",1],
			["UK3CB_BAF_Javelin_CLU",1],
			["UK3CB_BAF_Javelin_Slung_Tube", 2]
		];
       
        _tmp_magazines =
        [
            ["30Rnd_556x45_Stanag",50],
			["30Rnd_556x45_Stanag_Tracer_Red",50],
			
			
             ["rhsusf_mag_7x45acp_MHP",15],
			 
			 ["rhs_fim92_mag", 2]
			 
        ];
		
		_tmp_items = 
		[
			
             ["ACE_MapTools",1],
	         ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["UK3CB_BAF_TA31F_3D",1],
		     ["UK3CB_BAF_Eotech",1],
			 ["rhsusf_acc_compm4",1],
			 ["rhsusf_acc_anpeq15A",1], 
			 ["rhsusf_assault_eagleaiii_ocp",1],
			 ["ACRE_PRC148",1]
		];
};
//load availible to us rifleman only
 if (g_class == "USMC_R2") then {
       _tmp_weapons =
        [
            ["rhs_weap_m16a4_grip",1],
			["rhsusf_weap_m1911a1",1],
			["rhs_weap_fim92",1],
			["UK3CB_BAF_AT4_AT_Launcher",2]
		
		];
       
        _tmp_magazines =
        [
             ["30Rnd_556x45_Stanag",50],
			 ["30Rnd_556x45_Stanag_Tracer_Red",50],			 
			 ["rhs_fim92_mag",2],
             ["rhsusf_mag_7x45acp_MHP",15],
			 ["rhs_m136_mag", 2]
			 
        ];
		
		_tmp_items = 
		[
			
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["UK3CB_BAF_TA31F_3D",1],
		     ["UK3CB_BAF_Eotech",1],
			 ["rhsusf_acc_compm4",1],
			 ["rhsusf_acc_anpeq15A",1],
			 ["rhsusf_assault_eagleaiii_ocp",1],
			 ["ACRE_PRC148",1]
		];
};
//load availible to marine assistant AR
 if (g_class == "USMC_A1") then {
       _tmp_weapons =
        [
            ["rhs_weap_m16a4_grip",1],
			["rhsusf_weap_m1911a1",1],
			["UK3CB_BAF_AT4_AT_Launcher",2],
			["rhs_weap_fim92",1]
          		
		];
       
        _tmp_magazines =
        [
           ["30Rnd_556x45_Stanag",50],
		   ["30Rnd_556x45_Stanag_Tracer_Red",50],
		   ["rhs_fim92_mag",2],		
             ["rhsusf_mag_7x45acp_MHP",15],
			 ["rhs_fgm148_magazine_AT", 2],
			 
			 ["rhsusf_200Rnd_556x45_soft_pouch",10]
        ];
		
		_tmp_items = 
		[
			
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["UK3CB_BAF_TA31F_3D",1],
		     ["UK3CB_BAF_Eotech",1],
			 ["rhsusf_acc_compm4",1],
			 ["rhsusf_acc_anpeq15A",1],
			 ["rhsusf_assault_eagleaiii_ocp",1],
			 ["ACRE_PRC148",1]
		];
};
//load availible to marines assistant AR
 if (g_class == "USMC_A2") then {
       _tmp_weapons =
        [
            ["rhs_weap_m16a4_grip",1],
			["rhsusf_weap_m1911a1",1],
			["rhs_weap_fim92",1],
			["UK3CB_BAF_AT4_AT_Launcher",2]
			
			  
		];
       
        _tmp_magazines =
        [
             ["30Rnd_556x45_Stanag",50],
			 ["30Rnd_556x45_Stanag_Tracer_Red",50],
			 
             ["rhsusf_mag_7x45acp_MHP",15],
			 
			 ["rhsusf_200Rnd_556x45_soft_pouch",10]
        ];
		
		_tmp_items = 
		[
			
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["UK3CB_BAF_TA31F_3D",1],
		     ["UK3CB_BAF_Eotech",1],
			 ["rhsusf_acc_compm4",1],
			 ["rhsusf_acc_anpeq15A",1],
			 ["rhsusf_assault_eagleaiii_ocp",1],
			 ["ACRE_PRC148",1]
		];
};
//load availible to marines assistant AR only
if (g_class == "USMC_AR1") then {
       _tmp_weapons =
        [
            ["rhs_weap_m249_pip_S",1],
			["UK3CB_BAF_AT4_AT_Launcher",2],
			["rhsusf_weap_m1911a1",1]  
			  
		];
       
        _tmp_magazines =
        [
            ["rhs_200rnd_556x45_M_SAW",25],
			
            ["rhsusf_mag_7x45acp_MHP",15]
        ];
		
		_tmp_items = 
		[
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			["rhsusf_acc_ELCAN",1],
		     ["UK3CB_BAF_Eotech",1],
			 ["rhsusf_acc_compm4",1],
			 ["rhsusf_acc_anpeq15A",1],
			 ["rhsusf_assault_eagleaiii_ocp",1],
			 ["ACRE_PRC148",1]
		];
};
//load availible to marine assistant ar only
if (g_class == "USMC_AR2") then {
       _tmp_weapons =
        [
            ["rhs_weap_m249_pip_S",1],
			["UK3CB_BAF_AT4_AT_Launcher",2],
			["rhsusf_weap_m1911a1",1]  
			  
		];
       
        _tmp_magazines =
        [
            ["rhs_200rnd_556x45_M_SAW",25],
			
            ["rhsusf_mag_7x45acp_MHP",15]
        ];
		
		_tmp_items = 
		[
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			["rhsusf_acc_ELCAN",1],
		     ["UK3CB_BAF_Eotech",1],
			 ["rhsusf_acc_compm4",1],
			 ["rhsusf_acc_anpeq15A",1],
			 ["rhsusf_assault_eagleaiii_ocp",1],
			 ["ACRE_PRC148",1]
		];
};
//loadout availible to marine AR only
if (g_class == "USMC_AR3") then {
       _tmp_weapons =
        [
            ["rhs_weap_m249_pip_S",1],
			["rhs_weap_m240B",1],
			["UK3CB_BAF_AT4_AT_Launcher",2],
			["rhsusf_weap_m1911a1",1]  
			  
		];
       
        _tmp_magazines =
        [
            ["rhs_200rnd_556x45_M_SAW",25],
			["rhsusf_100Rnd_762x51",10],
			
            ["rhsusf_mag_7x45acp_MHP",15]
        ];
		
		_tmp_items = 
		[
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			["rhsusf_acc_ELCAN",1],
		     ["UK3CB_BAF_Eotech",1],
			 ["rhsusf_acc_anpeq15A",1],
			 ["rhsusf_assault_eagleaiii_ocp",1],
			 ["ACRE_PRC148",1]
		];
};
//loadout availible to marine medic only
 if (g_class == "USMC_MED") then {
       _tmp_weapons =
        [
           ["rhs_weap_m16a4_grip",1],
			["rhsusf_weap_m1911a1",1]
			  
		];
       
        _tmp_magazines =
        [
            ["30Rnd_556x45_Stanag",50],
			["30Rnd_556x45_Stanag_Tracer_Red",50],
             ["rhsusf_mag_7x45acp_MHP",15]
        ];
		
		_tmp_items = 
		[
			
			["ACE_fieldDressing",50],
			["ACE_morphine",50],
			["ACE_epinephrine",50],
			["ACE_bloodIV",50],
			["UK3CB_BAF_TA31F_3D",1],
		     ["UK3CB_BAF_Eotech",1],
			 ["rhsusf_acc_compm4",1],
			 ["rhsusf_acc_anpeq15A",1],
			 ["rhsusf_assault_eagleaiii_ocp",1],
			 ["ACRE_PRC148",1]
		];
};
//loadout availible to wildcat pilot only
 if (g_class == "PILOT_WILDCAT") then {
       _tmp_weapons =
        [
           
			["UK3CB_BAF_L131A1",1]
			  
		];
       
        _tmp_magazines =
        [
            
             ["UK3CB_BAF_17Rnd_9mm",15]
        ];
		
		_tmp_items = 
		[
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["ACRE_PRC148",1]
		];
};
//loadout availible to chinook pilot only
 if (g_class == "PILOT_CHINNOK") then {
       _tmp_weapons =
        [
           
			["rhsusf_weap_m1911a1",1]
			  
		];
       
        _tmp_magazines =
        [
            
             ["rhsusf_mag_7x45acp_MHP",15]
        ];
		
		_tmp_items = 
		[
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["ACRE_PRC148",1]
		];
};
//loadout availible to blackhawk pilot only
 if (g_class == "PILOT_BLACKHAWK") then {
       _tmp_weapons =
        [
           
			["rhsusf_weap_m1911a1",1]
			  
		];
       
        _tmp_magazines =
        [
            
             ["rhsusf_mag_7x45acp_MHP",15]
        ];
		
		_tmp_items = 
		[
			
			["rhsusf_acc_ACOG2",1],
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["ACRE_PRC148",1]
		];
};
//loadout availible to sniper team spotter only
 if (g_class == "SPOTTER") then {
       _tmp_weapons =
        [
           
            ["UK3CB_BAF_L129A1_FGrip",1]
			  
		];
       
        _tmp_magazines =
        [
            
             ["30Rnd_556x45_Stanag",50],
			 ["UK3CB_BAF_20Rnd",15]
			 
        ];
		
		_tmp_items = 
		[
		     ["rhsusf_acc_LEUPOLDMK4",1],
			 ["ACE_ATragMX",1],
			 ["Trixie_Ghillie_Uniform_02",1],
			 ["Trixie_Ghillie_Uniform_03",1],
			 ["ACE_Kestrel4500",1],
			 ["ACE_SpottingScope",1],
			 ["ACE_Vector",1],
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["ACE_MX2A",1],
			 ["ACE_DAGR",1],
			 ["ACE_Sandbag_empty",5],
			 ["ACRE_PRC148",1]
		];
};
//load availible to sniper team sniper only
 if (g_class == "SNIPER") then {
       _tmp_weapons =
        [
           
			["Trixie_AWM338",1],
			["Trixie_AWM338_Ghillie",1],
			["Trixie_M110",1],
			["Trixie_M110_NG",1],
			["UK3CB_BAF_L131A1",1]
			  
		];
       
        _tmp_magazines =
        [
            
             ["Trixie_5x338_Mag",15],
			 ["Trixie_20x762_Mag",15]
			 
        ];
		
		_tmp_items = 
		[
			["optic_LRPS",1],
		    ["Trixie_Ghillie_Uniform_02",1],
			["ACE_ATragMX",1],
		    ["Trixie_Ghillie_Uniform_03",1],
            ["ACE_MapTools",1],
            ["ACE_fieldDressing",20],
            ["ACE_morphine",10],
			["ACE_Vector",1],
			["ACE_MX2A",1],
			["ACE_Sandbag_empty",5],
			["ACE_DAGR",1],
			["ACRE_PRC148",1]
		];
};
//load availible to swedish section lead only
 if (g_class == "FRE_SL") then {
       _tmp_weapons =
        [
			["ACE_Vector",1],
			["R3F_Famas_G2_DES",1]

			  
		];
       
        _tmp_magazines =
        [
            
             ["R3F_30Rnd_556x45_FAMAS",50],
			 ["R3F_30Rnd_556x45_TRACER_FAMAS",50]
			 
        ];
		
		_tmp_items = 
		[
			
			["R3F_AIMPOINT_DES",1],
            ["ACE_MapTools",1],
            ["ACE_fieldDressing",20],
            ["ACE_morphine",10],
			["ACRE_PRC148",1]
		];
};
//load availible to swedish 2ic only
if (g_class == "FRE_FTL") then {
       _tmp_weapons =
        [
           
			["R3F_Famas_G2_DES",1],
			["ACE_Vector",1],
			["UK3CB_BAF_AT4_AT_Launcher",2]

			  
		];
       
        _tmp_magazines =
        [
            
             ["R3F_30Rnd_556x45_FAMAS",50],
			 ["R3F_30Rnd_556x45_TRACER_FAMAS",50]
			 
        ];
		
		_tmp_items = 
		[
			
			["R3F_AIMPOINT_DES",1],
            ["ACE_MapTools",1],
            ["ACE_fieldDressing",20],
            ["ACE_morphine",10],
			["ACRE_PRC148",1]
		];
};
//load availible to swedish AT only
 if (g_class == "FRE_RFR") then {
       _tmp_weapons =
        [
           
			["R3F_Famas_G2_DES",1],
            ["UK3CB_BAF_AT4_AT_Launcher",1]
			  
		];
       
        _tmp_magazines =
        [
            
             ["R3F_30Rnd_556x45_FAMAS",50],
			 ["R3F_30Rnd_556x45_TRACER_FAMAS",50]
			 
        ];
		
		_tmp_items = 
		[
			
			["R3F_AIMPOINT_DES",1],
            ["ACE_MapTools",1],
            ["ACE_fieldDressing",20],
            ["ACE_morphine",10],
			["ACRE_PRC148",1]
		];
};
//load availible to swedish AAT only
 if (g_class == "FRE_GRE") then {
       _tmp_weapons =
        [
           
			["R3F_Famas_G2_M203_DES",1],
			["UK3CB_BAF_AT4_AP_Launcher",2]
            			  
		];
       
        _tmp_magazines =
        [
            
             ["R3F_30Rnd_556x45_FAMAS",50],
			 ["1Rnd_HE_Grenade_shell", 40],
			 ["1Rnd_Smoke_Grenade_shell", 10],
			 ["1Rnd_SmokeRed_Grenade_shell", 10],
			 ["1Rnd_SmokeGreen_Grenade_shell", 10],
			 ["1Rnd_SmokeYellow_Grenade_shell", 10],
			 ["1Rnd_SmokePurple_Grenade_shell", 10],
			 ["1Rnd_SmokeBlue_Grenade_shell", 10],
			 ["R3F_30Rnd_556x45_TRACER_FAMAS",50]
			 
        ];
		
		_tmp_items = 
		[
			
			["R3F_AIMPOINT_DES",1],
            ["ACE_MapTools",1],
            ["ACE_fieldDressing",20],
            ["ACE_morphine",10],
			["ACRE_PRC148",1]
		];
};
//load availible to swedish grenadier only
 if (g_class == "FRE_AR") then {
       _tmp_weapons =
        [
           
			["R3F_Minimi",1]

			  
		];
       
        _tmp_magazines =
        [
            
             ["R3F_200Rnd_556x45_MINIMI",50],
			 ["R3F_200Rnd_556x45_TRACER_MINIMI",50]
			 
        ];
		
		_tmp_items = 
		[
            ["ACE_MapTools",1],
            ["ACE_fieldDressing",20],
            ["ACE_morphine",10],
			["ACRE_PRC148",1]
		];
};
//load availible to swedish AR only
 if (g_class == "FRE_AT") then {
       _tmp_weapons =
        [
           
			["R3F_Famas_G2_DES",1],
			["R3F_ERYX",1]

			  
		];
       
        _tmp_magazines =
        [
            
             ["R3F_30Rnd_556x45_FAMAS",50],
			 ["R3F_30Rnd_556x45_TRACER_FAMAS",50],
			 ["R3F_ERYX_Mag",5]
			 
        ];
		
		_tmp_items = 
		[
			
			["R3F_AIMPOINT_DES",1],
            ["ACE_MapTools",1],
            ["ACE_fieldDressing",20],
            ["ACE_morphine",10],
			["ACRE_PRC148",1]
		];
};
//load availible to swedish mg only
 if (g_class == "FRE_MED") then {
       _tmp_weapons =
        [
           
			["R3F_Famas_G2_DES",1]

			  
		];
       
        _tmp_magazines =
        [
            
             ["R3F_30Rnd_556x45_FAMAS",50],
			 ["R3F_30Rnd_556x45_TRACER_FAMAS",50]
			 
        ];
		
		_tmp_items = 
		[
			
			["R3F_AIMPOINT_DES",1],
			["ACE_fieldDressing",50],
			["ACE_morphine",50],
			["ACE_epinephrine",50],
			["ACE_bloodIV",50],
            ["ACE_MapTools",1],
            ["ACE_fieldDressing",20],
            ["ACE_morphine",10],
			["ACRE_PRC148",1]
		];
};
/*
//load availbel to swedish medic only
 if (g_class == "SWD_MED") then {
       _tmp_weapons =
        [
           
			["SAM_AK5C",1]
             
			  
		];
       
        _tmp_magazines =
        [
            
             ["SAM_30Rnd_556x45_Pmag",50],
			 ["SAM_30Rnd_556x45_Pmag_T",50]
			 
        ];
		
		_tmp_items = 
		[
			
			["sam_acco_aimpoint",1],
			["ACE_fieldDressing",50],
			["ACE_morphine",50],
			["ACE_epinephrine",50],
			["ACE_bloodIV",50],
            ["ACE_MapTools",1],
            ["ACE_fieldDressing",20],
            ["ACE_morphine",10],
			["ACRE_PRC148",1]
		];
 };
 */
//load availibe to jtac leader only
  if (g_class == "JTAC_SL") then {
                _tmp_weapons =
                [
                                ["rhs_weap_m4a1_carryhandle_m203",1],
                                ["ACE_Vector",1],
								["rhsusf_weap_m1911a1",1]
								
                ];
           
                _tmp_magazines =
                [
                                ["30Rnd_556x45_Stanag",50],
								["30Rnd_556x45_Stanag_Tracer_Red",50],
                                ["rhsusf_mag_7x45acp_MHP",15],
	                            ["1Rnd_Smoke_Grenade_shell", 10],
	                            ["1Rnd_SmokeRed_Grenade_shell", 10],
	                            ["1Rnd_SmokeGreen_Grenade_shell", 10],
	                            ["1Rnd_SmokeYellow_Grenade_shell", 10],
	                            ["1Rnd_SmokePurple_Grenade_shell", 10],
                             	["1Rnd_SmokeBlue_Grenade_shell", 10],
								["UGL_FlareWhite_F", 10]
								
                               
                ];
               
                _tmp_items = [
                                
                                ["ACE_MapTools",1],
                                ["ACE_fieldDressing",20],
                                ["ACE_morphine",10],
								["rhsusf_acc_anpeq15A",1],
								["ACRE_PRC148",1],
								["Laserdesignator",1],
								["Laserbatteries",1]
               
                ];
};
//load availible to forward air controller only
  if (g_class == "JTAC_RF") then {
                _tmp_weapons =
                [
                                ["rhs_weap_m4a1_carryhandle_m203",1],
                                ["ACE_Vector",1],
								["rhsusf_weap_m1911a1",1]
								
                ];
           
                _tmp_magazines =
                [
                                ["30Rnd_556x45_Stanag",50],
								["30Rnd_556x45_Stanag_Tracer_Red",50],
                                ["rhsusf_mag_7x45acp_MHP",15],
	                            ["1Rnd_Smoke_Grenade_shell", 10],
	                            ["1Rnd_SmokeRed_Grenade_shell", 10],
	                            ["1Rnd_SmokeGreen_Grenade_shell", 10],
	                            ["1Rnd_SmokeYellow_Grenade_shell", 10],
	                            ["1Rnd_SmokePurple_Grenade_shell", 10],
                             	["1Rnd_SmokeBlue_Grenade_shell", 10],
								["UGL_FlareWhite_F", 10]
								
                               
                ];
               
                _tmp_items = [
                                
                                ["ACE_MapTools",1],
                                ["ACE_fieldDressing",20],
                                ["ACE_morphine",10],
								["rhsusf_acc_anpeq15A",1],
								["ACRE_PRC148",1],
								["Laserdesignator",1],
								["Laserbatteries",1]
               
                ];
};
//load availbe to a10 pilot only
 if (g_class == "PILOT_A10") then {
       _tmp_weapons =
        [
           
			["rhsusf_weap_m1911a1",1]
			  
		];
       
        _tmp_magazines =
        [
            
             ["rhsusf_mag_7x45acp_MHP",15]
        ];
		
		_tmp_items = 
		[
			
             ["ACE_MapTools",1],
             ["ACE_fieldDressing",20],
             ["ACE_morphine",10],
			 ["ACE_microDAGR",1],
			 ["ACRE_PRC148",1]
		];
};
 
{
        _weapons set [count _weapons, _x];
} forEach _tmp_weapons;
 
{
        _magazines set [count _magazines, _x];
} forEach _tmp_magazines;
 
{
        _items set [count _items, _x];
} forEach _tmp_items;

 
// create and fill the box.
_box = _boxType createVehicleLocal (getMarkerPos _marker);
_box setPosATL (getMarkerPos _marker);
_box allowDamage false;
while {true} do {
        refill_box = false;
        // empty it.
        clearWeaponCargo _box;
        clearMagazineCargo _box;
        clearItemCargo _box;
		clearBackpackCargo _box;
       
        // add in all weapons.
        {_box addWeaponCargo [(_x select 0),(_x select 1)]} foreach _weapons;
       
        // add in all magazines.
        {_box addMagazineCargo [(_x select 0),(_x select 1)]} foreach _magazines;
       
        {_box addItemCargo [(_x select 0),(_x select 1)]} foreach _items;
		
	
       
        // wait x amount of seconds then refill box.
        sleep _timer;
};