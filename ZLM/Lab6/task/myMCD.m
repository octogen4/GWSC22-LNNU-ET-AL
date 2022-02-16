% load data
    load('TrainingData.mat');
    load('analysisData.mat');
%noise psd calculate
    [pxx,f]=pwelch(trainData,sampFreq/2,[],[],sampFreq);%get psd of noise
    %soomth psd of noise
    smthpara=10;
    smthb=ones(1,smthpara)/smthpara;
    pxxsmth=filtfilt(smthb,1,pxx);


%data analysis
    nsamp=length(dataVec);
    timevec=(0:(nsamp-1))/sampFreq;
    % get dft of psd
        kNy=floor(nsamp/2)+1;
        posFreq=(0:(kNy-1))*sampFreq/nsamp;% total time=nsamp*1/sampFreq. thus, posFreq(frequency that is positive)=1/totaltime=sampFreq/nsamp
        noisepsd=interp1(f,pxxsmth,posFreq);
    % parameter estimate
        inpara=struct('dataX',timevec, ...
                      'dataY',dataVec, ...
                      'dataXSq',timevec.^2, ...
                      'dataXCb',timevec.^3, ...
                      'sampFreq',sampFreq, ...
                      'psd',noisepsd, ...
                      'rmin',[40,1,1], ... % the min value of each para
                      'rmax',[100,50,15]);  % the max value of each para
                      
    
    % setting machine
        nruns=8;
        maxsteps=2000;
    % calculate
        outstruct=glrtqcpso(inpara,struct('maxSteps',maxsteps),nruns);
%rusult show and realize
    figure;
    hold on
    plot(timevec,dataVec,'.');
    
    for lpruns=1:nruns
        plot(timevec,outstruct.allRunsOutput(lpruns).estSig,'color',[51,255,153]/255,'LineWidth',4.0);
    end
    plot(timevec,outstruct.bestSig,'Color',[76,153,0]/255,'LineWidth',2.0);
    disp(['Estimated parameters: a1=',num2str(outstruct.bestQcCoefs(1)),...
                                 '; a2=',num2str(outstruct.bestQcCoefs(2)),...
                                 '; a3=',num2str(outstruct.bestQcCoefs(3))]);
    


