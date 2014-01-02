// drums.ck

// Assignment Final :: slow zzaj :: 

// sound chain
SndBuf hihat => NRev rev => dac;
Noise brushes => ADSR e => Pan2 p => dac;

// me.dir(-1) read audio file
me.dir(-1) + "/audio/hihat_03.wav" => hihat.read;

// define timings
BPM tempo;


// initialize
.09 => brushes.gain;
e.set( tempo.eighthNote, tempo.sixteenthNote, .3, tempo.sixteenthNote );
0.2 => rev.mix;
  // loop
fun void hh()
{
  while(true)
    {
    0.5 => hihat.gain;
    Math.random2f(.9,1) => hihat.rate; 
    0 => hihat.pos;
    tempo.quarterNote => now;
    
    0 => hihat.pos;
    tempo.tripletNote => now;
    hihat.samples() => hihat.pos;      
    tempo.tripletNote => now;
    0.2 => hihat.gain;
    Math.random2f(.9,1) => hihat.rate; 
    0 => hihat.pos;
    tempo.tripletNote => now;
    0.5 => hihat.gain;
    Math.random2f(.9,1) => hihat.rate; 
    0 => hihat.pos;
    tempo.quarterNote => now;
    
    0 => hihat.pos;
    tempo.tripletNote => now; 
    hihat.samples() => hihat.pos;      
    tempo.tripletNote => now; 
    0.2 => hihat.gain;
    Math.random2f(.9,1) => hihat.rate; 
    0 => hihat.pos;
    tempo.tripletNote => now; 

    }
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
