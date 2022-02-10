
thetas = linspace(0,pi,30);
phis = linspace(0,2*pi,60);

[thetaV,phiV] = meshgrid(thetas,phis);

X=sin(thetaV).*cos(phiV);
Y=sin(thetaV).*sin(phiV);
Z=cos(thetaV);


fig=figure;fig.Position=[60,50,1100,400];
subplot(1,2,1);
c=fplus(thetaV,phiV);
surf(X,Y,Z,abs(c));
shading interp;
colorbar;
title('f plus');
subplot(1,2,2);
c=fcross(thetaV,phiV);
surf(X,Y,Z,abs(c));
shading interp;
colormap(jet);
colorbar;
title('f cross');
