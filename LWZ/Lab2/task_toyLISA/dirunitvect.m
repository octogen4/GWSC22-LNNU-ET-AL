function [nvx,nvy,nvz]=dirunitvect(theta,phi)

nvx=sin(theta)*cos(phi);
nvy=sin(theta)*sin(phi);
nvz=cos(theta);

end
