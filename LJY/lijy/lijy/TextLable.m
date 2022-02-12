

f0=2; f1=10; phi0=pi/3; A = 10;
maxFreq = f0+f1; samplFreq = 20*maxFreq;
samplIntrvl = 1/samplFreq;

timeVec = 0:samplIntrvl:1.0;
sigVec = crcbgenqcsig(timeVec,A,[f0,f1,phi0]);

figure;
plot(timeVec,sigVec,'Marker','.','MarkerSize',18);