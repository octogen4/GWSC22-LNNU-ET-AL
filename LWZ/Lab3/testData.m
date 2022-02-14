data = load('testData.txt');

figure;
plot(data(:,1),data(:,2));

timeVec = data(:,1);
dataVec = data(:,2);

% get sinal-free part
id = find(timeVec>=5.0,1)-1;
sigfreeTime=timeVec(1:id);
sigfreeData=dataVec(1:id);
figure;
plot(sigfreeTime,sigfreeData);

% find the noise PSD
samplFreq = id/timeVec(id);
[noisePSD,sigfreeFreq]=pwelch(sigfreeData', 128,[],[],samplFreq);
figure;
plot(sigfreeFreq,noisePSD);

% Whiten the data
sqrtPSD = 1./sqrt(noisePSD);
fltrOrdr = 500;
b = fir2(fltrOrdr,sigfreeFreq/(samplFreq/2),sqrtPSD);

outdata = 1./sqrt(samplFreq)*fftfilt(b,dataVec);

%

[posFreq,fftSig] = getFFTofsig(timeVec,dataVec);
figure;
plot(posFreq,abs(fftSig));hold on;
[posFreq,fftSig] = getFFTofsig(timeVec,outdata);
plot(posFreq,abs(fftSig));


figure;
plot(timeVec,dataVec); hold on;
plot(timeVec,outdata);


winLen = 0.2;%sec
ovrlp = 0.1;%sec



[S,F,T]=getspectrogram(dataVec,winLen,ovrlp,samplFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');ylabel('Frequency (Hz)');

[S,F,T]=getspectrogram(outdata,winLen,ovrlp,samplFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');ylabel('Frequency (Hz)');



