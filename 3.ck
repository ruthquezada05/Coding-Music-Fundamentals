// sequencer 

// sound chain 
Gain master => dac;
SndBuf kick => master; 
SndBuf hihat => master; 
SndBuf clap => master; 

.6 => master.gain;

// load soundfiles into sndbuf 

me.dir() + "audio/kick_01.wav" => kick.read;
me.dir() + "audio/hihat_01.wav" => hihat.read; 
me.dir() + "audio/clap_01.wav" => clap.read;

// set all playheads to end so no sound is made
kick.samples() => kick.pos;
hihat.samples() => hihat.pos; 
clap.samples() => clap.pos;

// initialize a counter variable 

0 => int counter; 

// infinite loop 
while ( true )
{ 
    // 8 positions 
    counter % 8 => int beat;
    
    // bass drum on 0 and 4
    if ( ( beat == 0 ) || ( beat == 3) )
    {
        0 => kick.pos;
    }
    
    // hihat on 2 and 6
    if ( ( beat == 2) || ( beat == 6) )
    {
        0 => hihat.pos; 
        Math.random2f(.6,1.4) => hihat.rate;
    }
    
    0 => clap.pos;
    Math.random2f(.2,1.8) => clap.rate;
    
    <<< "Counter: ", counter, "Beat: ", beat >>>; 
    counter++; // counter + 1 => counter
    200::ms => now;
}
