% Colored Gaussian Noise
% Input
nSamples = 16384;
samplFreq =1024;
timeVec = (0:nSamples-1)/samplFreq;

% Plot PSD
targetPSD = @(f) (f>=100 & f<=300).*(f-100).*(300-f)/10000;
freqVec = 0:0.1:512;
psdVec = targetPSD(freqVec);
figure;
plot(freqVec,psdVec);

sqrtPSD = sqrt(psdVec);
fltrOrdr = 50;
b = fir2(fltrOrdr,freqVec/(samplFreq/2),sqrtPSD);

inNoise = randn(1,nSamples); % input a WGN
outNoise = sqrt(samplFreq)*fftfilt(b,inNoise);

%%
% Estimate the PSD
% (Pwelch plots in dB (= 10*log10(x)); plot on a linear scale)
[pxx,f]=pwelch(outNoise, 256,[],[],samplFreq);
figure;
plot(f,pxx);
xlabel('Frequency (Hz)');
ylabel('PSD');
% Plot the colored noise realization
figure;
plot(timeVec,outNoise);

