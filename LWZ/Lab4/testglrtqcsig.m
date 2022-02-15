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

%% Compute GLRT
%Generate the unit norm signal (i.e., template). Here, the value used for
%'A' does not matter because we are going to normalize the signal anyway.
%Note: the GLRT here is for the unknown amplitude case, that is all other
%signal parameters are known
%sigVec = crcbgenqcsig(timeVec,A,[a1,a2,a3]);
%We do not need the normalization factor, just the  template vector
%[templateVec,~] = normsig4psd(sigVec,sampFreq,psdPosFreq,1);
% Calculate inner product of data with template
%llr = innerprodpsd(dataVec,templateVec,sampFreq,psdPosFreq);
%GLRT is its square
%llr = llr^2;

llr = glrtqcsig(dataVec,sampFreq,noisePSD,[a1, a2, a3]);

disp(llr);
figure;
plot(timeVec,dataVec); hold on;
plot(timeVec,templateVec);

figure;
[S,F,T] = spectrogram(dataVec,64,60,[],sampFreq);
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)')
ylabel('Frequency (Hz)');


