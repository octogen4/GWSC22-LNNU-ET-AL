function sigscollect=sigfuns
    sigscollect.sinsig=@sinsig;
    sigscollect.lcsig=@lcsig;
end

function sigVec = sinsig(dataX,snr,sinCoefs)
% Generate a sinusoidal signal
 
% Wenzhong Liu, 2022

phaseVec = 2*pi*sinCoefs(1)*dataX + sinCoefs(2);
sigVec = sin(phaseVec);
sigVec = snr*sigVec/norm(sigVec);
end

function sigVec = lcsig(dataX,snr,lcCoefs)
% Generate a linear chirp signal
% S = lcsig(X,SNR,C)
 
% Wenzhong Liu, 2022

phaseVec = 2*pi*(lcCoefs(1)*dataX+lcCoefs(2)*dataX.^2) + lcCoefs(2);
sigVec = sin(phaseVec);
sigVec = snr*sigVec/norm(sigVec);
end



