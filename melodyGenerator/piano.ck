// piano.ck

// sound chain
Rhodey piano[4];
piano[0] => dac.left;
piano[1] => dac;
piano[2] => dac;
piano[3] => dac.right;

//initialize gains
for( 0 => int i; i < 4; i++ )
{
    .3 => piano[i].gain;
}

// define timings
BPM tempo;
MelodyGenerator melody;

while(true)
{
	for(0 => int ii; ii < 7; ii++)
	{
		melody.generateMelody(60, ii+1) @=> int melody[];
				
		for(0 => int i; i < melody.cap(); i++)
		{
			Std.mtof(melody[i]) => piano[1].freq;
			0.5 => piano[1].noteOn;
			tempo.quarterNote => now;
			<<< melody[i] >>>;
		}
	}
}




