// ================================================================================
// PUBLIC CLASS: MelodyGenerator
// File        : MelodyGenerator.ck
// Author      : son0p
// Init Date   : 2013-Dec-31
// Dependencies: Mode.ck
// License     : 
// ================================================================================
// This class takes root note and mode then returns a melody

public class MelodyGenerator
{
	static int root;
	int number;

	Mode mode;

	// Generate melody 
	fun int[] melody(int root, int modeInput)
	{
	// TODO we need to call modes from Mode class not here	  	
		if (modeInput == 1)  
		{
			mode.ionian(root) @=> int notes[];
			return notes;
		}
	
		if (modeInput == 2)  
		{
			mode.dorian(root) @=> int notes[];
			return notes;
		}
	
		if (modeInput == 3)  
		{
			mode.phrygian(root) @=> int notes[];
			return notes;
		}
		if (modeInput == 4)  
		{
			mode.lydian(root) @=> int notes[];
			return notes;
		}
		if (modeInput == 5)  
		{
			mode.mixolidian(root) @=> int notes[];
			return notes;
		}
		if (modeInput == 6)  
		{
			mode.aeolian(root) @=> int notes[];
			return notes;
		}
		if (modeInput == 7)  
		{
			mode.locrian(root) @=> int notes[];
			return notes;
		}
	}
}


// ================================================================================
// Test code
/*




*/
