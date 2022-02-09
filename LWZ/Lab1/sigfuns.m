function sigscollect=sigfuns
    sigscollect.sinsig=@sinsig;
    sigscollect.lcsig=@lcsig;
    sigscollect.singausig=@singausig;
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

function sigVec = singausig(dataX,snr,sgCoefs)
% Generate a Sine-Gauss signal
% S = singausig(X,SNR,C)
 
% Wenzhong Liu, 2022
f0=sgCoefs(1); phi0=sgCoefs(2); t0=sgCoefs(3); sigma=sgCoefs(4);
phaseVec = 2*pi*f0*dataX + phi0;
sigVec = exp(-(dataX-t0).^2/(2*sigma^2)).*sin(phaseVec);
sigVec = snr*sigVec/norm(sigVec);
end



