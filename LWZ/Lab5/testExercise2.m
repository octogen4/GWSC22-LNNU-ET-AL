addpath f:/matlab_pro/GWSC22-Team1/LWZ/Lab5/SMBIGDAT19_CODE

ffparams = struct('rmin',-5,...
                     'rmax',5 ...
                  );
              
f= @(x1,x2) crcbpsotestfunc([x1 x2],ffparams);

v=0:0.01:1;

[x,y]=meshgrid(v,v);
z=f(x(:),y(:));
z=reshape(z,length(v),length(v));

figure;
surf(x,y,z, 'LineStyle', 'none');

