// BPM.ck
// this class is from the Courser course Calarts:
// Introduction to Programming for Musicians and Digital Artists
// by Ajay Kapur

public class BPM
{
    // global variables
    dur myDuration[4];
    static dur wholeNote, halfNote, quarterNote, eighthNote, tripletNote, sixteenthNote, thirtysecondNote;
    
    fun void tempo(float beat)  {
        // beat is BPM, example 120 beats per minute
        
        60.0/(beat) => float SPB; // seconds per beat
        SPB :: second => quarterNote;
		quarterNote*4 => wholeNote;
		quarterNote*2 => halfNote;
        quarterNote*0.5 => eighthNote;
		quarterNote*0.333 => tripletNote;
        eighthNote*0.5 => sixteenthNote;
        sixteenthNote*0.5 => thirtysecondNote;
        
        // store data in array
        [wholeNote, halfNote, quarterNote, eighthNote, tripletNote, sixteenthNote, thirtysecondNote] @=> myDuration;
    }
}

