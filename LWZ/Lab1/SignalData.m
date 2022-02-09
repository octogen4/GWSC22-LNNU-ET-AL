classdef SignalData
   properties
       maxFreq;
       samplFreq;
       timeVec;
       sigVec;
   end
   
   methods
       function sd = SignalData(maxFreq,samplFreq,timeVec,sigVec)
           sd.maxFreq=maxFreq;
           sd.samplFreq=samplFreq;
           sd.timeVec=timeVec;
           sd.sigVec=sigVec;
       end
   end
        
end