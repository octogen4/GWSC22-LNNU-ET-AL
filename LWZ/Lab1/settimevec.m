function timeVec = settimevec(samplFreq, startTime,endTime)
    samplIntrvl = 1/samplFreq;
    timeVec=startTime:samplIntrvl:endTime;
end