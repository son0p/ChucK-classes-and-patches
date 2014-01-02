// bass.ck

// Assignment Final :: slow zzaj :: 

// sound chain
Mandolin bass => NRev r => dac;
SinOsc sub => ADSR e =>  dac;

// call BPM class
BPM tempo;



// scale data
Mode mode;
mode.generateMode(60,1) @=> int scale[];
 <<<"Bass root: ",  scale[0]>>>;

// param setup
.4 => bass.gain;
0.1 => r.mix;
0.0 => bass.stringDamping;
0.02 => bass.stringDetune;
0.05 => bass.bodySize;
4 => int walkPos;
.6 => sub.gain;
e.set( tempo.sixteenthNote, tempo.sixteenthNote, .6, 5*tempo.sixteenthNote );

while(true)
{
  Std.mtof( scale[0] - 24) => bass.freq;
  Std.mtof( scale[0] - 24) => sub.freq;
  Math.random2f(0.05,0.5) => bass.pluckPos;
  1 => bass.noteOn;
  e.keyOn();
  tempo.eighthNote => now;
  1 => bass.noteOff;
  e.keyOff();
  tempo.eighthNote => now;
 
}
