
thetas = linspace(0,pi,30);
phis = linspace(0,2*pi,60);

[thetaV,phiV] = meshgrid(thetas,phis);

X=sin(thetaV).*cos(phiV);
Y=sin(thetaV).*sin(phiV);
Z=cos(thetaV);

fplusmat = zeros(length(phis),length(thetas));
fcrossmat = zeros(length(phis),length(thetas));

tlist=0:3600*24:3600*24*365;

fig=figure;fig.Position=[60,50,1100,400];
clf;
for k=1:length(tlist)
    for i = 1:length(phis)
        for j = 1:length(thetas)
            [fcrossmat(i,j),fplusmat(i,j)] = LISA_Fcrossplus(thetas(j),phis(i),tlist(k));
        end
    end
    subplot(1,2,1);
    c=fplusmat;
    surf(X,Y,Z,abs(c));
    shading interp;
    colorbar;
    title('f plus of LISA DII');
    subplot(1,2,2);
    c=fcrossmat;
    surf(X,Y,Z,abs(c));
    shading interp;
    colormap(jet);
    colorbar;
    title('f cross of LISA DII');
    drawnow;
end
