// BPM.ck
// this class is adapted from the Courser course Calarts:
// Introduction to Programming for Musicians and Digital Artists
// by Ajay Kapur

public class BPM
{
    // global variables
    
    static dur pulse;
    
    fun void tempo(float beat)  {
        // beat is BPM, example 120 beats per minute
        60.0/(beat) => float SPB; // seconds per beat
        SPB :: second => pulse;
	}
}

