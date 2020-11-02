function [x] = check_park(Xc,Yc,ym,xmax,Xm,Ym)
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

if Yc < Ym
    if (abs(Xc) < xmax)&&(abs(Xc) > Xm)
        %需要二次判断y坐标，因为可倒车区域是一个组合图形
        if Yc > ym(length(ym)) 
            %y值落在可行域的矩形区域
            disp('可以倒车');
            parking(Xc,Yc,R,Lc,DR,W);
        else
            %再次判断y是否大于弧形区域
            if Yc > -(sqrt((R-W/2-safe_dis).^2-(abs(Xc)-P2x).^2)-R-P2y);
                %y落在弧形约束线上方
                disp('可以倒车');
                parking(Xc,Yc,R,Lc,DR,W);
            else
                disp('距离车位过近，请重新规划');
            end
        end
    else
        if abs(Xc) > xmax
            disp('距离车位过远，请重新规划');
        end
        if abs(Xc) < Xm
            disp('距离车位过近，请重新规划');
        end
    end
else
    disp('距离车位过远，需要驾驶靠近车位重新规划');
end
end

