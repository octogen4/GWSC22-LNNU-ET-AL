function [Fcross,Fplus] = Fcrossplus(theta,phi)

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
    

% Detector tensor
D=(nx'*nx-ny'*ny)/2;

% Ploarization tensors
eplus=xv'*xv-yv'*yv;
ecross=xv'*yv+yv'*xv;

% Antenna patterns
Fplus=sum(D(:).*eplus(:));
Fcross=sum(D(:).*ecross(:));

end