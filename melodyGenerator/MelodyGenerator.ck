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
	// initialize new note to be compared in rules
	int oldNote;
	int pushNote;
	Mode mode;
	int motive[7];

	// Generate Motive

	// Generate Phrase member

	// Generate Phrase

	// Generate period

	// Generate Double period

	// Generate phrase group

	// Generate melody 
	fun int[] generateMelody(int root, int modeInput)
	{
		// Ask for notes to  Mode class
		mode.generateMode(root, modeInput) @=> int notes[];
		<<< "Mode: ", modeInput >>>;

		// Go over Mode array to pushing notes that obey the rules 
		for	(0 => int i; i < melody.cap(); i++)
		{
			// Random choose for a note.
			Math.random2(1, notes.cap())-1 => int noteSelector;

			// Rule: Intervals of max 6 tones
			noteSelector => int newNote;

			if(newNote < (oldNote + 6))
			{
				<<< "Rule 1: OK" >>>;
				notes[noteSelector] => int pushNote;
				pushNote => int oldNote;
				// Fill the array with selected notes
				pushNote =>  melody[i];
				<<< "push Note:",pushNote>>>; 
			}
			
	
			
		}
		return melody;
	}

	// Posible generation of short melody

	fun int[] generateMotive(int toMotive[])
	{
		for( 0 => int i; i < 4; i++ )	
		{
			// select first four notes of toMotive array and fill motive array	
			toMotive[i] => motive[i];
		}
		
		return motive;
	}
	
	// TODO : duration must fill a measure
	fun int generateDuration()
	{
		Math.random2(1, durations.cap())-1 => int durationSelector;
		durations[durationSelector] => int pushDuration;
		return pushDuration;
	}
	
}


// ==============================================================================
// Test code

/*
MelodyGenerator m;

m.generateMelody(60,2);
*/
//===============================================================================


