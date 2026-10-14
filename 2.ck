//sound chain 
SqrOsc s => dac; 

//array declaration
[55, 58, 62, 66, 70, 70, 66, 62, 58, 55] @=> int A []; 
[.5, .5, .25, .5, .5, .25, .5, .5, .5, .5] @=> float notes[];


<<< A.cap() >>>; 

// loop 
for ( 0 => int i; i < A.cap(); i++) 
{
    <<< i, A[i] >>>; 
Std.mtof(A[i]) => s.freq; 
notes[i]::second => now; 
} 
