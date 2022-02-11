
% starting positions

sp1_DF0=[1/sqrt(3)*cos(-2*pi/3),1/sqrt(3)*sin(-2*pi/3),0];
sp2_DF0=[1/sqrt(3),1/sqrt(3)*sin(0),0];
sp3_DF0=[1/sqrt(3)*cos(2*pi/3),1/sqrt(3)*sin(2*pi/3),0];

figure;
scatter([sp1_DF0(1),sp2_DF0(1),sp3_DF0(1)],[sp1_DF0(2),sp2_DF0(2),sp3_DF0(2)]);
%plot([sp1_DF0(1),sp2_DF0(1),sp3_DF0(1)],[sp1_DF0(2),sp2_DF0(2),sp3_DF0(2)]);
text(sp1_DF0(1),sp1_DF0(2)-0.05,{1});
text(sp2_DF0(1),sp2_DF0(2)+0.07,{2});
text(sp3_DF0(1),sp3_DF0(2)-0.05,{3});
set(gca,'xlim',[-1,1]);
set(gca,'ylim',[-1,1]);
set(gca,'XAxisLocation','origin');   
set(gca,'YAxisLocation','origin');
title('Starting positions ');

%------------------------------------------------------------------
tlist=0:1:3600*24*365;


figure;
for i=1:length(tlist)
    clf;
    [pv1,pv2,pv3] = posvector(tlist(i));
    pvmat=[pv1' pv2' pv3' pv1'];
    plot3(pvmat(1,:),pvmat(2,:),pvmat(3,:),'Color',[0 1 0],'Linewidth',3); hold on;
    axis([-1 1 -1 1 -1 1]);
    axis square;
    drawnow;
end


