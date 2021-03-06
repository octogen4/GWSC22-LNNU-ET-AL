sfuns=sigfuns;

samplFreq = 1024;
f1=100; phi1=0; A1 = 10;
f2=200; phi2=pi/6; A2 = 5.5;
f3=300; phi3=pi/4; A3 = 2.5;

timeVec=settimevec(samplFreq,0,2.0);
sigVec1 = sfuns.sinsigf(timeVec,A1,[f1,phi1]);
sigVec2 = sfuns.sinsigf(timeVec,A2,[f2,phi2]);
sigVec3 = sfuns.sinsigf(timeVec,A3,[f3,phi3]);
sigVec=sigVec1+sigVec2+sigVec3;

%fig=figure;fig.Position=[60,50,1200,600];
%plot(timeVec,sigVec,'Marker','.','MarkerSize',18)

filtOrder = 30;
maxfq = 1000;

%b = fir1(filtOrder,120/512);
b = fir1(filtOrder,[180/(samplFreq/2),220/(samplFreq/2)]);
%b = fir1(filtOrder,280/(samplFreq/2),'high');

%freqz(b,1,512);
filtSig = fftfilt(b,sigVec);

fig=figure;fig.Position=[60,50,1200,400];
subplot(3,1,1);
plot(timeVec,sigVec,'Marker','.','MarkerSize',18);
axis([0.8 1.0 -1 1]);
subplot(3,1,2);
plot(timeVec,filtSig,'Marker','.','MarkerSize',18);
axis([0.8 1.0 -0.5 0.5]);
subplot(3,1,3);
plot(timeVec,sigVec2,'Marker','.','MarkerSize',18);
axis([0.8 1.0 -0.5 0.5]);

fig=figure;fig.Position=[60,50,1200,600];
[posFreq,fftSig] = getFFTofsig(timeVec,sigVec);
subplot(1,2,1);
plot(posFreq,abs(fftSig));

[posFreq,fftSig] = getFFTofsig(timeVec,filtSig);
subplot(1,2,2);
plot(posFreq,abs(fftSig));



