y = load('iLIGOSensitivity.txt');
figure;
loglog(y(:,1),y(:,2));
% y is sqrtSn

% Modify the S(f)
id1=0; id2=0;
for i=1:length(y(:,1))
    if y(i,1) <=50 && y(i+1,1)>=50
        id1=i;
        break;
    end
end

for i=1:length(y(:,1))
    if y(i,2) <=700 && y(i+1,1)>=700
        id2=i;
        break;
    end
end

for i=1:id1
    y(i,2)=y(id1,2);
end

for i=id2:length(y(:,1))
    y(i,2)=y(id2,2);
end

figure;
semilogy(y(:,1),y(:,2));


        