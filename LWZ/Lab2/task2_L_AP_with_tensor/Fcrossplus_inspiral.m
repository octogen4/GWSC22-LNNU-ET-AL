function [Fcross,Fplus] = Fcrossplus_inspiral(theta,phi,omega,t)

% Detector frame base
nx=[1 0 0];
ny=[0 1 0];
nz=[0 0 1];

% Source direction vector in detector frame
[nvx,nvy,nvz]=dirunitvect(theta,phi);
nv=[nvx,nvy,nvz];

% Wave frame base
xv=cross(nz,nv);
yv=cross(xv,nv);
if(norm(xv)>0)
    xv=xv/norm(xv);
end

if(norm(yv)>0)
    yv=yv/norm(yv);
end

xv1=xv*cos(omega*t)+yv*sin(omega*t);
yv1=-xv*sin(omega*t)+yv*cos(omega*t);

xv=xv1;
yv=yv1;

% Detector tensor
D=(nx'*nx-ny'*ny)/2;

% Ploarization tensors
eplus=xv'*xv-yv'*yv;
ecross=xv'*yv+yv'*xv;

% Antenna patterns
Fplus=sum(D(:).*eplus(:));
Fcross=sum(D(:).*ecross(:));

end