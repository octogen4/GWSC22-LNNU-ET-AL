function [Fcross,Fplus] = LISA_Fcrossplus(theta,phi,t)

% Detector frame base (SSB)
[pv1,pv2,pv3] = posvector(t);

nv1=pv2-pv3;
nv2=pv3-pv1;
nv3=pv1-pv2;

% Detector tensor (DII in arxiv:1207.4956)
DII=(nv1'*nv1+nv2'*nv2-2*(nv3'*nv3))/2/sqrt(3);

% Source direction vector in SSB frame
[nsx,nsy,nsz]=dirunitvect(theta,phi);
ns=[nsx,nsy,nsz];

% Wave frame base
nz=[0 0 1];
xv=cross(nz,ns);
yv=cross(xv,ns);
if(norm(xv)>0)
    xv=xv/norm(xv);
end

if(norm(yv)>0)
    yv=yv/norm(yv);
end
   
% Ploarization tensors
eplus=xv'*xv-yv'*yv;
ecross=xv'*yv+yv'*xv;

% Antenna patterns at t
Fplus=sum(DII(:).*eplus(:));
Fcross=sum(DII(:).*ecross(:));

end