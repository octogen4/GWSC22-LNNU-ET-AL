function [dataVec,sigVec] = crcbgenqcdata_colpsd(dataX,snr,qcCoefs)
% Generate data containing a quadratic chirp signal
% [Y,S] = CRCBGENQCDATA(X,SNR,C)
% Generates a realization of data containing a quadratic chirp signal S
% embedded in white Gaussian noise with unit variance. X is the vector of
% time stamps at which the samples of data in Y are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S and C is the vector of
% three coefficients [a1, a2, a3] that parametrize the signal phase, given
% by a1*t+a2*t^2+a3*t^3. 

%Soumya D. Mohanty, May 2018

targetPSD = @(f) (f>=50 & f<=100).*(f-50).*(100-f)/625+1;

nSamples = length(dataX);
sampTime = dataX(end)-dataX(1);
sampFreq = floor(nSamples/sampTime);

dataLen = nSamples/sampFreq;
kNyq = floor(nSamples/2)+1;
posFreq = (0:(kNyq-1))*(1/dataLen);
psdPosFreq = targetPSD(posFreq);

noiseVec = statgaussnoisegen(nSamples,[posFreq(:),psdPosFreq(:)],100,sampFreq);

sigVec = crcbgenqcsig_colpsd(dataX,qcCoefs);
[sigVec,~] = normsig4psd(sigVec,sampFreq,psdPosFreq,snr);
    
dataVec = sigVec + noiseVec;
end

