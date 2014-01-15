// drums.ck

// Assignment Final :: slow zzaj :: 

// sound chain
Gain master => dac;
SndBuf kick => master;
SndBuf snare => master;
SndBuf hihat => NRev rev => dac;
Noise brushes => ADSR e => Pan2 p => dac;

// me.dir(-1) read audio file

me.dir(-1) + "/audio/kick_01.wav" => kick.read; 
me.dir(-1) + "/audio/hihat_01.wav" => hihat.read;
me.dir(-1) + "/audio/snare_01.wav" => snare.read;

// set all playheads to end so no sound is made
kick.samples() => kick.pos;
hihat.samples() => hihat.pos;
snare.samples() => snare.pos;


// define timings
BPM tempo;

[0,0,0,0, 0,0,1,0, 0,0,0,0, 0,0,1,0] @=> int kickSeq[];
[0,0,1,0, 0,0,0,0, 0,0,1,0, 0,0,0,0] @=> int snareSeq[];
[1,0,0,1, 1,0,0,1, 1,0,0,1, 1,0,1,1] @=> int hihatSeq[];

// initialize
.05 => brushes.gain;
.1 => hihat.gain;
e.set( tempo.eighthNote, tempo.sixteenthNote, .3, tempo.sixteenthNote );
0.2 => rev.mix;
  // loop

 while(true)
{
for(0 => int i; i < kickSeq.cap(); i++)
	{
		if (kickSeq[i] == 1)
		{
			0 => kick.pos;
		}
		
		if (snareSeq[i] == 1)
		{
			0 => snare.pos;
		}
		
		if (hihatSeq[i] == 1)
		{
			0 => hihat.pos;
		}
		tempo.sixteenthNote => now;
	}
}
fun void hh()
{
 
}

fun void brush()
{
  while( true )
    {
      e.keyOn();
      Math.sin( now/(100*tempo.quarterNote)*4*pi ) => p.pan; // modulate pan 
      tempo.quarterNote => now;
      e.keyOff();
    }
  
}

spork ~ hh();
spork ~ brush();
while( true ) 1::second => now;
