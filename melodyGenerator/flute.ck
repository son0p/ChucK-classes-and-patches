// sound chain
Mandolin piano[4];
piano[0] =>  dac.left;
piano[1] => NRev r => dac;
piano[2] => dac;
piano[3] => dac.right;
TriOsc tri => Envelope e => NRev r2 => Pan2 p => dac;

//initialize gains
for( 0 => int i; i < 4; i++ )
{
    0.5 => piano[i].gain;
}
0.05 => r.mix;
0.1 => tri.gain;

// define timings
BPM tempo;
MelodyGenerator m;
0 => int counter;

// initailize first motive
m.generateMelody(52,6) @=> int melody[];
m.generateMotive(melody) @=> int motive[];
m.generateDuration() => int duration;


while(true)
{
counter % 4 => int change;
	// change motive each 4 rounds
	if(change == 0){
		m.generateMelody(52,2) @=> int melody[];
		m.generateMotive(melody) @=> int motive[];
		m.generateDuration() => int duration;
		}
	for(0 => int ii; ii < motive.cap(); ii++)
	{
		if(motive[ii] > 1){
			Math.random2(0,3) => int selPiano;
			Std.mtof(motive[ii]) => piano[selPiano].freq;
			Math.random2f(0.5, 0.9) => piano[selPiano].noteOn;
			Std.mtof(motive[ii])*2 => tri.freq;
			0.5 => tri.gain;
			e.keyOn;
			e.keyOff;
			tempo.wholeNote/duration => now;
		}
		else
		{
			e.keyOff;	
		}
	}
counter++;
}	




