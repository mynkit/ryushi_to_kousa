// 栁川さん: 04

~leavesOfTreesEndless = Synth("leavesOfTreesEndless", [\amp, 0, \out, 0]);
~leavesOfTreesEndless.set(\amp, 0.0, \out, 14);
~leavesOfTreesEndless.free;

(
var n = 0;
~superhammondSc1 = Synth(\superhammondSc, [\amp, 0.0, \freq, ~nToF.("b3", 440)*(2**(n/12)), \vibrato, 1.0, \vrate, 32, \lpf, 300, \reverb, 1, \pan, 0, \out, 10]);
~superhammondSc2 = Synth(\superhammondSc, [\amp, 0.0, \freq, ~nToF.("fs4", 440)*(2**(n/12)), \vibrato, 1.0, \vrate, 32, \lpf, 300, \reverb, 1, \pan, -0.5, \out, 10]);
~superhammondSc3 = Synth(\superhammondSc, [\amp, 0.0, \freq, ~nToF.("e5", 440)*(2**(n/12)), \vibrato, 1.0, \vrate, 32, \lpf, 300, \reverb, 1, \pan, 0.5, \out, 10]);
~superhammondSc4 = Synth(\superhammondSc, [\amp, 0.0, \freq, ~nToF.("a5", 440)*(2**(n/12)), \vibrato, 1.0, \vrate, 32, \lpf, 300, \reverb, 1, \pan, 0, \out, 10]);
)

(
var vol = 0.0, n = 0, lpf=800, reverb=0.2;
~superhammondSc1.set(\amp, 0.6*vol, \freq, ~nToF.("b3", 440)*(2**(n/12)), \reverb, reverb, \vibrato, 1, \vrate, 0.21, \lpf, lpf, \hpf, 100,\tremolorate, 6, \tremolodepth, 0.19, \pan, 0.2);
~superhammondSc2.set(\amp, 0.5*vol, \freq, ~nToF.("fs4", 440)*(2**(n/12)), \reverb, reverb, \vibrato, 1, \vrate, 0.274, \lpf, lpf, \hpf, 100, \tremolorate, 4.7, \tremolodepth, 0.15, \pan, -1);
~superhammondSc3.set(\amp, 0.5*vol, \freq, ~nToF.("e5", 440)*(2**(n/12)), \reverb, reverb, \vibrato, 1, \vrate, 0.154, \lpf, lpf, \hpf, 100, \tremolorate, 0.25, \tremolodepth, 0.5, \pan, 1);
~superhammondSc4.set(\amp, 0.3*vol, \freq, ~nToF.("a5", 440)*(2**(n/12)), \reverb, reverb, \vibrato, 1, \vrate, 0.08, \lpf, lpf, \hpf, 100, \tremolorate, 0.4, \tremolodepth, 0.7, \pan, -0.2);
)

(
~superhammondSc1.free;
~superhammondSc2.free;
~superhammondSc3.free;
~superhammondSc4.free;
)

~pinknoise = Synth("pinknoise", [\amp, 0, \hpf, 100, \lpf, 1000, \out, 14]);
~pinknoise.set(\amp, 0.0, \hpf, 775, \lpf, 3500);

~pinknoise.free


// 田中さとみさん: 01

~kaionSine1 = Synth(\sine, [\amp, 0])

~kaionSine1.set(\amp, 0.5,\freq, ~nToF.("e2", 440), \reverb, 0.9, \pan2Freq, 0.0, \parFreq, 0*3, \ice, 0.3, \vibratoDepth, 1, \vibratoFreq, 10)


~kaionSine2 = Synth(\sine, [\amp, 0])

~kaionSine2.set(\amp, 0.5,\freq, ~nToF.("b3", 440), \reverb, 0.9, \pan2Freq, 0.0, \parFreq, 0*0, \ice, 0.0, \vibratoDepth, 0.4, \vibratoFreq, 4)

~kaionSine2.set(\amp, 0.5,\freq, ~nToF.("b3", 440), \reverb, 0.9, \pan2Freq, 1.5, \parFreq, 0*3, \ice, 0.4, \vibratoDepth, 0.4, \vibratoFreq, 4)


~sine2 = Synth("sine", [\freq, ~nToF.("a3", 440), \amp, 0, \parFreq, 0, \pan2Freq, 0.04, \vibratoDepth, 0.8, \vibratoFreq, 20, \actave, 1, \reverb, 0.2, \out, 6]);
~sine2.set(\amp, 0.6);
~sine2.set(\reverb, 0.6);
~sine2.set(\ice, 0.0);
~sine2.set(\freq, ~nToF.("a3", 440));
~sine2.set(\parFreq, 0.23);
~sine2.set(\vibratoDepth, 0.8);
~sine2.set(\vibratoFreq, 20);

(
~sine2.free;
)


(
~kaionZure1 = Synth(\zureSc, [\amp, 0, \freq, 329.628*0.25, \hpf, 100, \lpf, 300, \detune, 1]);
~kaionZure2 = Synth(\zureSc, [\amp, 0, \freq, 261.626*0.5, \hpf, 100, \lpf, 300, \detune, 0.1]);
~kaionZure3 = Synth(\zureSc, [\amp, 0, \freq, 493.883*1, \hpf, 100, \lpf, 300, \detune, 0.03]);
)

(
var vol = 0.6;
~kaionZure1.set(\amp, 0.9*vol,  \freq, 329.628*(2**(0-12/12)), \detune, 0.05);
~kaionZure2.set(\amp, 0.9*vol, \freq, 261.626*(2**(0-12/12)), \detune, 0.09);
~kaionZure3.set(\amp, 0.9*vol, \freq, 493.883*(2**(-12/12)), \detune, 0.1);
)
(
~kaionZure1.free;
~kaionZure2.free;
~kaionZure3.free;
)


// 「春本を捲る、テロリストの」〜

~kaionSaw = Synth(\saw, [\amp, 0])
~kaionSaw.set(\amp, 0,\freq, 164*0.25,\bpf, 164*0.5, \reverb, 0.9, \pan2Freq, 103*2.0, \parFreq, 110*2.0, \ice, 0.0, \vibratoDepth, 1, \vibratoFreq, 10)
~kaionSaw.free;



// 田中さとみさん: 03

~sine1= Synth("sine", [\freq, ~nToF.("b3", 440), \amp, 0, \parFreq, 0, \pan2Freq, 0, \vibratoDepth, 0.3, \vibratoFreq, 0.1, \actave, 1, \reverb, 0.5, \out, 6]);
~sine1.set(\amp, 0.6);
~sine1.set(\freq, ~nToF.("b3", 440));
~sine1.set(\reverb, 0.5);
~sine1.set(\ice, 0.0);
~sine1.set(\parFreq, 0.05);
~sine1.set(\pan2Freq, 0);
~sine1.set(\vibratoDepth, 0.6);
~sine1.set(\vibratoFreq, 15);


(
~sine1.free;
)



// =================================================


// intro

Ndef(\fire).play(vol: 0, numChannels: ~numChannels, fadeTime: 1);
Ndef(\fire).stop;
Ndef(\fire).clear;

(
Ndef(\fire,{|amp = 2.0, freq = 0.25, numharm=90, lpf = 700, hpf = 200|
	j=DelayL.ar(n=Ndef(\fire);n.ar,2,LFNoise0.kr(3.5*_!4)+1)+HPF.ar(LPF.ar(Blip.ar(freq, numharm),lpf), hpf);
	amp*LeakDC.ar(j+j.mean*0.15).sin
});
)

Ndef(\fire).set(\amp, 2.0, \freq, 0.25, \numharm, 90, \lpf, 700, \hpf, 200);
Ndef(\fire).set(\amp, 0);


(
~zureSc2_4 = Synth(\zureSc2, [\amp, 0, \freq, 329.628*(2**((9+12)/12)), \hpf, 100, \lpf, 400, \detune, 1, \out, 8]);
~zureSc2_5 = Synth(\zureSc2, [\amp, 0, \freq, 329.628*(2**((9+12)/12)), \hpf, 100, \lpf, 400, \detune, 1, \out, 8]);
~zureSc2_6 = Synth(\zureSc2, [\amp, 0, \freq, 329.628*(2**((9+12)/12)), \hpf, 100, \lpf, 400, \detune, 1, \out, 8]);
)

(
var vol1 = 0.0;
~zureSc2_4.set(\amp, 2.0*vol1, \freq, ~nToF.("cs3", 440), \detune, 1.107, \lpf, 500, \reverb, 3.0);
~zureSc2_5.set(\amp, 2.0*vol1, \freq, ~nToF.("b3", 440), \detune, 2.512, \lpf, 700, \reverb, 3.0);
~zureSc2_6.set(\amp, 2.0*vol1, \freq, ~nToF.("gs4", 440), \detune, 0.218, \lpf, 500, \reverb, 3.0);
)

(
~zureSc2_4.free;
~zureSc2_5.free;
~zureSc2_6.free;
)

(
~saw1 = Synth(\saw, [\amp, 0]);
~saw2 = Synth(\saw, [\amp, 0]);
~saw3 = Synth(\saw, [\amp, 0]);
)

(
var vol = 0.0;
~saw1.set(\amp, 1.0*vol, \pan2Freq, 0, \parFreq, 300, \freq, 35*1, \vibratoDepth, 0.1, \vibratoFreq, 2, \reverb, 1, \ice, 1, \bpf, 35*2*2.5);
~saw2.set(\amp, 1.0*vol, \pan2Freq, 0, \parFreq, 110, \freq, 35*1.75, \vibratoDepth, 0.1, \vibratoFreq, 21, \reverb, 1, \ice, 1, \bpf, 35*1.75*1);
~saw3.set(\amp, 1.0*vol, \pan2Freq, 0, \parFreq, 10, \freq, 35*1.5, \vibratoDepth, 0.7, \vibratoFreq, 21, \reverb, 1, \ice, 1, \bpf, 35*1.5*1);
)

(
~saw1.free;
~saw2.free;
~saw3.free;
)




// cs: 277.183
// d: 293.665
// e: 329.628
// a: 440.000
// b: 493.883
~drone1 = Synth(\drone, [\freq, ~nToF.("a2", 440), \amp, 0.0, \numHarm, 5, \reverb, 0.9, \lpf, 2000, \out, 4]);
~drone1.set(\amp, 0.06);
~drone1.set(\freq, ~nToF.("fs2", 440));
~drone1.set(\parFreq, 1.5);
~drone1.set(\pan2Freq, 0.1);
~drone1.set(\numHarm, 4);
~drone1.set(\lpf, 2000);
~drone1.set(\reverb, 0.9);
~drone1.set(\vibratoFreq, 3, \vibratoDepth, 0.05);

// cs: 277.183
// d: 293.665
// e: 329.628
// a: 440.000
// b: 493.883
~drone2 = Synth(\drone, [\freq, ~nToF.("cs3", 440), \amp, 0.0, \numHarm, 5, \reverb, 0.8, \lpf, 2000, \out, 4]);
~drone2.set(\amp, 0.0);
~drone2.set(\freq, ~nToF.("cs3", 440));
~drone2.set(\parFreq, 0.2);
~drone2.set(\pan2Freq, 0.1);
~drone2.set(\numHarm, 6);
~drone2.set(\lpf, 3000);
~drone2.set(\reverb, 0.9);
~drone2.set(\vibratoFreq, 1, \vibratoDepth, 0.1);

// cs: 277.183
// d: 293.665
// e: 329.628
// a: 440.000
// b: 493.883
~drone3 = Synth(\drone, [\freq, ~nToF.("b2", 440), \amp, 0.0, \numHarm, 3, \reverb, 0.8, \lpf, 2000, \out, 4]);
~drone3.set(\amp, 0.0);
~drone3.set(\freq, ~nToF.("b2", 440));
~drone3.set(\parFreq, 1);
~drone3.set(\pan2Freq, 0.1);
~drone3.set(\numHarm, 3);
~drone3.set(\lpf, 1500);
~drone3.set(\reverb, 0.9);
~drone3.set(\vibratoFreq, 1.3, \vibratoDepth, 0.1);


~drone4 = Synth(\drone, [\freq, ~nToF.("e3", 440), \amp, 0.0, \numHarm, 3, \reverb, 0.8, \lpf, 2000]);
~drone4.set(\amp, 0.3);
~drone4.set(\freq, ~nToF.("e2", 440));
~drone4.set(\parFreq, 0.1);
~drone4.set(\pan2Freq, 0.5);
~drone4.set(\numHarm, 8);
~drone4.set(\lpf, 2000);
~drone4.set(\reverb, 0.9);
~drone4.set(\vibratoFreq, 1.3, \vibratoDepth, 0.1);

(
~drone1.free;
~drone2.free;
~drone3.free;
~drone4.free;
)

// kaion

~kaionSine1 = Synth(\sine, [\amp, 0])

~kaionSine1.set(\amp, 0.0,\freq, 329.628*0.25, \reverb, 0.9, \pan2Freq, 0.0, \parFreq, 0*3, \ice, 0.3, \vibratoDepth, 1, \vibratoFreq, 10)


~kaionSine2 = Synth(\sine, [\amp, 0])

~kaionSine2.set(\amp, 0.0,\freq, 493.883*0.5, \reverb, 0.9, \pan2Freq, 0.0, \parFreq, 0*0, \ice, 0.0, \vibratoDepth, 0.4, \vibratoFreq, 4)

~kaionSine2.set(\amp, 0.0,\freq, 329.628*0.75, \reverb, 0.9, \pan2Freq, 1.5, \parFreq, 0*3, \ice, 0.4, \vibratoDepth, 0.4, \vibratoFreq, 4)


(
~kaionZure1 = Synth(\zureSc, [\amp, 0, \freq, 329.628*0.25, \hpf, 100, \lpf, 300, \detune, 1]);
~kaionZure2 = Synth(\zureSc, [\amp, 0, \freq, 261.626*0.5, \hpf, 100, \lpf, 300, \detune, 0.1]);
~kaionZure3 = Synth(\zureSc, [\amp, 0, \freq, 493.883*1, \hpf, 100, \lpf, 300, \detune, 0.03]);
)

(
~kaionZure1.set(\amp, 0.0,  \freq, 329.628*(2**(0-12/12)), \detune, 0.05);
~kaionZure2.set(\amp, 0.0, \freq, 261.626*(2**(0-12/12)), \detune, 0.09);
~kaionZure3.set(\amp, 0.0, \freq, 493.883*(2**(-12/12)), \detune, 0.1);
)
(
~kaionZure1.free;
~kaionZure2.free;
~kaionZure3.free;
)

~kaionSaw = Synth(\saw, [\amp, 0])
~kaionSaw.set(\amp, 0,\freq, 164*0.25,\bpf, 164*0.5, \reverb, 0.9, \pan2Freq, 103*2.0, \parFreq, 110*2.0, \ice, 0.0, \vibratoDepth, 1, \vibratoFreq, 10)
~kaionSaw.free;

// Part: Kasanari
// 最後に低音

~noiseHarmony = Synth(\noiseHarmony, [\amp, 0, \freq1, 99, \freq2, 144, \freq3, 183, \freq4, 260, \freq5, 335, \gain1, 40, \gain2, 40,\gain3, 30, \gain4, 3, \gain5, 3, \out, 12]);

~noiseHarmony.set(\amp, 0.0);

~noiseHarmony.set(\freq1, 99, \freq2, 144, \freq3, 183, \freq4, 260, \freq5, 335, \gain1, 40, \gain2, 40,\gain3, 30, \gain4, 3, \gain5, 0);

// ~noiseHarmony.set(\freq1, 99, \freq2, 144, \freq3, 183, \freq4, 260, \freq5, 1485, \gain1, 40, \gain2, 40,\gain3, 30, \gain4, 3, \gain5, 0);


// cs: 277.183
// d: 293.665
// e: 329.628
// a: 440.000
// b: 493.883
~drone1 = Synth(\drone, [\freq, ~nToF.("a2", 440), \amp, 0.0, \numHarm, 5, \reverb, 0.9, \lpf, 2000, \out, 4]);
~drone1.set(\amp, 0.0);
~drone1.set(\freq, ~nToF.("a2", 440));
~drone1.set(\parFreq, 0.5);
~drone1.set(\pan2Freq, 0.1);
~drone1.set(\numHarm, 5);
~drone1.set(\lpf, 2000);
~drone1.set(\reverb, 0.9);
~drone1.set(\vibratoFreq, 3, \vibratoDepth, 0.05);

// cs: 277.183
// d: 293.665
// e: 329.628
// a: 440.000
// b: 493.883
~drone2 = Synth(\drone, [\freq, ~nToF.("cs3", 440), \amp, 0.0, \numHarm, 5, \reverb, 0.8, \lpf, 2000, \out, 4]);
~drone2.set(\amp, 0.0);
~drone2.set(\freq, ~nToF.("cs3", 440));
~drone2.set(\parFreq, 0.2);
~drone2.set(\pan2Freq, 0.1);
~drone2.set(\numHarm, 4);
~drone2.set(\lpf, 3000);
~drone2.set(\reverb, 0.9);
~drone2.set(\vibratoFreq, 1, \vibratoDepth, 0.1);

// cs: 277.183
// d: 293.665
// e: 329.628
// a: 440.000
// b: 493.883
~drone3 = Synth(\drone, [\freq, ~nToF.("b2", 440), \amp, 0.0, \numHarm, 3, \reverb, 0.8, \lpf, 2000, \out, 4]);
~drone3.set(\amp, 0.0);
~drone3.set(\freq, ~nToF.("b2", 440));
~drone3.set(\parFreq, 1);
~drone3.set(\pan2Freq, 0.1);
~drone3.set(\numHarm, 3);
~drone3.set(\lpf, 1500);
~drone3.set(\reverb, 0.9);
~drone3.set(\vibratoFreq, 1.3, \vibratoDepth, 0.1);


~drone4 = Synth(\drone, [\freq, ~nToF.("e3", 440), \amp, 0.0, \numHarm, 3, \reverb, 0.8, \lpf, 2000]);
~drone4.set(\amp, 0.0);
~drone4.set(\freq, ~nToF.("e2", 440));
~drone4.set(\parFreq, 0.1);
~drone4.set(\pan2Freq, 0.5);
~drone4.set(\numHarm, 5);
~drone4.set(\lpf, 2000);
~drone4.set(\reverb, 0.9);
~drone4.set(\vibratoFreq, 1.3, \vibratoDepth, 0.1);

(
~drone1.free;
~drone2.free;
~drone3.free;
~drone4.free;
)

// Part: low_noise

~vibNoise1 = Synth(\vibNoise, [\amp, 0, \freq, 98, \rq, 0.03, \tremRate, 92, \tremDepth, 0.9, \out, 14]);
~vibNoise1.set(\amp, 0.0, \freq, 98, \rq, 0.03, \tremRate, 92, \tremDepth, 0.9);

~vibNoise2 = Synth(\vibNoise, [\amp, 0, \freq, 98, \rq, 0.06, \tremRate, 57, \tremDepth, 0.9, \out, 14]);
~vibNoise2.set(\amp, 0.0, \freq, 98, \rq, 0.06, \tremRate, 57, \tremDepth, 0.9);

~vibNoise3 = Synth(\vibNoise, [\amp, 0, \freq, 329.628, \rq, 0.06, \tremRate, 57, \tremDepth, 0.0, \out, 14]);
~vibNoise3.set(\amp, 0.0, \freq, (329.628+0)*4, \rq, 0.005, \tremRate, 25, \tremDepth, 0.4);


(
~vibNoise1.free;
~vibNoise2.free;
~vibNoise12.free;
)

~blipHarmonics1 = Synth(\blipHarmonics, [\amp, 0.0, \freq, 55*(2**(-7/12)), \f1, 617*(2**(-7/12)), \f2, 920*(2**(-7/12)), \f3, 2000*(2**(-7/12)), \lpf, 100, \numHarm, 20, \reverb, 0.1, \vibratoFreq, 0.8, \vibratoDepth, 0.6, \out, 4]);
~blipHarmonics1.set(\numHarm, 20, \lpf, 300);
~blipHarmonics1.set(\reverb, 0.4);
~blipHarmonics1.set(\vibratoFreq, 0.8, \vibratoDepth, 0.6);
(
var n = -7;
~blipHarmonics1.set(\amp, 0.0, \freq, 1*55*(2**(n/12)), \f1, 617*(2**(n/12)), \f2, 920*(2**(n/12)), \f3, 2000*(2**(n/12)), \lpf, 110);
)
~blipHarmonics1.free;

(
~blipHarmonics1.free;
)

~forest1 = Synth("forest", [\amp, 0, \out, 14]);
~forest1.set(\amp, 0.3, \lpf, 3000, \hpf, 1500);
~forest1.set(\amp, 0.3, \lpf, 500, \hpf, 100);
~forest1.free;

~forest2 = Synth("forest", [\amp, 0, \lpf, 500, \hpf, 100, \out, 14]);
~forest2.set(\amp, 0.3, \lpf, 500, \hpf, 100);
~forest2.free;

(
~forest1.free;
~forest2.free;
)




// Part: hollow

(
var n = 0;
~superhammondSc1 = Synth(\superhammondSc, [\amp, 0.0, \freq, 329.628*0.5*(2**(0+n/12)), \vibrato, 1.0, \vrate, 32, \lpf, 300, \reverb, 1, \pan, 0, \out, 10]);
~superhammondSc2 = Synth(\superhammondSc, [\amp, 0.0, \freq, 329.628*0.5*(2**(2+n/12)), \vibrato, 1.0, \vrate, 32, \lpf, 300, \reverb, 1, \pan, -0.5, \out, 10]);
~superhammondSc3 = Synth(\superhammondSc, [\amp, 0.0, \freq, 329.628*0.5*(2**(9+n/12)), \vibrato, 1.0, \vrate, 32, \lpf, 300, \reverb, 1, \pan, 0.5, \out, 10]);
~superhammondSc4 = Synth(\superhammondSc, [\amp, 0.0, \freq, 329.628*0.5*(2**(0-12+n/12)), \vibrato, 1.0, \vrate, 32, \lpf, 300, \reverb, 1, \pan, 0, \out, 10]);
)

(
var vol = 0.0, n = 0, lpf=200, reverb=0;
~superhammondSc1.set(\amp, 0.6*vol, \freq, 329.628*0.5*(2**((4+n)/12)), \reverb, reverb, \vibrato, 1, \vrate, 0.21, \lpf, lpf, \hpf, 100,\tremolorate, 6, \tremolodepth, 0.19, \pan, 0.2);
~superhammondSc2.set(\amp, 0.5*vol, \freq, 329.628*0.5*(2**((7+n)/12)), \reverb, reverb, \vibrato, 1, \vrate, 0.274, \lpf, lpf, \hpf, 100, \tremolorate, 4.7, \tremolodepth, 0.15, \pan, -1);
~superhammondSc3.set(\amp, 0.5*vol, \freq, 329.628*0.5*(2**((-3+n)/12)), \reverb, reverb, \vibrato, 1, \vrate, 0.154, \lpf, lpf, \hpf, 100, \tremolorate, 0.25, \tremolodepth, 0.5, \pan, 1);
~superhammondSc4.set(\amp, 0.3*vol, \freq, 329.628*0.5*(2**((2-12+n)/12)), \reverb, reverb, \vibrato, 1, \vrate, 0.08, \lpf, lpf, \hpf, 100, \tremolorate, 0.4, \tremolodepth, 0.7, \pan, -0.2);
)

(
~superhammondSc1.free;
~superhammondSc2.free;
~superhammondSc3.free;
~superhammondSc4.free;
)

(
var out = 8;
~zureSc2_1 = Synth(\zureSc2, [\amp, 0, \freq, 3329.628*(2**((-3+24)/12)), \hpf, 50, \lpf, 400, \detune, 0, \out, out]);
~zureSc2_2 = Synth(\zureSc2, [\amp, 0, \freq, 329.628*(2**((0+24)/12)), \hpf, 50, \lpf, 400, \detune, 0, \out, out]);
~zureSc2_3 = Synth(\zureSc2, [\amp, 0, \freq, 329.628*(2**((2+12)/12)), \hpf, 50, \lpf, 400, \detune, 0, \out, out]);
)

(
var vol1 = 0.0;

~zureSc2_1.set(\amp, 2.0*vol1, \freq, 329.628*(2**((-3+24)/12)), \detune, 2.027, \lpf, 500, \reverb, 2.0);
~zureSc2_2.set(\amp, 2.0*vol1, \freq, 329.628*(2**((0+24)/12)), \detune, 1.022, \lpf, 500, \reverb, 2.0);
~zureSc2_3.set(\amp, 0.5*vol1, \freq, 329.628*(2**((2+12)/12)), \detune, 0.008, \lpf, 500, \reverb, 2.0);
)


(
~zureSc2_1.free;
~zureSc2_2.free;
~zureSc2_3.free;
)



// Part: dizzy

~pinknoise = Synth("pinknoise", [\amp, 0, \hpf, 100, \lpf, 1000, \out, 14]);
// ~pinknoise.set(\amp, 0.0, \hpf, 800, \lpf, 4700);
~pinknoise.set(\amp, 0.3, \hpf, 100, \lpf, 1000);

~pinknoise.free

(
~zureSc2_4 = Synth(\zureSc2, [\amp, 0, \freq, 329.628*(2**((9+12)/12)), \hpf, 100, \lpf, 400, \detune, 1, \out, 8]);
~zureSc2_5 = Synth(\zureSc2, [\amp, 0, \freq, 329.628*(2**((9+12)/12)), \hpf, 100, \lpf, 400, \detune, 1, \out, 8]);
~zureSc2_6 = Synth(\zureSc2, [\amp, 0, \freq, 329.628*(2**((9+12)/12)), \hpf, 100, \lpf, 400, \detune, 1, \out, 8]);
)

(
var vol1 = 1.0;
~zureSc2_4.set(\amp, 2.0*vol1, \freq, 329.628*(2**((9+12)/12)), \detune, 0.107, \lpf, 500, \reverb, 3.0);
~zureSc2_5.set(\amp, 2.0*vol1, \freq, 329.628*(2**((7+12)/12)), \detune, 0.012, \lpf, 700, \reverb, 3.0);
~zureSc2_6.set(\amp, 2.0*vol1, \freq, 329.628*(2**((4+12)/12)), \detune, 0.218, \lpf, 500, \reverb, 3.0);
)

(
var n = 5;
~superhammondSc5 = Synth(\superhammondSc, [\amp, 0.0, \freq, 277.183*0.5*(2**(0+n/12)), \vibrato, 1.0, \vrate, 32, \lpf, 300, \reverb, 1, \pan, 0, \out, 10]);
~superhammondSc6 = Synth(\superhammondSc, [\amp, 0.0, \freq, 277.183*0.5*(2**(2+n/12)), \vibrato, 1.0, \vrate, 32, \lpf, 300, \reverb, 1, \pan, -0.5, \out, 10]);
~superhammondSc7 = Synth(\superhammondSc, [\amp, 0.0, \freq, 277.183*0.5*(2**(9+n/12)), \vibrato, 1.0, \vrate, 32, \lpf, 300, \reverb, 1, \pan, 0.5, \out, 10]);
~superhammondSc8 = Synth(\superhammondSc, [\amp, 0.0, \freq, 277.183*0.5*(2**(0-12+n/12)), \vibrato, 1.0, \vrate, 32, \lpf, 300, \reverb, 1, 0, \out, 10]);
)

(
var vol = 1.0, n = 5;
~superhammondSc5.set(\amp, 0.4*vol, \freq, 277.183*0.5*(2**(0+n/12)), \reverb, 0.8, \vibrato, 1, \vrate, 1.6, \lpf, 8000, \hpf, 100,\tremolorate, 2, \tremolodepth, 0.2, \pan, -0.1);
~superhammondSc6.set(\amp, 0.4*vol, \freq, 277.183*0.5*(2**(2+n/12)), \reverb, 0.6, \vibrato, 1, \vrate, 1.46, \lpf, 8000, \hpf, 100, \tremolorate, 1.8, \tremolodepth, 0.1, \pan, -1);
~superhammondSc7.set(\amp, 0.4*vol, \freq, 277.183*0.5*(2**(9+n/12)), \reverb, 0.7, \vibrato, 1, \vrate, 1.8, \lpf, 8000, \hpf, 100, \tremolorate, 5, \tremolodepth, 0.1, \pan, 1);
~superhammondSc8.set(\amp, 0.3*vol, \freq, 277.183*0.5*(2**(0-12+n/12)), \reverb, 0.7, \vibrato, 1, \vrate, 0.8, \lpf, 8000, \hpf, 100, \tremolorate, 1.7, \tremolodepth, 0.1, \pan, 0);
)

(
~superhammondSc5.free;
~superhammondSc6.free;
~superhammondSc7.free;
~superhammondSc8.free;
)


// Part: tomurai

(
~zureSc2_7 = Synth(\zureSc2, [\amp, 0, \freq, 329.628*(2**((9+12)/12)), \hpf, 100, \lpf, 400, \detune, 1, \out, 8]);
~zureSc2_8 = Synth(\zureSc2, [\amp, 0, \freq, 329.628*(2**((9+12)/12)), \hpf, 100, \lpf, 400, \detune, 1, \out, 8]);
~zureSc2_9 = Synth(\zureSc2, [\amp, 0, \freq, 329.628*(2**((9+12)/12)), \hpf, 100, \lpf, 400, \detune, 1, \out, 8]);
~zureSc2_10 = Synth(\zureSc2, [\amp, 0, \freq, 329.628*(2**((9+12)/12)), \hpf, 100, \lpf, 400, \detune, 1, \out, 8]);
)

(
var vol1 = 2.0;
~zureSc2_7.set(\amp, 0.0*vol1, \freq, 329.628*(2**((11.0)/12)), \detune, 1.007, \lpf, 900, \reverb, 1.0);
~zureSc2_8.set(\amp, 1.0*vol1, \freq, 329.628*(2**((0-12)/12)), \detune, 0.012, \lpf, 500, \reverb, 1.0);
~zureSc2_9.set(\amp, 1.0*vol1, \freq, 329.628*(2**((-3-12)/12)), \detune, 0.218, \lpf, 500, \reverb, 1.0);
~zureSc2_10.set(\amp, 1.3*vol1, \freq, 329.628*(2**((-5-12)/12)), \detune, 0.118, \lpf, 600, \reverb, 1.0);
)


~noiseHarmony.set(\amp, 0, \freq1, 77, \freq2, 128, \freq3, 189, \freq4, 278, \freq5, 880, \gain1, 25, \gain2, 30,\gain3, 40, \gain4, 30, \gain5, 20);

~noiseHarmony.set(\amp, 20);


// Part: gakai

~noiseHarmony.set(\amp, 20, \freq1, 73, \freq2, 164, \freq3, 232, \freq4, 468, \freq5, 658, \gain1, 20, \gain2, 30,\gain3, 30, \gain4, 30, \gain5, 20);

~noiseHarmony.set(\amp, 20, \freq1, 73, \freq2, 164, \freq3, 232, \freq4, 468, \freq5, 658, \gain1, 20, \gain2, 30,\gain3, 30, \gain4, 30, \gain5, 20);

// Part: teiryu

(
var vol1 = 0.0;
~zureSc2_1.set(\amp, 1.0*vol1, \freq, 329.628*(2**(3/12)), \detune, 0.01, \hpf, 50, \lpf, 700, \reverb, 0.0);
~zureSc2_2.set(\amp, 0.0* vol1, \freq, 329.628*(2**(0-12/12)), \detune, 0.02, \hpf, 50, \lpf, 700, \reverb, 0.0);
~zureSc2_3.set(\amp, 1.0* vol1, \freq, 329.628*(2**(0-36/12)), \detune, 0.02, \hpf, 50, \lpf, 700, \reverb, 0.0);
)

(
~zureSc3_1 = Synth(\zureSc3, [\amp, 0, \freq, 329.628*0.25, \hpf, 100, \lpf, 300, \detune, 1, \out, 8, \pan, 0]);
~zureSc3_2 = Synth(\zureSc3, [\amp, 0, \freq, 329.628*(2**(-3/12)), \hpf, 100, \lpf, 300, \detune, 1, \out, 8, \pan, 1]);
~zureSc3_3 = Synth(\zureSc3, [\amp, 0, \freq, 329.628*(2**(-3/12)), \hpf, 100, \lpf, 300, \detune, 1, \out, 8, \pan, -1]);
)

(
var vol1 = 1.0;
~zureSc3_1.set(\amp, 2.6*vol1, \freq,  329.628*0.25, \detune, 0.07, \lpf, 400, \reverb, 1.0);
~zureSc3_2.set(\amp, 1.6*vol1, \freq, 329.628*(2**(-3/12)), \detune, 0.022, \lpf, 600, \reverb, 2.0);
~zureSc3_3.set(\amp, 1.6*vol1, \freq, 329.628*(2**(-3.3/12)), \detune, 0.008, \lpf, 600, \reverb, 2.0);
)

(
~zureSc3_1.free;
~zureSc3_2.free;
~zureSc3_3.free;
)

~noiseHarmony.set(\amp, 10, \freq1, 108, \freq2, 130, \freq3, 148, \freq4, 187, \freq5, 1078, \gain1, 20, \gain2, 30,\gain3, 30, \gain4, 20, \gain5, 10);


~leavesOfTreesEndless = Synth("leavesOfTreesEndless", [\amp, 0, \out, 0]);
~leavesOfTreesEndless.set(\amp, 1.0, \out, 14);
~leavesOfTreesEndless.free;



// sineharm

~sineHarm1 = Synth(\sine, [\amp, 0])
~sineHarm1.set(\amp, 0.3, \freq, 164.814*(2**(1/12)), \parFreq, 0, \pan2Freq, 0, \vibratoFreq, 3, \vibratoDepth, 0.2, \reverb, 0.4, \ice, 0);

~sineHarm2 = Synth(\sine, [\amp, 0])
~sineHarm2.set(\amp, 0.3, \freq, 164.814*(2**(0/12)), \parFreq, 0, \pan2Freq, 0.1, \vibratoFreq, 5, \vibratoDepth, 0.2, \reverb, 0.8, \ice, 0);

~sineHarm3 = Synth(\sine, [\amp, 0])
~sineHarm3.set(\amp, 0.3, \freq, 164.814*(2**(11/12)), \parFreq, 0, \pan2Freq, 0.1, \vibratoFreq, 5, \vibratoDepth, 0.0, \reverb, 0.7, \ice, 0);

~sineHarm4 = Synth(\sine, [\amp, 0])
~sineHarm4.set(\amp, 0.3, \freq, 164.814*(2**(7/12)), \parFreq, 0, \pan2Freq, 0.1, \vibratoFreq, 5, \vibratoDepth, 0.0, \reverb, 0.4, \ice, 0);

(
var vol = 0.0;
~sineHarm1.set(\amp, 1*vol, \freq, 164.814*(2**(1/12)), \parFreq, 0, \pan2Freq, 0, \vibratoFreq, 3, \vibratoDepth, 0.2, \reverb, 0.4, \ice, 0);
~sineHarm2.set(\amp, 1*vol, \freq, 164.814*(2**(12/12)), \parFreq, 0, \pan2Freq, 0.1, \vibratoFreq, 5, \vibratoDepth, 0.2, \reverb, 0.8, \ice, 0);
~sineHarm3.set(\amp, 1*vol, \freq, 164.814*(2**(9/12)), \parFreq, 0, \pan2Freq, 0.1, \vibratoFreq, 5, \vibratoDepth, 0.0, \reverb, 0.7, \ice, 0);
~sineHarm4.set(\amp, 1*vol, \freq, 164.814*(2**(7/12)), \parFreq, 0, \pan2Freq, 0.1, \vibratoFreq, 5, \vibratoDepth, 0.0, \reverb, 0.4, \ice, 0);
)

(
var vol = 0.0;
~sineHarm1.set(\amp, 1*vol, \freq, 164.814*(2**(0/12)), \parFreq, 0, \pan2Freq, 0, \vibratoFreq, 3, \vibratoDepth, 0.2, \reverb, 0.4, \ice, 0);
~sineHarm2.set(\amp, 1*vol, \freq, 164.814*(2**(2/12)), \parFreq, 0, \pan2Freq, 0.1, \vibratoFreq, 5, \vibratoDepth, 0.2, \reverb, 0.8, \ice, 0);
~sineHarm3.set(\amp, 1*vol, \freq, 164.814*(2**(-5/12)), \parFreq, 0, \pan2Freq, 0.1, \vibratoFreq, 5, \vibratoDepth, 0.0, \reverb, 0.7, \ice, 0);
~sineHarm4.set(\amp, 1*vol, \freq, 164.814*(2**(-1/12)), \parFreq, 0, \pan2Freq, 0.1, \vibratoFreq, 5, \vibratoDepth, 0.0, \reverb, 0.4, \ice, 0);
)

(
~sineHarm1.free;
~sineHarm2.free;
~sineHarm3.free;
~sineHarm4.free;
)


// resonant

(
~resonantSaw1 = Synth(\saw, [\amp, 0, \freq, 110, \vibrato, 1, \vrate, 32, \lpf, 1000]);
~resonantSaw2 = Synth(\saw, [\amp, 0, \freq, 220, \vibrato, 1, \vrate, 32, \lpf, 1000]);
~resonantSaw3 = Synth(\saw, [\amp, 0, \freq, 330, \vibrato, 1, \vrate, 32, \lpf, 1000]);
~resonantSaw4 = Synth(\saw, [\amp, 0, \freq, 55, \vibrato, 1, \vrate, 32, \lpf, 1000]);
~resonantSaw5 = Synth(\saw, [\amp, 0, \freq, 165, \vibrato, 1, \vrate, 32, \lpf, 1000]);
)

(
var masterVol = 0;
~resonantSaw1.set(\amp, 0.2*masterVol, \freq, 330, \parFreq, 0.22, \reverb, 1, \pan2Freq, 0.03, \bpf, 220);
~resonantSaw2.set(\amp, 0.25*masterVol, \freq, 220, \parFreq, 0.13, \reverb, 1, \pan2Freq, 0.07, \bpf, 220*1);
~resonantSaw3.set(\amp, 0.3*masterVol, \freq, 329.628/2, \parFreq, 0.1, \reverb, 1, \pan2Freq, 0.05, \bpf, 329.628*0.5);
~resonantSaw4.set(\amp, 0.3*masterVol, \freq, 277.183/2, \parFreq, 0.34, \reverb, 1, \pan2Freq, 0.1, \bpf, 277.183*0.5);
~resonantSaw5.set(\amp, 0.3*masterVol, \freq, 415.305/2, \parFreq, 0.08, \reverb, 1, \pan2Freq, 0.03, \bpf, 415.305*0.5);
)

(
var masterVol = 5;
~resonantSaw1.set(\amp, 0.2*masterVol, \freq, 165, \parFreq, 0.22, \reverb, 1, \pan2Freq, 0.03, \bpf, 220);
~resonantSaw2.set(\amp, 0.25*masterVol, \freq, 220, \parFreq, 0.13, \reverb, 1, \pan2Freq, 0.07, \bpf, 220*1);
~resonantSaw3.set(\amp, 0.3*masterVol, \freq, 329.628/2, \parFreq, 0.1, \reverb, 1, \pan2Freq, 0.05, \bpf, 329.628*0.5);
~resonantSaw4.set(\amp, 0.3*masterVol, \freq, 277.183/2, \parFreq, 1.34, \reverb, 1, \pan2Freq, 0.1, \bpf, 277.183*0.5);
~resonantSaw5.set(\amp, 0.3*masterVol, \freq, 415.305/2, \parFreq, 0.08, \reverb, 1, \pan2Freq, 0.03, \bpf, 415.305*0.5);
)

(
~resonantSaw1.free;
~resonantSaw2.free;
~resonantSaw3.free;
~resonantSaw4.free;
~resonantSaw5.free;
)

(
~resonantHammond1 = Synth(\superhammondSc, [\amp, 0.0, \freq, 277.183, \vibrato, 1.0, \vrate, 32, \lpf, 300, \reverb, 1, \pan, 0, \out, 10]);
~resonantHammond2 = Synth(\superhammondSc, [\amp, 0.0, \freq, 277.183, \vibrato, 1.0, \vrate, 32, \lpf, 300, \reverb, 1, \pan, -0.5, \out, 10]);
~resonantHammond3 = Synth(\superhammondSc, [\amp, 0.0, \freq, 277.183, \vibrato, 1.0, \vrate, 32, \lpf, 300, \reverb, 1, \pan, 0.5, \out, 10]);
~resonantHammond4 = Synth(\superhammondSc, [\amp, 0.0, \freq, 277.183, \vibrato, 1.0, \vrate, 32, \lpf, 300, \reverb, 1, \out, 10]);
)

(
var vol = 1.0, n = 0;
~resonantHammond1.set(\amp, 0.5*vol, \freq, 277.183*0.5*(2**((0+n)/12)), \reverb, 0.8, \vibrato, 1, \vrate, 16, \lpf, 4000, \hpf, 100,\tremolorate, 2, \tremolodepth, 0.2, \pan, -0.1);
~resonantHammond2.set(\amp, 0.4*vol, \freq, 277.183*0.5*(2**((7+n)/12)), \reverb, 0.6, \vibrato, 1, \vrate, 32, \lpf, 4000, \hpf, 100, \tremolorate, 8, \tremolodepth, 0.1, \pan, -0.5);
~resonantHammond3.set(\amp, 0.4*vol, \freq, 277.183*0.5*(2**((3+n)/12)), \reverb, 0.7, \vibrato, 1, \vrate, 28, \lpf, 4000, \hpf, 100, \tremolorate, 20, \tremolodepth, 0.1, \pan, 0.5);
~resonantHammond4.set(\amp, 0.5*vol, \freq, 277.183*0.5*(2**((-12+n)/12)), \reverb, 0.7, \vibrato, 1, \vrate, 28, \lpf, 4000, \hpf, 100, \tremolorate, 20, \tremolodepth, 0.1, \pan, 0.1);
)

(
var n = 0; // 初期値
var bpm = 90; // BPM
var beatsPerMeasure = 4; // 1小節の拍数（通常は4拍）
var measuresPerCycle = 4; // 切り替えに使用する小節数
var updateParameters;

// パラメータ更新関数
updateParameters = {
    ~resonantHammond1.set(\freq, 277.183 * 0.5 * (2 ** (0 + n / 12)));
	~resonantHammond2.set(\freq, 277.183 * 0.5 * (2 ** (7 + n / 12)));
	~resonantHammond3.set(\freq, 277.183 * 0.5 * (2 ** (3 + n / 12)));
    ~resonantHammond4.set(\freq, 277.183 * 0.5 * (2 ** (-12 + n / 12)));
};

// TempoClockを使用してBPMに同期
TempoClock.default.tempo = bpm / 60; // BPMを秒単位に変換

// 4小節ごとにnを切り替えるタスク
~task.stop;
~task.reset;

~task = Task({
    loop {
        n = if(n == 0, { 5 }, { 0 }); // nを0と5に切り替え
        updateParameters.value; // パラメータを更新
        (beatsPerMeasure * measuresPerCycle).wait; // 4小節待機
    }
});

~task.reset;
~task.start;
)

(
var vol = 0.4, n = 0;
~resonantHammond1.set(\amp, 0.5*vol, \reverb, 0.8, \vibrato, 1, \vrate, 16, \lpf, 4000, \hpf, 100,\tremolorate, 2, \tremolodepth, 0.2, \pan, -0.1);
~resonantHammond2.set(\amp, 0.4*vol, \reverb, 0.6, \vibrato, 1, \vrate, 32, \lpf, 4000, \hpf, 100, \tremolorate, 8, \tremolodepth, 0.1, \pan, -0.5);
~resonantHammond3.set(\amp, 0.4*vol, \reverb, 0.7, \vibrato, 1, \vrate, 28, \lpf, 4000, \hpf, 100, \tremolorate, 20, \tremolodepth, 0.1, \pan, 0.5);
~resonantHammond4.set(\amp, 0.5*vol, \reverb, 0.7, \vibrato, 1, \vrate, 28, \lpf, 4000, \hpf, 100, \tremolorate, 20, \tremolodepth, 0.1, \pan, 0.1);
)

(
~task.reset;
~task.stop;
)

(
var vol = 0.5, n = -12;
~resonantHammond1.set(\amp, 0.5*vol, \freq, 277.183*0.5*(2**(0+n/12)), \reverb, 0.8, \vibrato, 1, \vrate, 16, \lpf, 4000, \hpf, 100,\tremolorate, 2, \tremolodepth, 0.2, \pan, -0.1);
~resonantHammond2.set(\amp, 0.4*vol, \freq, 277.183*0.5*(2**(7+n/12)), \reverb, 0.6, \vibrato, 1, \vrate, 32, \lpf, 4000, \hpf, 100, \tremolorate, 8, \tremolodepth, 0.1, \pan, -0.5);
~resonantHammond3.set(\amp, 0.4*vol, \freq, 277.183*0.5*(2**(3+n/12)), \reverb, 0.7, \vibrato, 1, \vrate, 28, \lpf, 4000, \hpf, 100, \tremolorate, 20, \tremolodepth, 0.1, \pan, 0.5);
~resonantHammond4.set(\amp, 0.5*vol, \freq, 277.183*0.5*(2**(-12+n/12)), \reverb, 0.7, \vibrato, 1, \vrate, 28, \lpf, 4000, \hpf, 100, \tremolorate, 20, \tremolodepth, 0.1, \pan, 0.1);
)

(
~resonantHammond1.free;
~resonantHammond2.free;
~resonantHammond3.free;
~resonantHammond4.free;
)

