function sfunscollect=sigfuns
    sfunscollect.sinsigf=@sinsigf;
    sfunscollect.lcsigf=@lcsigf;
    sfunscollect.singausigf=@singausigf;
    sfunscollect.ltcsigf=@ltcsigf;
end

function sigVec = sinsigf(dataX,snr,sinCoefs)
% Generate a sinusoidal signal
 
% Wenzhong Liu, 2022

phaseVec = 2*pi*sinCoefs(1)*dataX + sinCoefs(2);
sigVec = sin(phaseVec);
sigVec = snr*sigVec/norm(sigVec);
end

function sigVec = lcsigf(dataX,snr,lcCoefs)
% Generate a linear chirp signal
% S = lcsig(X,SNR,C)
 
% Wenzhong Liu, 2022

phaseVec = 2*pi*(lcCoefs(1)*dataX+lcCoefs(2)*dataX.^2) + lcCoefs(2);
sigVec = sin(phaseVec);
sigVec = snr*sigVec/norm(sigVec);
end

function sigVec = singausigf(dataX,snr,sgCoefs)
% Generate a Sine-Gauss signal
% S = singausig(X,SNR,C)
 
% Wenzhong Liu, 2022
f0=sgCoefs(1); phi0=sgCoefs(2); t0=sgCoefs(3); sigma=sgCoefs(4);
phaseVec = 2*pi*f0*dataX + phi0;
sigVec = exp(-(dataX-t0).^2/(2*sigma^2)).*sin(phaseVec);
sigVec = snr*sigVec/norm(sigVec);
end

function sigVec = ltcsigf(dataX,snr,Coefs)
% Generate a Linear transient chirp signal
% S = ltcsig(X,SNR,C)
 
% Wenzhong Liu, 2022

f0=Coefs(1); 
f1=Coefs(2); 
phi0=Coefs(3);
ta=Coefs(4); L=Coefs(5);

ns = length(dataX);

sigVec=zeros(1,ns);
for i =1:ns
    t=dataX(i);
    if t>ta && t<ta+L
        sigVec(i)=sin(2*pi*(f0*(t-ta)+f1*(t-ta)^2)+phi0);
    else
        sigVec(i)=0;
    end
end
sigVec = snr*sigVec/norm(sigVec);
end



