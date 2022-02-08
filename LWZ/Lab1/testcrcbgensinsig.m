%% Plot the sin signal
% Signal parameters
f0=0.5;
phi0=60;
A = 10;
% Instantaneous frequency after 1 sec is 
maxFreq = 2*pi*f0+phi0;
samplFreq = 5*maxFreq;
samplIntrvl = 1/samplFreq;

% Time samples
timeVec = 0:samplIntrvl:1.0;
% Number of samples
nSamples = length(timeVec);

% Generate the signal
sigVec = crcbgensinsig(timeVec,A,[f0,phi0]);

%Plot the signal 
figure;
plot(timeVec,sigVec,'Marker','.','MarkerSize',24);
