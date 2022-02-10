thetas = linspace(0,pi,50);
phis = linspace(0,2*pi,50);

[thetaV,phiV] = meshgrid(thetas,phis);

X=sin(thetaV).*cos(phiV);
Y=sin(thetaV).*sin(phiV);
Z=cos(thetaV);

figure;
surf(X,Y,Z);