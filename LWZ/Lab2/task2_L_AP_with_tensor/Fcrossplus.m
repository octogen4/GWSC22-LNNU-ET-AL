function [Fcross,Fplus] = Fcrossplus(theta,phi)

% Detector frame base
nx=[1 0 0];
ny=[0 1 0];
nz=[0 0 1];

% Source direction vector in detector frame
nv=nv(theta,phi);

% Wave frame base
xv=cross(nz,nv);
yv=cross(xv,nv);

% Detector tensor
D=(nx'*nx-ny'*ny)/2;

% Ploarization tensors
eplus=xv'*xv-yv'*yv;
ecross=xv'*yv+yv'*xv;

% Antenna patterns
Fplus=sum(D.*eplus);
Fcross=sum(D.*ecross);

end