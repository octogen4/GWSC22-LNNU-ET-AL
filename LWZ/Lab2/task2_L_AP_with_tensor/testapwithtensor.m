
thetas = linspace(0,pi,30);
phis = linspace(0,2*pi,60);

[thetaV,phiV] = meshgrid(thetas,phis);

X=sin(thetaV).*cos(phiV);
Y=sin(thetaV).*sin(phiV);
Z=cos(thetaV);

fplusmat = zeros(length(phis),length(thetas));
fcrossmat = zeros(length(phis),length(thetas));

for i = 1:length(phis)
    for j = 1:length(thetas)
        [fcrossmat(i,j),fplusmat(i,j)] = Fcrossplus(thetas(j),phis(i));
    end
end

fig=figure;fig.Position=[60,50,1100,400];
subplot(1,2,1);
c=fplusmat;
surf(X,Y,Z,abs(c));
shading interp;
colorbar;
title('f plus (with tensor)');
subplot(1,2,2);
c=fcrossmat;
surf(X,Y,Z,abs(c));
shading interp;
colormap(jet);
colorbar;
title('f cross (with tensor)');
