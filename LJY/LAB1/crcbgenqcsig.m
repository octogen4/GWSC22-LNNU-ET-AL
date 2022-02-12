
 function sigVec = crcbgenqcsig(dataX,snr,qcCoefs)
 
phaseVec = qcCoefs(1)*dataX + qcCoefs(2)*dataX.^2;
sigVec = sin(2*pi*phaseVec+qcCoefs(3));
sigVec = snr*sigVec/norm(sigVec);

 end