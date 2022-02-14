function [posFreq, fftSig] = getFFTofsig(timeVec, sigVec)

dataLen = timeVec(end)-timeVec(1); %Length of data
nSamples=length(timeVec); 
kNyq = floor(nSamples/2)+1; %DFT sample corresponding to Nyquist frequency
posFreq = (0:(kNyq-1))*(1/dataLen);% Positive Fourier frequencies
fftSig = fft(sigVec);% FFT of signal
fftSig = fftSig(1:kNyq);% Discard negative frequencies

end