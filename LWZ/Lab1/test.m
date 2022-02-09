

%% Plot the sin signal

% Signal functions interface
sfuns=sigfuns;

% Set Signal parameters then Generate the signals

f0=9; phi0=60; A = 10;
maxFreq = f0; samplFreq = 20*maxFreq;
timeVec=settimevec(samplFreq,0,1.0);
sigVec = sfuns.sinsigf(timeVec,A,[f0,phi0]);
sinSD = SignalData(maxFreq,samplFreq,timeVec,sigVec);

f0=2; f1=10; phi0=60; A = 10;
maxFreq = f0+f1; samplFreq = 20*maxFreq;
timeVec=settimevec(samplFreq,0,1.0);
sigVec = sfuns.lcsigf(timeVec,A,[f0,f1,phi0]);
lcSD = SignalData(maxFreq,samplFreq,timeVec,sigVec);

f0=15;  phi0=30;  t0=0.5; sigma=0.1;A = 10;
maxFreq = f0; samplFreq = 20*maxFreq;
timeVec=settimevec(samplFreq,0,1.0);
sigVec = sfuns.singausigf(timeVec,A,[f0,phi0,t0,sigma]);
singauSD = SignalData(maxFreq,samplFreq,timeVec,sigVec);

f0=15; f1=20; phi0=30;  ta=0.3; sL=0.15; A = 10;
maxt=max(ta-f0/2/f1,1-(ta-f0/2/f1));
maxFreq = f0*(maxt-ta)+f1*(maxt-ta)^2;
samplFreq = 20*maxFreq;
timeVec=settimevec(samplFreq,0,1.0);
sigVec = sfuns.ltcsigf(timeVec,A,[f0,f1,phi0,ta,sL]);
ltcSD = SignalData(maxFreq,samplFreq,timeVec,sigVec);
%disp(ltcSD.sigVec);

%Plot the signals
nfig=4;
fig=figure;fig.Position=[60,50,600,600];
subplot(2,2,1);
plot(sinSD.timeVec,sinSD.sigVec,'Marker','.','MarkerSize',18);
subplot(2,2,2);
plot(lcSD.timeVec,lcSD.sigVec,'Marker','.','MarkerSize',18);
subplot(2,2,3);
plot(singauSD.timeVec,singauSD.sigVec,'Marker','.','MarkerSize',18);
subplot(2,2,4);
plot(ltcSD.timeVec,ltcSD.sigVec,'Marker','.','MarkerSize',18);

%Plot the periodogram (Magnitude of FFT)
%--------------

%Plot periodogram
nfig = 4;
fig=figure;fig.Position=[90,50,600,600];

[posFreq,fftSig] = getFFTofsig(sinSD.timeVec,sinSD.sigVec);
subplot(2,2,1);
plot(posFreq,abs(fftSig));

[posFreq,fftSig] = getFFTofsig(lcSD.timeVec,lcSD.sigVec);
subplot(2,2,2);
plot(posFreq,abs(fftSig));

[posFreq,fftSig] = getFFTofsig(singauSD.timeVec,singauSD.sigVec);
subplot(2,2,3);
plot(posFreq,abs(fftSig));

[posFreq,fftSig] = getFFTofsig(ltcSD.timeVec,ltcSD.sigVec);
subplot(2,2,4);
plot(posFreq,abs(fftSig));

%Plot a spectrogram
%----------------
winLen = 0.2;%sec
ovrlp = 0.1;%sec

sigVec=sinSD.sigVec; samplFreq=sinSD.samplFreq;
[S,F,T]=getspectrogram(sigVec,winLen,ovrlp,samplFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');ylabel('Frequency (Hz)');


sigVec=lcSD.sigVec; samplFreq=lcSD.samplFreq;
[S,F,T]=getspectrogram(sigVec,winLen,ovrlp,samplFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');ylabel('Frequency (Hz)');


sigVec=singauSD.sigVec; samplFreq=singauSD.samplFreq;
[S,F,T]=getspectrogram(sigVec,winLen,ovrlp,samplFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');ylabel('Frequency (Hz)');

sigVec=ltcSD.sigVec; samplFreq=ltcSD.samplFreq;
[S,F,T]=getspectrogram(sigVec,winLen,ovrlp,samplFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');ylabel('Frequency (Hz)');
