// bass.ck

// sound chain
Mandolin bass => NRev r => LPF lf=> dac;
SinOsc sub => ADSR e =>  dac;

// call  classes
BPM tempo;
Mode mode;
MelodyGenerator m;
// scale data

<<< "ROOT:",m.root>>>;
 mode.generateMode(52,6) @=> int scale[];
// m.generateMelody(m.root, m.mode) @=> int scale[];
 <<<"Bass root: ",  scale[0]>>>;

// param setup
.4 => bass.gain;
0.02 => r.mix;
0.0 => bass.stringDamping;
0.02 => bass.stringDetune;
0.05 => bass.bodySize;
4 => int walkPos;
.6 => sub.gain;
e.set( tempo.sixteenthNote, tempo.sixteenthNote, .6, 5*tempo.sixteenthNote );

while( true)
{

	
	[0,0,1,1] @=> int phraseBass[];
	[0,2,4] @=> int triadaBass[];
	[6,3,5] @=> int triadaBass2[];
	[0.5, 0.25, 0.25] @=> float patternBass[];

	for(0 => int ii; ii < phraseBass.cap(); ii++)
	{
		if (phraseBass[ii] == 0)
		{	
			for(0 => int i; i < triadaBass.cap(); i++)
			{
				Std.mtof(scale[triadaBass[i]] - 12) => float freq;
				freq => bass.freq, freq => sub.freq;
				Math.random2f(0.05,0.5) => bass.pluckPos;
				Math.random2(80, 400) => lf.freq;
				1 => bass.noteOn, e.keyOn();
				(tempo.quarterNote)*patternBass[i] => now;
				1 => bass.noteOff,	e.keyOff();
				(tempo.quarterNote)*patternBass[i] => now;
			}
		}
		if (phraseBass[ii] == 1)
		{
			for(0 => int i; i < triadaBass.cap(); i++)
			{
				// Terrible way to solve different octaves
				if(triadaBass2[i] == 1)
				{
					Std.mtof(scale[triadaBass2[i]] - 12) => float freq;
					freq => bass.freq, freq => sub.freq;
					Math.random2f(0.05,0.5) => bass.pluckPos;
					Math.random2(80, 400) => lf.freq;
					1 => bass.noteOn, e.keyOn();
					(tempo.quarterNote)*patternBass[i] => now;
					1 => bass.noteOff,	e.keyOff();
					(tempo.quarterNote)*patternBass[i] => now;
				}
				else
				{
					Std.mtof(scale[triadaBass2[i]] - 24) => float freq;
					freq => bass.freq, freq => sub.freq;
					Math.random2f(0.05,0.5) => bass.pluckPos;
					Math.random2(80, 400) => lf.freq;
					1 => bass.noteOn, e.keyOn();
					(tempo.quarterNote)*patternBass[i] => now;
					1 => bass.noteOff,	e.keyOff();
					(tempo.quarterNote)*patternBass[i] => now;
				}
			}
		}
	}
}
