addpath f:/matlab_pro/GWSC22-Team1/LWZ/Lab6;
addpath f:/matlab_pro/GWSC22-Team1/LWZ/Lab5;
addpath f:/matlab_pro/GWSC22-Team1/LWZ/Lab4;

% load data
    %load('TrainingData.mat');
    %load('analysisData.mat');
    load('TrainingDataTF.mat');
    load('AnalysisDataTF.mat');
%noise psd calculate
    [pxx,f]=pwelch(trainData,sampFreq/2,[],[],sampFreq);%get psd of noise
    %soomth psd of noise
    smthpara=10;
    smthb=ones(1,smthpara)/smthpara;
    pxxsmth=filtfilt(smthb,1,pxx);

    figure;
    plot(f,pxx);
    figure;
    plot(f,pxxsmth);
    
    
%data analysis
    nsamp=length(dataVec);
    timevec=(0:(nsamp-1))/sampFreq;
    noisePSD = @(freq) interp1(f,pxxsmth,freq);
    
    dataX=timevec;
    dataY=dataVec;
    rmin=[40,1,1];
    rmax=[100,50,15];

    figure;
    plot(dataX,dataY);
    
 nRuns = 8;   
% Input parameters for CRCBQCHRPPSO
inParams = struct('dataX', dataX,...
                  'dataY', dataVec,...
                  'dataXSq',dataX.^2,...
                  'dataXCb',dataX.^3,...
                  'psdfun', noisePSD,...
                  'rmin',rmin,...
                  'rmax',rmax);
% CRCBQCHRPPSO runs PSO on the CRCBQCHRPFITFUNC fitness function. As an
% illustration of usage, we change one of the PSO parameters from its
% default value.
outStruct = crcbqcpso_colpsd(inParams,struct('maxSteps',2000),nRuns);

%%
outy=dataY;
outs=outStruct.bestSig;
%outn=outy-outs;
figure;
plot(dataX,outy); hold on;
plot(dataX,outs);

nSamples = length(dataX);
dataLen = nSamples/sampFreq;
kNyq = floor(nSamples/2)+1;
posFreq = (0:(kNyq-1))*(1/dataLen);
psdPosFreq=interp1(f,pxxsmth,posFreq);
outSNR=sqrt(innerprodpsd(outs,outs,sampFreq,psdPosFreq));

disp('SNR:');
disp(outSNR);

%%
% Plots
figure;
hold on;
plot(dataX,dataY,'.');

for lpruns = 1:nRuns
    plot(dataX,outStruct.allRunsOutput(lpruns).estSig,'Color',[51,255,153]/255,'LineWidth',4.0);
end
plot(dataX,outStruct.bestSig,'Color',[76,153,0]/255,'LineWidth',2.0);
legend('Data','Signal',...
       ['Estimated signal: ',num2str(nRuns),' runs'],...
       'Estimated signal: Best run');
disp(['Estimated parameters: a1=',num2str(outStruct.bestQcCoefs(1)),...
                             '; a2=',num2str(outStruct.bestQcCoefs(2)),...
                             '; a3=',num2str(outStruct.bestQcCoefs(3))]);


   