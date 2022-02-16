%% Calculate GLRT for Quadratic chirp signal 
% Generalized Likelihood ratio test (GLRT) for a quadratic chirp when only
% the amplitude is unknown.

%%
% We will reuse codes that have already been written.
% Path to folder containing signal and noise generation codes.
addpath f:/matlab_pro/GWSC22-Team1/LWZ/Lab3
addpath f:/matlab_pro/GWSC22-Team1/LWZ/Lab4/DETEST


%%
% Read data from files
y = load('data1.txt');
dataVec=y';
sampFreq=1024;
%% Supply PSD values
% This is the noise psd we will use.
noisePSD = @(f) (f>=100 & f<=300).*(f-100).*(300-f)/10000 + 1;

%% Generate  data realization 
a1=10;a2=2;a3=3;
glrt_data = glrtqcsig(dataVec,sampFreq,noisePSD,[a1, a2, a3]);

nSamples = length(dataVec);
timeVec = (0:(nSamples-1))/sampFreq;
dataLen = nSamples/sampFreq;
kNyq = floor(nSamples/2)+1;
posFreq = (0:(kNyq-1))*(1/dataLen);
psdPosFreq = noisePSD(posFreq);

val1=0;
val2=0; % significance=val1/val2
trialTime =6000;
for i=1:trialTime
    val2=val2+1;
    h0dataVec = statgaussnoisegen(nSamples,[posFreq(:),psdPosFreq(:)],100,sampFreq);
    glrt_h0 = glrtqcsig(h0dataVec,sampFreq,noisePSD,[a1, a2, a3]);
    if(glrt_h0>glrt_data)
        val1=val1+1;
    end
end

significance = val1/val2;
disp(significance);





