addpath f:/matlab_pro/GWSC22-Team1/LWZ/Lab4/DETEST

y = load('data3.txt');
dataY=y';
sampFreq=1024;
nSamples = length(dataY);
dataX = (0:(nSamples-1))/sampFreq;

noisePSD = @(f) (f>=100 & f<=300).*(f-100).*(300-f)/10000 + 1;

a1 = 10;
a2 = 2;
a3 = 3;

rmin = [0, 0, 0];
rmax = [10, 10, 10];

x1= (a1-rmin(1))/(rmax(1)-rmin(1));
x2= (a2-rmin(2))/(rmax(2)-rmin(2));
x3= (a3-rmin(3))/(rmax(3)-rmin(3));
%x=[x1 x2 x3];
x=[a1,a2,a3];

inParams = struct('rmin',rmin,...
                     'rmax',rmax, ...
                     'psdfun',noisePSD,...
                     'dataX', dataX,...
                     'dataXSq', dataX.^2,...
                     'dataXCb', dataX.^3,...
                     'dataY',dataY );

llrVal = llrqc(x,inParams);
disp(llrVal);