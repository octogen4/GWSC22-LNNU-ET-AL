function [hc,hp] = gwpoltensor(t,Aplus,Across,om0,theta,phi)

Omega=setdectorOmega();
c = 3E8;
AU=1.496E11; % SI

% Propating direction in SSB frame
[nx,ny,nz]=dirunitvect(theta,phi);
n=[-nx,-ny,-nz];

% Location of the dector in SSB frame
rd=[AU*cos(Omega*t),AU*sin(Omega*t),0];
phase=om0*(t-sum(n.*rd)/c);

hp=Aplus*sin(phase);
hc=Across*cos(phase);


end