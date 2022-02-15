function npsd=itpLIGOpsd(freqVec)

y = load('iLIGOSensitivity.txt');
y1=y(:,1);
y2=y(:,2);

y1=y1';
y2=y2';
y1=[0 y1];
y2=[y2(1) y2];

if freqVec(end)>700
    error('Error: signal frequency out of range');
end

sensVec = interp1(y1, y2, freqVec);

bmap1=freqVec<40;
bmap2=freqVec>700;
id1=sum(bmap1)+1;
id2=length(freqVec)-sum(bmap2);
sensVec(bmap1)=sensVec(id1);
sensVec(bmap2)=sensVec(id2);

npsd=sensVec.^2/2;

end




