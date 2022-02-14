function sigVec = lcsigf(dataX,snr,lcCoefs)
% Generate a linear chirp signal
% S = lcsig(X,SNR,C)
 
% Wenzhong Liu, 2022

phaseVec = 2*pi*(lcCoefs(1)*dataX+lcCoefs(2)*dataX.^2) + lcCoefs(3);
sigVec = sin(phaseVec);
sigVec = snr*sigVec/norm(sigVec);
end

