% L antenna pattern in a rotating wave frame

thetas = linspace(0,pi,30);
phis = linspace(0,2*pi,60);

[thetaV,phiV] = meshgrid(thetas,phis);

X=sin(thetaV).*cos(phiV);
Y=sin(thetaV).*sin(phiV);
Z=cos(thetaV);

fplusmat = zeros(length(phis),length(thetas));
fcrossmat = zeros(length(phis),length(thetas));

omega=.5; time=linspace(0,10,30);
fig=figure;fig.Position=[60,50,550,400];

for k=1:length(time)
clf;
for i = 1:length(phis)
    for j = 1:length(thetas)
        [fcrossmat(i,j),fplusmat(i,j)] = Fcrossplus_inspiral(thetas(j),phis(i),omega,time(k));
    end
end


c=fplusmat;
surf(X,Y,Z,abs(c)); hold on;
shading interp;
colorbar;
colormap(jet);
title('f plus (with tensor)');

drawnow;
end

