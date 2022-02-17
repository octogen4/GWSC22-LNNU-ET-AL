% run this script after test.m
% to check snr



testn = 1000;
lrh0 = zeros(1,testn);
for i=1:testn
    outn = statgaussnoisegen(nSamples,[posFreq(:),psdPosFreq(:)],100,sampFreq);
    lrh0(i)=innerprodpsd(outn,outs,sampFreq,psdPosFreq);
end

lrh1 = zeros(1,testn);
for i=1:testn
    outn = statgaussnoisegen(nSamples,[posFreq(:),psdPosFreq(:)],100,sampFreq);
    lrh1(i)=innerprodpsd(outn+outs,outs,sampFreq,psdPosFreq);
end

outSNR = (mean(lrh1)-mean(lrh0))/std(lrh0);

disp('SNR:');
disp(outSNR);