// Score.ck

// define timings
BPM tempo;
88.0 => float beat;
tempo.tempo(beat);

Machine.add(me.dir() + "/drums.ck") => int drumID;
Machine.add(me.dir() + "/bass.ck") => int bassID;
Machine.add(me.dir() + "/piano.ck") => int pianoID;
// Machine.add(me.dir() + "/testCode.ck") => int pianoID;

16*tempo.wholeNote => now;

Machine.remove(drumID);
Machine.remove(bassID);
Machine.remove(pianoID);

<<< "NOW:", now/second >>>;
