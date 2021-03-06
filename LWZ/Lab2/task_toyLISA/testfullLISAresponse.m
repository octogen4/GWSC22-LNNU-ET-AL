
% Input params
theta=0.6;
phi=0.4;
Aplus=0.01;
Across=0.005;
om0=1/(3600*24*10)*2*pi;
f0=om0/2/pi;

sampleRate =20*f0;
scyc=1/sampleRate;
tottime = 24*3600*180; % sec
%timeIntval =1/f0*20; % sec
t=0:scyc:tottime;

srcpVec=zeros(1,length(t)); % hplus, SSB
srccVec=zeros(1,length(t)); % hcross, SSB
sigVec=zeros(1,length(t));

for i=1:length(sigVec)
    [Fc,Fp]=LISA_Fcrossplus(theta,phi,t(i));
    [hc,hp]=gwpoltensor(t(i),Aplus,Across,om0,theta,phi);
    srcpVec(i)=Aplus*sin(om0*t(i));
    srccVec(i)=Across*cos(om0*t(i));
    sigVec(i)=Fp*hp+Fc*hc;
end

figure;
plot(t,srcpVec/norm(srcpVec)); hold on;
plot(t,sigVec/norm(sigVec)); hold on;

%Plot periodogram
fig=figure;fig.Position=[90,50,900,500];

[posFreq,fftSig] = getFFTofsig(t,srcpVec/norm(srcpVec));
plot(posFreq,abs(fftSig)); hold on;
%[posFreq,fftSig] = getFFTofsig(t,srccVec);
%plot(posFreq,abs(fftSig)); hold on;
[posFreq,fftSig] = getFFTofsig(t,sigVec/norm(sigVec));
plot(posFreq,abs(fftSig)); hold on;
