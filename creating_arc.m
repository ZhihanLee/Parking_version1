clc;
clear all;
close all;
%物理参数
Rw =3.5; %单车道宽度
R = 4.5; %设定的转弯半径（略大于Rmin）
L = 2.15; %轴距
W = 1.67; %车宽
safe_dis = 0.1; %安全距离
Lc = 3.2; %车长
DR = 0.5; %后悬
%坐标系以车库口中点为原点，车库宽2.5米，深5米
P1x = -1.25; P1y = 0;P2x = 1.25; P2y = 0; P3x= -1.25; P3y = -5; P4x = 1.25; P4y = -5; %车库四角坐标

%定义理想入库点
for i=1:2:50
    P(1,i) = 0; % 0 axis
    P(2,i) = -i/10; % y axis
end
%画车位
x = [P1x P2x P3x P4x];
y = [P1y P2y P3y P4y];
line([P1x P3x],[P1y P3y],'linewidth',1);
line([P3x P4x],[P3y P4y],'linewidth',1);
line([P4x P2x],[P4y P2y],'linewidth',1);
line([P1x -10],[P1y 0],'linewidth',1);
line([P2x 10],[P2y 0],'linewidth',1);
line([-10 10],[2*Rw 2*Rw],'linewidth',1);
line([-10 10],[Rw Rw],'linewidth',1,'linestyle','--')
hold on
%画理想入库点
for i = 1:2:50
    plot(P(1,i),P(2,i),'r.');
    hold on
end
axis equal;

%x轴方向约束
Xm = sqrt((R+W/2)^2+(DR)^2) - safe_dis + P1x;
disp(['Xm≥',num2str(Xm)]); 
%y轴方向约束
Ym = -(sqrt((Lc-DR)^2+(R+W/2)^2) - safe_dis - P2y - R -Rw*2);
%x,y双向约束
xmax = sqrt((R-W/2-safe_dis)^2-(R-Ym+P2y)^2)+P2x;
xm = Xm:0.001:xmax ;
ym = -(sqrt((R-W/2-safe_dis).^2-(xm-P2x).^2)-R-P2y);
ymin = -(sqrt((R-W/2-safe_dis).^2-(Xm-P2x).^2)-R-P2y);%弧线的最下方
disp([num2str(ymin),'≤Ym≤',num2str(Ym)]);
%绘制可入库范围
plot(xm,ym,'color','r','linewidth',0.5) %双向约束线
line([xmax xmax],[ym(length(ym)),Ym],'color','r','linewidth',0.5); %双向约束线补充范围(收到最小转向半径影响)
line([Xm Xm],[ym(1) Ym],'color','r','linewidth',0.5); 
line([Xm xmax],[Ym Ym],'color','r','linewidth',0.5);
%关于车库中轴线对称的可入库范围
plot(-xm,ym,'color','r','linewidth',0.5) %双向约束线
line([-xmax -xmax],[ym(length(ym)),Ym],'color','r','linewidth',0.5);
line([-Xm -Xm],[ym(1) Ym],'color','r','linewidth',0.5);
line([-Xm -xmax],[Ym Ym],'color','r','linewidth',0.5);

%输入起始倒车点
%定义车辆后轴中点坐标Xc和Yc
Xc = str2num(input('输入车辆倒车坐标点X值:','s'));
Yc = str2num(input('输入车辆倒车坐标点Y值:','s'));
check_park(Xc,Yc,ym,xmax,Xm,Ym);





