// 一旦停止するとき
(
"Stopping SuperDirt and SuperDirtMod...".postln;
~dirt.stop;
SuperDirtMod.stop;
s.freeAll;
// 既存Windowがあれば閉じる
if(~orbitWindow.notNil) {
	~orbitWindow.close;
};
)

// 再開
(
~dirt.start(57120, 0 ! 16);
SuperDirtMod.start(superDirt: ~dirt);

~orbitMonitor.();
)

~orbitMonitor.();

s.dumpOSC(0);

SuperDirtMod.reset

Server.allBootedServers

FreqScope.new(300,205)

// 出力先デバイスの確認
ServerOptions.inDevices;

ServerOptions.outDevices;

(
Server.default.options.numInputBusChannels = 0;
Server.default.options.numOutputBusChannels = 16;

Server.default.options.inDevice_("BlackHole 2ch");
// Server.default.options.outDevice_("MacBook Proのス");
Server.default.options.outDevice_("BlackHole 16ch");
// Server.default.options.outDevice_("M2");
// Server.default.options.outDevice_("M4");

~numChannels = 2;

Server.default.waitForBoot{
	~dirt.stop;
	~dirt = SuperDirt(~numChannels, Server.default);
	// load samples
	~dirt.loadSoundFiles(thisProcess.nowExecutingPath.dirname ++ "/samples/*");
	Server.default.sync;
	// ~dirt.loadSoundFiles;
	// Server.default.sync;
	SynthDef("pinknoise", {
		arg amp=1, lpf=4510, hpf=800, out=0;
		p=PinkNoise.ar(1!2);
		p=HPF.ar(p, hpf);
		p=LPF.ar(p, lpf);
		Out.ar(out, p*0.7*amp);
	}, [5]).add;
	SynthDef("forest", {
		arg amp=1, lpf=3000, hpf=1500, out=0;
		var a, groundNoise=0;
		a=PinkNoise.ar(1!2);
		50.do{
			a=BBandStop.ar(a,LFNoise1.kr(0.01.rand).range(10,2500),Rand(0.9,1))
		};
		a=LPF.ar(a,lpf);
		a=HPF.ar(a,hpf-(groundNoise*(hpf-100)));
		Out.ar(out, amp * a * 5);
	}, [1, 1, 1]).add;
	SynthDef(\pad, {
		| out=0, amp=1, freq=440, tremolo=0, parFreq=0|
		var gate = 1;
		var freqs = { freq * LFNoise2.kr(freq:1,mul:0.01,add:1) }!24;
		var gen = LFSaw.ar(freq:freqs) * 0.1;
		var fmod = 1;
		//var fmod = LFCub.kr(freq:1/12).range(1, LFNoise2.kr(freq:1).range(6,7)); // sharper sound
		var rqmod = LFNoise2.kr(freq:1/8).range(0.1,1.0);
		// var modspeed = 1/s;
		var modspeed = tremolo*1100;
		var snd = RLPF.ar(in:gen, freq:SinOsc.kr(modspeed).range(freqs*0.8, freqs*1.2) * fmod, rq:rqmod);
		snd = snd*LFPar.kr(parFreq*110);
		// snd = snd*LFPulse.kr(parFreq, width: 0.7);
		Out.ar(bus:out, channelsArray:Splay.ar(snd*amp));
	}, [0, 0.2, 0.1]).add;
	SynthDef("rain2", {
		arg amp=1;
		var out=0;
		p=PinkNoise.ar(1!2);
		p=HPF.ar(p, 1600);
		p=LPF.ar(p, 4390);
		Out.ar(out, p*0.05*amp);
	}, [1]).add;
	SynthDef("river", {
		arg amp=1;
		var out=0;
		p=PinkNoise.ar(1!2);
		p=HPF.ar(p, 475);
		p=LPF.ar(p, 2500);
		Out.ar(out, p*0.05*amp);
	}, [1]).add;
	SynthDef("sine", {
		arg freq = 440, amp = 0.2, parFreq=0, pan2Freq=0, pan=0,
		vibratoFreq=3, vibratoDepth=0, actave=1, reverb=0, ice=0, distort=0;
		var sig, out=0, chain, in, z, y, oct, left, right, mod;
		sig = SinOsc.ar(actave*freq*(1+((LFPar.ar(vibratoFreq)+1)*(vibratoDepth/50))), 0, amp);
		// distort
		mod = CrossoverDistortion.ar(sig, amp: 0.2, smooth: 0.01);
		mod = mod + (0.1 * distort * DynKlank.ar(`[[60,61,240,3000 + SinOsc.ar(62,mul: 100)],nil,[0.1, 0.1, 0.05, 0.01]], sig));
		mod = (mod.cubed * 8).softclip * 0.5;
		sig = SelectX.ar(distort, [sig, mod]);
		// tremoro
		sig = if(
			parFreq>0.1,
			sig*LFPar.ar(parFreq),
			if(
				LFPar.ar(parFreq)>0,
				sig*(LFPar.ar(parFreq) + (1-(LFPar.ar(parFreq))*((1-(parFreq*10))))),
				sig*(LFPar.ar(parFreq) + (-1-(LFPar.ar(parFreq))*((1-(parFreq*10))))),
			)
		);
		// panning
		sig = if(
			pan2Freq>0.1,
			Pan2.ar(sig, LFPar.ar(pan2Freq)),
			Pan2.ar(sig, LFPar.ar(pan2Freq)*pan2Freq*10)
		);
		// reverb
		z = DelayN.ar(sig, 0.048);
		y = Mix.ar(Array.fill(7,{ CombL.ar(z, 0.1, 1, 15) }));
		32.do({ y = AllpassN.ar(y, 0.050, [0.050.rand, 0.050.rand], 1) });
		oct = 1.0 * LeakDC.ar( abs(y) );
		y = SelectX.ar(ice, [y, ice * oct, DC.ar(0)]);
		sig = sig + (0.2*y*reverb);
		sig = sig * 0.1;
		Out.ar(out, sig);
	}, [0.1, 0.2, 1, 1, 1, 1, 1, 1, 10, 10, 10]).add;

	SynthDef("sine2", {
		arg freq = 440, amp = 0.2, parFreq=0, pan=0,
		vibratoFreq=3, vibratoDepth=0, actave=1, reverb=0, ice=0, distort=0 , out=0;
		var sig, chain, in, z, y, oct, left, right, mod;
		sig = SinOsc.ar(actave*freq*(1+((LFPar.ar(vibratoFreq)+1)*(vibratoDepth/50))), 0, amp);
		// distort
		mod = CrossoverDistortion.ar(sig, amp: 0.2, smooth: 0.01);
		mod = mod + (0.1 * distort * DynKlank.ar(`[[60,61,240,3000 + SinOsc.ar(62,mul: 100)],nil,[0.1, 0.1, 0.05, 0.01]], sig));
		mod = (mod.cubed * 8).softclip * 0.5;
		sig = SelectX.ar(distort, [sig, mod]);
		// tremoro
		sig = if(
			parFreq>0.1,
			sig*LFPar.ar(parFreq),
			if(
				LFPar.ar(parFreq)>0,
				sig*(LFPar.ar(parFreq) + (1-(LFPar.ar(parFreq))*((1-(parFreq*10))))),
				sig*(LFPar.ar(parFreq) + (-1-(LFPar.ar(parFreq))*((1-(parFreq*10))))),
			)
		);
		// panning
		sig = Pan2.ar(sig, pan);
		// reverb
		z = DelayN.ar(sig, 0.048);
		y = Mix.ar(Array.fill(7,{ CombL.ar(z, 0.1, 1, 15) }));
		32.do({ y = AllpassN.ar(y, 0.050, [0.050.rand, 0.050.rand], 1) });
		oct = 1.0 * LeakDC.ar( abs(y) );
		y = SelectX.ar(ice, [y, ice * oct, DC.ar(0)]);
		sig = sig + (0.2*y*reverb);
		sig = sig * 0.1;
		Out.ar(out, sig);
	}, [0.2, 0.0, 1, 0.1, 1, 1, 1, 1, 10, 10, 10]).add;

	SynthDef("saw", {
		arg freq = 440, amp = 0.2, parFreq=0, pan2Freq=0, pan=0,
		vibratoFreq=3, vibratoDepth=0, actave=1, reverb=0, ice=0, bpf=440;
		var sig, out=0, chain, in, z, y, oct, left, right, mod;
		sig = SawDPW.ar(actave*freq*(1+((LFPar.ar(vibratoFreq)+1)*(vibratoDepth/50))), 0, amp);
		// tremoro
		sig = if(
			parFreq>0.1,
			sig*LFPar.ar(parFreq),
			if(
				LFPar.ar(parFreq)>0,
				sig*(LFPar.ar(parFreq) + (1-(LFPar.ar(parFreq))*((1-(parFreq*10))))),
				sig*(LFPar.ar(parFreq) + (-1-(LFPar.ar(parFreq))*((1-(parFreq*10))))),
			)
		);
		// panning
		sig = if(
			pan2Freq>0.1,
			Pan2.ar(sig, LFPar.ar(pan2Freq)),
			Pan2.ar(sig, LFPar.ar(pan2Freq)*pan2Freq*10)
		);
		// reverb
		z = DelayN.ar(sig, 0.048);
		y = Mix.ar(Array.fill(7,{ CombL.ar(z, 0.1, 1, 15) }));
		32.do({ y = AllpassN.ar(y, 0.050, [0.050.rand, 0.050.rand], 1) });
		oct = 1.0 * LeakDC.ar( abs(y) );
		y = SelectX.ar(ice, [y, ice * oct, DC.ar(0)]);
		sig = sig + (0.2*y*reverb);
		sig = sig * 0.1;
		// sig = LPF.ar(sig, lpf);
		sig = BPF.ar(sig, bpf);
		Out.ar(out, sig);
	}, [0.3, 10, 1, 1, 1, 1, 1, 1, 10, 10, 10]).add;

	SynthDef(\zureSc, {|out, amp=1, pan, accelerate, freq, decay=0, detune=1,lpf=8000,hpf=50 |
		var basefreq = freq;
		var sound = VarSaw.ar(basefreq, 0, 1);
		var sound2 = VarSaw.ar(basefreq*(detune/100+1), 0, 1);
		var sound3 = VarSaw.ar(basefreq*(-1*detune/100+1), 0, 1);
		sound = sound - DelayN.ar(sound2,0.2)
		+ DelayN.ar(sound3,0.2);
		sound = LPF.ar(sound, lpf);
		sound = HPF.ar(sound, hpf);
		Out.ar(out, sound!2*0.05*amp);
	}, [0, 1, 0, 0, 0, 0.2]).add;

	SynthDef("SinOscSynthBend3", {
		arg out, sustain=1, decay=0, pan=0, freq=110, accelerate=0, slide=0, sustainpedal=0.5, vibratoFreq=10, vibratoDepth=0;
		var fglide, detune, sound, sig1, sig2, env, bendSustain;
		bendSustain = sustainpedal;
		detune = 1.0;
		fglide = EnvGen.ar(Env.perc(0.05, 0.3, 1, \lin), timeScale:bendSustain) * (-1*slide/4) + 1;
		freq = freq * fglide * Line.kr(1, 1+accelerate, bendSustain);
		freq = freq *(1+((LFPar.ar(vibratoFreq)+1)*(vibratoDepth/50)));
		sig1 = SinOsc.ar(freq).dup;
		sig2 = SinOsc.ar(freq * detune).dup;
		sound = (sig1 + sig2) * 0.5;
		env = EnvGen.ar(Env.linen(0.6, 0, 0.003, 1, 3.5), timeScale:sustain, doneAction:2);
		OffsetOut.ar(out, sound*env);
	}).add;
	SynthDef(\vibNoise, {
		arg amp = 0.0, freq = 98, rq = 0.03, tremRate = 92, tremDepth = 0.9, out=0;
		var source, eq, trem;
		source=WhiteNoise.ar(1.0!2)+BrownNoise.ar(1.0!2);
		trem = (SinOsc.kr(tremRate) * tremDepth) + (1-tremDepth);
		eq = BPF.ar(source, freq, rq) * trem;
		Out.ar(out, eq * 3 * amp);
	}, [10, 0, 0.6, 0.1, 0.1, 1]).add;

	// wait load
	Server.default.sync;
	~dirt.start(57120, 0 ! 16);
	SuperDirtMod.start(superDirt: ~dirt);

	// tidalcyclesのモニタ(SuperDirt起動後)
	~orbitMonitor.();
}
)




(
// SuperDirtが起動している前提
// 例: ~dirt.start;

var addr = NetAddr("127.0.0.1", 57120); // SuperDirtのポート

var msg = [
	"s", "tabla2",
	"n", 0,
	"amp", 0.1,
	"lpf", 1000,
	"speed", 0.9,
	"orbit", 10
];

// /dirt/play に送信
addr.sendMsg("/dirt/play", *msg);
)



