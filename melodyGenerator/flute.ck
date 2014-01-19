

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
    .5 => piano[i].gain;
}
.05 => r.mix;
.1 => tri.gain;

// define timings
BPM tempo;
MelodyGenerator m;


while(true){
	m.generateMelody(52,6) @=> int melody[];
	for(0 => int i; i < melody.cap(); i++)
		{
			// Piano 
			Math.random2(0,3) => int selPiano;
			Std.mtof(melody[i]) => piano[selPiano].freq;
			Math.random2f(0.5, 0.9) => piano[selPiano].noteOn;
			// TriOsc
			Std.mtof(melody[i])*2 => tri.freq;
			Math.sin( now/(100*tempo.quarterNote)*4*pi ) => p.pan;
			Math.sin( now/(0.1*(100*tempo.wholeNote)*4*pi )/4) => tri.gain;
			// call duration from class
			e.keyOn;
			m.generateDuration() => int duration;
			e.keyOff;
			tempo.wholeNote/duration => now;
		

		
		}	
		

}


