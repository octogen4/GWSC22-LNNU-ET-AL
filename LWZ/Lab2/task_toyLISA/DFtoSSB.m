function vSSB = DFtoSSB(vDF,ang)

LISAtiltang=pi/3;
% Rotate by 60 degrees
RotMat1=[ 1, 0, 0
         0,cos(LISAtiltang), -sin(LISAtiltang)
         0,sin(LISAtiltang), cos(LISAtiltang)  ];
     
vDFR=RotMat1*vDF';

% SSB Frame
RotMat2=[ cos(ang),-sin(ang),0
          sin(ang),cos(ang),0
          0      ,   0     , 1];

vSSB=RotMat2*vDFR;
vSSB=vSSB';
end