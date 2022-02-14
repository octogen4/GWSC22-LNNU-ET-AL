y = load('iLIGOSensitivity.txt');
y1=y(:,1);
y2=y(:,2);
figure;
loglog(y1,y2);
% y is sqrtSn*2

nSamples = 204800;
sampFreq = 2048;

y1=y1';
y2=y2';
y1=[0 y1];
y2=[y2(1) y2];

%Positive DFT frequencies
kNyq = floor(nSamples/2)+1;
posFreq = (0:(kNyq-1))*sampFreq/nSamples;
%Interpolate
sensVec = interp1(y1, y2, posFreq);

bmap1=posFreq<40;
bmap2=posFreq>700;
id1=sum(bmap1)+1;
id2=length(posFreq)-sum(bmap2);
sensVec(bmap1)=sensVec(id1);
sensVec(bmap2)=sensVec(id2);

figure;
semilogy(posFreq,sensVec); 

%
freqVec = posFreq;
sqrtPSD = sensVec/sqrt(2);
fltrOrdr = 500;
b = fir2(fltrOrdr,freqVec/(sampFreq/2),sqrtPSD);

inNoise = randn(1,nSamples); 
outNoise = sqrt(sampFreq)*fftfilt(b,inNoise);

% Estimate the PSD
% (Pwelch plots in dB (= 10*log10(x)); plot on a linear scale)
[pxx,f]=pwelch(outNoise, 512,[],[],sampFreq);
outfreq =f;
outPSD = pxx/2;

figure;
semilogy(freqVec,sqrtPSD.^2);hold on;
semilogy(outfreq,outPSD);
xlabel('Frequency (Hz)');
ylabel('PSD');




