function [x]=parking(Xc,Yc,R,Lc,DR,W)
c = W/2;
b = DR;
a = Lc-DR;
[dis_AM  dis_BM] = deal(sqrt(a^2+c^2)); %定义车辆四个角点到后轴中点M距离dis_XM
[dis_CM  dis_DM] = deal(sqrt(b^2+c^2));
%定义汽车从左前方开始俯视图顺时针遍历四个角点为ABCD
if Xc > 0
    for theta = 0:0.05:pi/2
        xc_d = Xc - R*sin(theta);
        yc_d = Yc - (R - R*cos(theta));
        plot(xc_d,yc_d,'b*');
        xa = xc_d + dis_AM*cos(atan(c/a)+theta); ya = yc_d + dis_AM*sin(atan(c/a)+theta);
        xb = xc_d + dis_AM*cos(theta-atan(c/a)); yb = yc_d + dis_AM*sin(theta-atan(c/a));
        xc = xc_d + dis_CM*cos(pi/2-theta+atan(b/c)); yc = yc_d - dis_CM*sin(pi/2-theta+atan(b/c));
        xd = xc_d - dis_DM*cos(theta-atan(c/b)); yd = yc_d - dis_DM*sin(theta-atan(c/b));
        line([xa xb],[ya yb],'color','b','linewidth',0.5);
        line([xb xc],[yb yc],'color','b','linewidth',0.5);
        line([xc xd],[yc yd],'color','b','linewidth',0.5);
        line([xd xa],[yd ya],'color','b','linewidth',0.5);
        pause(.3)
    end
else
    for theta = 0:0.05:pi/2
        xc_d = Xc + R*sin(theta);
        yc_d = Yc - (R - R*cos(theta));
        plot(xc_d,yc_d,'b*');
        xa = xc_d - dis_AM*cos(atan(c/a)+theta); ya = yc_d + dis_AM*sin(atan(c/a)+theta);
        xb = xc_d - dis_AM*cos(theta-atan(c/a)); yb = yc_d + dis_AM*sin(theta-atan(c/a));
        xc = xc_d - dis_CM*cos(pi/2-theta+atan(b/c)); yc = yc_d - dis_CM*sin(pi/2-theta+atan(b/c));
        xd = xc_d + dis_DM*cos(theta-atan(c/b)); yd = yc_d - dis_DM*sin(theta-atan(c/b));
        line([xa xb],[ya yb],'color','b','linewidth',0.5);
        line([xb xc],[yb yc],'color','b','linewidth',0.5);
        line([xc xd],[yc yd],'color','b','linewidth',0.5);
        line([xd xa],[yd ya],'color','b','linewidth',0.5);
        pause(.3)
    end
end
%直线倒车 
for yc_d = yc_d : -0.2 : -4
        plot(xc_d,yc_d,'b*');
        xa = xc_d + dis_AM*cos(atan(c/a)+theta); ya = yc_d + dis_AM*sin(atan(c/a)+theta);
        xb = xc_d + dis_AM*cos(theta-atan(c/a)); yb = yc_d + dis_AM*sin(theta-atan(c/a));
        xc = xc_d + dis_CM*cos(pi/2-theta+atan(b/c)); yc = yc_d - dis_CM*sin(pi/2-theta+atan(b/c));
        xd = xc_d - dis_DM*cos(theta-atan(c/b)); yd = yc_d - dis_DM*sin(theta-atan(c/b));
        line([xa xb],[ya yb],'color','b','linewidth',0.5);
        line([xb xc],[yb yc],'color','b','linewidth',0.5);
        line([xc xd],[yc yd],'color','b','linewidth',0.5);
        line([xd xa],[yd ya],'color','b','linewidth',0.5);
        pause(.3)
end
    
end
