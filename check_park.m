function [x] = check_park(Xc,Yc,ym,xmax,Xm,Ym)
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

if Yc < Ym
    if (abs(Xc) < xmax)&&(abs(Xc) > Xm)
        %��Ҫ�����ж�y���꣬��Ϊ�ɵ���������һ�����ͼ��
        if Yc > ym(length(ym)) 
            %yֵ���ڿ�����ľ�������
            disp('���Ե���');
            parking(Xc,Yc,R,Lc,DR,W);
        else
            %�ٴ��ж�y�Ƿ���ڻ�������
            if Yc > -(sqrt((R-W/2-safe_dis).^2-(abs(Xc)-P2x).^2)-R-P2y);
                %y���ڻ���Լ�����Ϸ�
                disp('���Ե���');
                parking(Xc,Yc,R,Lc,DR,W);
            else
                disp('���복λ�����������¹滮');
            end
        end
    else
        if abs(Xc) > xmax
            disp('���복λ��Զ�������¹滮');
        end
        if abs(Xc) < Xm
            disp('���복λ�����������¹滮');
        end
    end
else
    disp('���복λ��Զ����Ҫ��ʻ������λ���¹滮');
end
end

