// Score.ck

// define timings
BPM tempo;
120.0 => float beat; // cumbia 96
tempo.tempo(beat);

Machine.add(me.dir() + "/drums.ck") => int drumID;
Machine.add(me.dir() + "/bass.ck") => int bassID;
// Machine.add(me.dir() + "/piano.ck") => int pianoID;
Machine.add(me.dir() + "/flute.ck") => int fluteID;
// Machine.add(me.dir() + "/testCode.ck") => int pianoID;

64*tempo.wholeNote => now;

Machine.remove(drumID);
Machine.remove(bassID);
// Machine.remove(pianoID);
Machine.remove(fluteID);
<<< "NOW:", now/second >>>;
