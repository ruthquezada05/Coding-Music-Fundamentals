//sound netowrk 
SinOsc s => dac; 
TriOsc t => dac; 

// only play s 
0.5 => s.gain; 
0 => t.gain; 

for( 200 => int i; i < 300; i++ ) 
{ 
    i => s.freq;
    .05::second => now; 
} 

// only play t 
0.2 => t.gain; 
0 => s.gain; 
for ( 300 => int i; i < 400; i++) 
{
    i => t.freq;
    .05::second => now; 
} 

// play s and t at the same time 
0.5 => s.gain; 
0.2 => t.gain; 
for ( 400 => int i; i < 500; i++)
{
    i => t.freq; 
    i*2 => s.freq; 
    .05::second => now; 
}