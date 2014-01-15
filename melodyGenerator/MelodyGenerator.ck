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
	// TODO: This must be :
	// int melody[notes.cap()];
	// but produces NullPointerException
	int melody[8];
	[2,4,8,16] @=> int durations[];
	int oldNote;
	int pushNote;
	Mode mode;

	// Generate melody 
	fun int[] generateMelody(int root, int modeInput)
	{
		mode.generateMode(root, modeInput) @=> int notes[];
		// initialize new note to be compared in rules
	
		<<< "Mode: ", modeInput >>>;
		for (0 => int i; i < notes.cap(); i++)
		{
			Math.random2(1, notes.cap())-1 => int noteSelector;
			// Rule: Intervals of max X tones
			noteSelector => int newNote;
		
			if(newNote > (oldNote + 6))
			{
				<<< "over" >>>;
			}
			if(newNote < (oldNote + 6))
			{
				<<< "GREEN" >>>;
				notes[noteSelector] => int pushNote;
				pushNote => int oldNote;
				// Fill the array with selected notes
				pushNote =>  melody[i];
			}
			
		}
	
		return melody;
	}

	fun int generateDuration()
	{
		Math.random2(1, durations.cap())-1 => int durationSelector;
		durations[durationSelector] => int pushDuration;
		return pushDuration;
	}

// Generate rythm
	
}


// ==============================================================================
// Test code

/*
MelodyGenerator m;

m.generateMelody(60,2);
*/
//===============================================================================


