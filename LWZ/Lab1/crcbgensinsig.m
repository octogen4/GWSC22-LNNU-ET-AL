function sigVec = crcbgensinsig(dataX,snr,sinCoefs)
% Generate a sinusoidal signal
% S = CRCBGENSINSIG(X,SNR,C)
 
% Wenzhong Liu, 2022

phaseVec = 2*pi*sinCoefs(1)*dataX + sinCoefs(2);
sigVec = sin(2*pi*phaseVec);
sigVec = snr*sigVec/norm(sigVec);


