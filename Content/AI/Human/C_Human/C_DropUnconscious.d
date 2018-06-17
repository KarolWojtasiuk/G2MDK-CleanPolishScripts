// **************************************************************
// C_DropUnconscious
// -----------------
// self und other hier vom Programm initialisiert:
// self ist immer der NPC, f�r den diese Funktion den Check macht
// other ist immer der T�ter (der den Treffer gelandet hat)
// **************************************************************

func int C_DropUnconscious()
{
	
	// ------ Folgende NSCs t�ten immer ------
	if (other.guild > GIL_SEPERATOR_HUM)
	|| (other.guild == GIL_DMT)
	|| (other.guild == GIL_BDT)
	|| (other.aivar[AIV_DropDeadAndKill] == TRUE)
	{
		return FALSE;
	};
		
	// ------ nur echte Humans k�nnen Unconscious werden ------
	if (self.guild < GIL_SEPERATOR_HUM)
	{
		if (self.guild != GIL_DMT)
		&& (self.guild != GIL_BDT)
		&& (self.aivar[AIV_DropDeadAndKill] == FALSE)
		{
			return TRUE;
		};
	};
			
	return FALSE;
};

