

%% Plot the sin signal

% Signal functions interface
sigscollect=sigfuns;

% Set Signal parameters then Generate the signals
f0=2; phi0=60; A = 10;
maxFreq = f0; samplFreq = 20*maxFreq;
sintimeVec=settimevec(samplFreq,0,1.0);
sinsigVec = sigscollect.sinsig(sintimeVec,A,[f0,phi0]);

f0=2; f1=10; phi0=60; A = 10;
maxFreq = f0+f1; samplFreq = 20*maxFreq;
lctimeVec=settimevec(samplFreq,0,1.0);
lcsigVec = sigscollect.lcsig(lctimeVec,A,[f0,f1,phi0]);

f0=5;  phi0=60;  t0=0.2; sigma=0.1;A = 10;
maxFreq = f0; samplFreq = 20*maxFreq;
singautimeVec=settimevec(samplFreq,0,1.0);
singausigVec = sigscollect.singausig(singautimeVec,A,[f0,phi0,t0,sigma]);
%Plot the signals
figure;
plot(sintimeVec,sinsigVec,'Marker','.','MarkerSize',18);
figure;
plot(lctimeVec,lcsigVec,'Marker','.','MarkerSize',18);
figure;
plot(singautimeVec,singausigVec,'Marker','.','MarkerSize',18);
%Plot the periodogram
%--------------
%Length of data 
lcdataLen = lctimeVec(end)-lctimeVec(1);
lcnSamples=length(lctimeVec);
%DFT sample corresponding to Nyquist frequency
kNyq = floor(lcnSamples/2)+1;
% Positive Fourier frequencies
posFreq = (0:(kNyq-1))*(1/sindataLen);
% FFT of signal
fftSig = fft(lcsigVec);
% Discard negative frequencies
fftSig = fftSig(1:kNyq);

%Plot periodogram
figure;
plot(posFreq,abs(fftSig));

%Plot a spectrogram
%----------------
winLen = 0.2;%sec
ovrlp = 0.1;%sec
%Convert to integer number of samples 
winLenSmpls = floor(winLen*samplFreq);
ovrlpSmpls = floor(ovrlp*samplFreq);
[S,F,T]=spectrogram(lcsigVec,winLenSmpls,ovrlpSmpls,[],samplFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');



