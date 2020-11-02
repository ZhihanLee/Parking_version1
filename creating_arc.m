clc;
clear all;
close all;
%�������
Rw =3.5; %���������
R = 4.5; %�趨��ת��뾶���Դ���Rmin��
L = 2.15; %���
W = 1.67; %����
safe_dis = 0.1; %��ȫ����
Lc = 3.2; %����
DR = 0.5; %����
%����ϵ�Գ�����е�Ϊԭ�㣬�����2.5�ף���5��
P1x = -1.25; P1y = 0;P2x = 1.25; P2y = 0; P3x= -1.25; P3y = -5; P4x = 1.25; P4y = -5; %�����Ľ�����

%������������
for i=1:2:50
    P(1,i) = 0; % 0 axis
    P(2,i) = -i/10; % y axis
end
%����λ
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
%����������
for i = 1:2:50
    plot(P(1,i),P(2,i),'r.');
    hold on
end
axis equal;

%x�᷽��Լ��
Xm = sqrt((R+W/2)^2+(DR)^2) - safe_dis + P1x;
disp(['Xm��',num2str(Xm)]); 
%y�᷽��Լ��
Ym = -(sqrt((Lc-DR)^2+(R+W/2)^2) - safe_dis - P2y - R -Rw*2);
%x,y˫��Լ��
xmax = sqrt((R-W/2-safe_dis)^2-(R-Ym+P2y)^2)+P2x;
xm = Xm:0.001:xmax ;
ym = -(sqrt((R-W/2-safe_dis).^2-(xm-P2x).^2)-R-P2y);
ymin = -(sqrt((R-W/2-safe_dis).^2-(Xm-P2x).^2)-R-P2y);%���ߵ����·�
disp([num2str(ymin),'��Ym��',num2str(Ym)]);
%���ƿ���ⷶΧ
plot(xm,ym,'color','r','linewidth',0.5) %˫��Լ����
line([xmax xmax],[ym(length(ym)),Ym],'color','r','linewidth',0.5); %˫��Լ���߲��䷶Χ(�յ���Сת��뾶Ӱ��)
line([Xm Xm],[ym(1) Ym],'color','r','linewidth',0.5); 
line([Xm xmax],[Ym Ym],'color','r','linewidth',0.5);
%���ڳ��������߶ԳƵĿ���ⷶΧ
plot(-xm,ym,'color','r','linewidth',0.5) %˫��Լ����
line([-xmax -xmax],[ym(length(ym)),Ym],'color','r','linewidth',0.5);
line([-Xm -Xm],[ym(1) Ym],'color','r','linewidth',0.5);
line([-Xm -xmax],[Ym Ym],'color','r','linewidth',0.5);

%������ʼ������
%���峵�������е�����Xc��Yc
Xc = str2num(input('���복�����������Xֵ:','s'));
Yc = str2num(input('���복�����������Yֵ:','s'));
check_park(Xc,Yc,ym,xmax,Xm,Ym);





