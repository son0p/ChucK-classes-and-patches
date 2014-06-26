// -------Score------------------

BPM tempo;
96.0 => float metronome;
tempo.tempo( metronome );
tempo.pulse => dur beat;

0 => int count;

while( true )
{
	count % 4 => int patt;
	if( patt == 0 )
	{
		Machine.add( me.dir() + "/drums.ck" ) => int drumID;
		4 * beat => now;
		Machine.remove(drumID);
	}
	<<< patt >>>;
	count++;
}





<<< "NOW:", now/second >>>;