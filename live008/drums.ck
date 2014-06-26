// importa clase
BPM tempo;
tempo.pulse => dur beat;

// cadena de sonido
SndBuf kk => dac;
SndBuf sn => dac;
SndBuf hh => dac;

me.dir() + "/audio/kick_01.wav" => kk.read; 
me.dir() + "/audio/hihat_01.wav" => hh.read;
me.dir() + "/audio/snare_01.wav" => sn.read;

0.1 => hh.gain;

// ultimo sample para evitar sonido
kk.samples() => kk.pos;
sn.samples() => sn.pos;
hh.samples() => hh.pos;

fun void kick()
{
	while(true)
	{
		1.5 * beat => now;
		0 => kk.pos;
		2 * beat => now;
		0 => kk.pos;
		0.5 * beat => now;
	}
 }
 
fun void snare()
{
	while(true)
	{
		0.5 * beat => now;
		0 => sn.pos;
		2 * beat => now;
		0 => sn.pos;
		1.5 * beat => now;
	}
}

fun void hihat()
{
	while(true)
	{
		0 => hh.pos;
		0.5 * beat => now;
	}
}

spork ~ kick();
spork ~ snare(); 
spork ~ hihat();

while(true)
{
	1::second => now;
}