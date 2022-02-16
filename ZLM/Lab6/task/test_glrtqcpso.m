addpath ../../SIGNALS
addpath ../../NOISE
addpath ../../DETEST
addpath ../../../SDMBIGDAT19/CODES

%% ������������������ʣ�����������
nSamples = 512;  %��������
sampFreq = 512; % ������
timeVec = (0:(nSamples-1))/sampFreq;  %ÿһ���������Ӧ��ʱ�������


%% Ԥ����
dataLen = nSamples/sampFreq;  %������ʱ��
kNyq = floor(nSamples/2)+1;  %������������Ƶ��
posFreq = (0:(kNyq-1))*(1/dataLen);  %��Ƶ��


%% ģ������
%����
psdFunc = @(f) (f>=50 & f<=100).*(f-50).*(100-f)/625 + 1;
psdPosFreq = psdFunc(posFreq);  %��Ƶpsd
noiseVec = statgaussnoisegen(nSamples,[posFreq(:),psdPosFreq(:)],100,sampFreq);    %��������

%�ź�
snr = 10;
a1 = 3;
a2 = 2;
a3 = 5;
sigVec = crcbgenqcsig(timeVec,snr,[a1,a2,a3]);   %�ź�����
[sigVec,~]=normsig4psd(sigVec,sampFreq,psdPosFreq,snr);  %���źŰ���ָ����snr���й�һ��

%��ϳ����յ�ģ������
dataY = noiseVec + sigVec;


%% ͨ��pso����ָ���Ĳ����ռ���������Сfitness�����ж�Σ�
%��fitness function����Ĳ���
inParams = struct( 'rmin',         [1,1,1],        ...  %��������a1��a2��a3����Сֵ��ɵ�����
                    'rmax',         [60,20,10],    ...
                    'dataX',        timeVec,        ...
                    'dataXSq',      timeVec.^2,     ...
                    'dataXCb',      timeVec.^3,     ...
                    'sampFreq',     sampFreq,       ...  %������
                    'psd',   psdPosFreq,     ...  %��Ƶpsd
                    'dataY',        dataY         ...  %ģ������
                   );
               
%�����ܹ�8�ε����н������ѡ��������Ž���ɹ���ȡ
finalResult = glrtqcpso(inParams,struct('maxSteps',2000), 5);  

%% ��ͼ
figure
hold on
plot(timeVec,dataY, '.','MarkerSize',12, 'Color',[78, 110, 242]/255  )
plot(timeVec,sigVec,'LineWidth',3, 'Color',[221, 80, 68]/255)
plot(timeVec,finalResult.bestSig,'LineWidth',3, 'Color',[38, 37, 36]/255)
legend('data','signal','BestSignal')
xlabel('time (s)')
hold off

disp(finalResult.bestQcCoefs)