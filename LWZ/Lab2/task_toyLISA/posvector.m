function [pv1_SSB,pv2_SSB,pv3_SSB]=posvector(t)

Omega=2*pi/(365*24*3600); % rad/s

% Dector Frame (DF)
% Three spacecraft positions as sp1, sp2, sp3

sp1=[1/sqrt(3)*cos(Omega*t-2*pi/3),1/sqrt(3)*sin(Omega*t-2*pi/3),0];
sp2=[1/sqrt(3)*cos(Omega*t),1/sqrt(3)*sin(Omega*t),0];
sp3=[1/sqrt(3)*cos(Omega*t+2*pi/3),1/sqrt(3)*sin(Omega*t+2*pi/3),0];


% To SSB frame
pv1_SSB=DFtoSSB(sp1,Omega*t);
pv2_SSB=DFtoSSB(sp2,Omega*t);
pv3_SSB=DFtoSSB(sp3,Omega*t);

end
