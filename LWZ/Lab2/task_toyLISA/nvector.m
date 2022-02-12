function [nv1_SSB,nv2_SSB,nv3_SSB]=nvector(t)

Omega=setdectorOmega(); % rad/s

% Dector Frame (DF)
% Three spacecraft positions as sp1, sp2, sp3

sp1=[1/sqrt(3)*cos(Omega*t-2*pi/3),1/sqrt(3)*sin(Omega*t-2*pi/3),0];
sp2=[1/sqrt(3)*cos(Omega*t),1/sqrt(3)*sin(Omega*t),0];
sp3=[1/sqrt(3)*cos(Omega*t+2*pi/3),1/sqrt(3)*sin(Omega*t+2*pi/3),0];

nv1_DF=sp2-sp3;
nv2_DF=sp3-sp1;
nv3_DF=sp1-sp2;

% To SSB frame
nv1_SSB=DFtoSSB(nv1_DF,Omega*t);
nv2_SSB=DFtoSSB(nv2_DF,Omega*t);
nv3_SSB=DFtoSSB(nv3_DF,Omega*t);

end
