// ==============================================================================
// PUBLIC CLASS: MelodyGenerator
// File        : MelodyGenerator.ck
// Author      : son0p
// Init Date   : 2013-Dec-31
// Dependencies: Mode.ck
// License     :
// Git repo    : https://github.com/son0p/ChucK-classes-and-patches
// ==============================================================================
// This class takes root note and mode then returns a melody

public class MelodyGenerator
{
	static int root;
	int number;
	 int notes[];
	// creates a melody array  of the notes array size
	 int melody[8];
	
	Mode mode;

	// Generate melody 
	fun int[] generateMelody(int root, int modeInput)
	{
		mode.generateMode(root, modeInput) @=> int notes[];
		<<< "Mode: ", modeInput >>>;
		for (0 => int i; i < notes.cap(); i++)
		{
			Math.random2(1, notes.cap())-1 => int notesSelector;
			notes[notesSelector] => int pushNote;
			// Fill the array with selected notes
			pushNote =>  melody[i];
		}
		return melody;
	}
}


// ==============================================================================
// Test code

/*
MelodyGenerator m;

m.generateMelody(60,2);
*/
//===============================================================================


