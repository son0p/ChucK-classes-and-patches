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
	[2,4,8,16] @=> int optDurations[];
	// initialize new note to be compared in rules
	int oldNote;
	int pushNote;
	Mode mode;
	int motive[7];
	int durations[8];

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
		// <<< "Mode: ", modeInput >>>;

		// Go over Mode array to pushing notes that obey the rules 
		for	(0 => int i; i < melody.cap(); i++)
		{
			// Random choose for a note.
			Math.random2(1, notes.cap())-1 => int noteSelector;

			// Rule: Intervals of max 6 tones
			noteSelector => int newNote;

			if(newNote < (oldNote + 6))
			{
				// <<< "Rule 1: OK" >>>;
				notes[noteSelector] => int pushNote;
				pushNote => int oldNote;
				// Fill the array with selected notes
				pushNote =>  melody[i];
				// <<< "push Note:",pushNote>>>; 
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
	
	// Size of the array of durations must be equal to number of notes
	fun int[] generateDuration()
	{
		// we have to fit in a measure, so reset the sumatory of durations
		0 => int sumDurations;

		for (0 => int i; i < durations.cap(); i++)
		{
		
			// randomly select from otions of durations
			Math.random2(1, optDurations.cap())-1 => int durationSelector;
			optDurations[durationSelector] => int pushDuration;
			// fill the array
			pushDuration => durations[i];
			<<< "durArray : "+ durations[i]>>>;
			// sum the values to evaluate total and fit in a measure, fill with silences?
			pushDuration +=>  sumDurations;
			
		}
			<<< "-------------------------">>>;		
		// sum array to check measure fit
		

		<<< "First 4 elements Sum : " + sumDurations >>>;
		return durations;	
	}

}


// ==============================================================================
// Test code

/*
MelodyGenerator m;

m.generateMelody(60,2);
*/
//===============================================================================


