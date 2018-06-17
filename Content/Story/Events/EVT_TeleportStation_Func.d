// ****************************
// EVT_TELEPORTSTATION_FUNC       
// ****************************
 
func void EVT_TELEPORTSTATION_FUNC ()
{	
  	Wld_PlayEffect("spellFX_Teleport_RING",  hero  , hero	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue (hero);	//Joly:wegen Seitw�rts da durch rennen.
	
	SCUsed_TELEPORTER = TRUE;			//SC hat schon mal einen Teleporter benutzt
	
	if (CurrentLevel == NEWWORLD_ZEN)
	{
		if (Npc_GetDistToWP(hero,"NW_TELEPORTSTATION_CITY")<3000)
		{
			AI_Teleport	(hero, "NW_TELEPORTSTATION_TAVERNE"); 

		
			SCUsed_NW_TELEPORTSTATION_CITY = TRUE; 
		}
		else if (Npc_GetDistToWP(hero, "NW_TELEPORTSTATION_TAVERNE")<3000)
		{
		 	AI_Teleport	(hero, "NW_TELEPORTSTATION_MAYA");


			SCUsed_NW_TELEPORTSTATION_TAVERNE = TRUE; 
		}
		else if (Npc_GetDistToWP(hero, "NW_TELEPORTSTATION_MAYA")<3000)
		{
			AI_Teleport	(hero, "NW_TELEPORTSTATION_CITY"); 


			SCUsed_NW_TELEPORTSTATION_MAYA = TRUE;
		}
		else	//else fall wird nicht benutzt, nur zur sicherheit
		{
			AI_Teleport	(hero, "MARKT"); 
		};
		
		
		if (SCUsed_NW_TELEPORTSTATION_MAYA == TRUE)
		&& (SCUsed_NW_TELEPORTSTATION_TAVERNE == TRUE)
		&& (SCUsed_NW_TELEPORTSTATION_CITY == TRUE)
		&& (SCUsed_AllNWTeleporststones == FALSE)
		{
			SCUsed_AllNWTeleporststones = TRUE;
			B_GivePlayerXP (XP_Addon_AllNWTeleporststones);
		};			
	}
	else if (CurrentLevel == ADDONWORLD_ZEN)
	{
		if	Hlp_StrCmp  (Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_NORTH_WP")
		{
			AI_Teleport	(hero, "ADW_PORTALTEMPEL_TELEPORTSTATION"); 


			SCUsed_ADW_TELEPORTSTATION_PORTALTEMPEL = TRUE;
		}
		else if	Hlp_StrCmp  (Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_EAST_WP")
		{
			AI_Teleport	(hero, "ADW_ADANOSTEMPEL_TELEPORTSTATION");  
	
	
			SCUsed_ADW_TELEPORTSTATION_ADANOSTEMPEL = TRUE;
		}
		else if	Hlp_StrCmp  (Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_SOUTHEAST_WP")
		{
			AI_Teleport	(hero, "ADW_SOUTHEAST_TELEPORTSTATION");  
	
	
			SCUsed_ADW_TELEPORTSTATION_SOUTHEAST = TRUE;
		}
		else if	Hlp_StrCmp  (Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_SOUTHWEST_WP")
		{
			AI_Teleport	(hero, "ADW_SOUTHWEST_TELEPORTSTATION");  
	
	
			SCUsed_ADW_TELEPORTSTATION_SOUTHWEST = TRUE;
		}
		else if	Hlp_StrCmp  (Npc_GetNearestWP(hero),"ADW_ENTRANCE_TELEPORT_WEST_WP")
		{
			AI_Teleport	(hero, "ADW_PIRATES_TELEPORTSTATION");  


			if (MIS_KrokoJagd == LOG_SUCCESS)
			&& (SCUsed_ADW_TELEPORTSTATION_PIRATES_JACKSMONSTER == FALSE)
			{
				// Monster, die bei der Jagd mit Alligator Jack st�ren
				Wld_InsertNpc  	(Gobbo_Black,"ADW_PIRATECAMP_WATERHOLE_GOBBO");
				Wld_InsertNpc 	(Gobbo_Black,"ADW_PIRATECAMP_WATERHOLE_GOBBO");
				Wld_InsertNpc 	(Giant_DesertRat,"ADW_CANYON_PATH_TO_MINE1_05");
				Wld_InsertNpc 	(Giant_DesertRat,"ADW_CANYON_PATH_TO_MINE1_05");
				Wld_InsertNpc 	(Blattcrawler, 	"ADW_CANYON_TELEPORT_PATH_07");
				Wld_InsertNpc 	(Blattcrawler, 	"ADW_CANYON_TELEPORT_PATH_07");	
				SCUsed_ADW_TELEPORTSTATION_PIRATES_JACKSMONSTER = TRUE;
			};	
	
			SCUsed_ADW_TELEPORTSTATION_PIRATES = TRUE;
		}
		else if	Hlp_StrCmp  (Npc_GetNearestWP(hero),"ADW_ADANOSTEMPEL_RAVENTELEPORT_OUT")
		{
			AI_Teleport	(hero, "ADW_ADANOSTEMPEL_TELEPORTSTATION");  

			if (SCUsed_ADW_TELEPORTSTATION_RAVENTELEPORT_OUT == FALSE)
			{
			};	
			SCUsed_ADW_TELEPORTSTATION_RAVENTELEPORT_OUT = TRUE;
		}
		else	//immer zur�ck zum ADW_ENTRANCE f�r alle anderen Teleportstations
		{
			AI_Teleport	(hero, "ADW_ENTRANCE"); 
		};
	};	
};
var int TriggeredTeleporterADW;
var int ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime;
func void ADW_PORTALTEMPEL_FOCUS_FUNC ()//Joly: kommt, wenn ein Focusstein in ein Sockel eingesetzt wird.
{	
	Npc_RemoveInvItems	(hero ,ItMi_Focus, 1);
	TriggeredTeleporterADW = (TriggeredTeleporterADW + 1);
	Snd_Play ("MFX_TELEKINESIS_STARTINVEST");
	
	if (TriggeredTeleporterADW >= 5)
	{
		SC_ADW_ActivatedAllTelePortStones = TRUE;
	};
	

	if (ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime == FALSE)
	&& (Npc_GetDistToWP(hero,"ADW_PORTALTEMPEL_TELEPORTSTATION") < 3000)
	{
		if ((Npc_IsDead(Stoneguardian_NailedPortalADW1))== FALSE)
		&& (Stoneguardian_NailedPortalADW1.aivar[AIV_EnemyOverride] == TRUE)
		{
			Snd_Play ("THRILLJINGLE_02"); 
		};
		ADW_PORTALTEMPEL_FOCUS_FUNC_OneTime = TRUE;
	};
};  
    
    
   