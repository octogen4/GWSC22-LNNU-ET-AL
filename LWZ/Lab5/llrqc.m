function llrVal = llrqc(x,params)
%Generate normalized quadratic chirp
phaseVec = x(1)*params.dataX + x(2)*params.dataXSq + x(3)*params.dataXCb;
qc = sin(2*pi*phaseVec);

%qc = qc/norm(qc);

nSamples = length(params.dataX);
sampTime = params.dataX(end)-params.dataX(1);
sampFreq = floor(nSamples/sampTime);

%sampFreq = 1024;

dataLen = nSamples/sampFreq;
kNyq = floor(nSamples/2)+1;
posFreq = (0:(kNyq-1))*(1/dataLen);
psdPosFreq = params.psdfun(posFreq);

[templateVec,~] = normsig4psd(qc,sampFreq,psdPosFreq,1);

%Compute fitness
%ssrVal = -(params.dataY*qc')^2;
llr = innerprodpsd(params.dataY,templateVec,sampFreq,psdPosFreq);
llrVal = -llr^2;
end