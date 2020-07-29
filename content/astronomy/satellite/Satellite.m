clc,clear,close all
%define some variable to describe the solar system
lineWidth = 2;
x0=0;y0=0;r0=80;Lmin0=0;Lmax0=0;T0=2160;w0=0*pi/T0;q0=0;
x1=0;y1=0;r1=40;Lmin1=25;Lmax1=30;T1=1080;w1=pi/T1;q1=0;
x2=0;y2=0;r2=20;Lmin2=8;Lmax2=10;T2=180;w2=pi/T2;q2=0;
r3=10;Lmin3=3;Lmax3=5;T3=30;w3=pi/T3;q3=0;
%end
%name the figure
hh=figure('numbertitle','off','name','Solar System by Joe zhouman','Color',[0.1 0.1 0.1]);
%end
%show the sun,the moon ,the earth and the satellite
sun=line(0,0,'color','r','marker','.','markersize',r0,'LineWidth',lineWidth);
earth=line(x0,y0,'color','b','marker','.','markersize',r1,'LineWidth',lineWidth);
moon=line(x1,y1,'color','y','marker','.','markersize',r2,'LineWidth',lineWidth);
satellite=line(x2,y2,'color','g','marker','.','markersize',r3,'LineWidth',lineWidth);
%end
axis off
%show the title
title('卫星绕日运动','fontname','等线light','FontSize',12,'FontWeight','normal','Color','yellow');
%end
%legends
text(-50,50,'太阳','fontname','等线light','Color','yellow');
line(-55,50,'color','r','marker','.','markersize',r0,'LineWidth',lineWidth);
text(-50,40,'地球','fontname','等线light','Color','yellow');
line(-55,40,'color','b','marker','.','markersize',r1,'LineWidth',lineWidth);
text(-50,30,'月球','fontname','等线light','Color','yellow');
line(-55,30,'color','y','marker','.','markersize',r2,'LineWidth',lineWidth);
text(-50,20,'卫星','fontname','等线light','Color','yellow');
line(-55,20,'color','g','marker','.','markersize',r3,'LineWidth',lineWidth);
text(33,50,'月球轨迹','fontname','等线light','Color','yellow');
line([25 32.5],[50 50],'linestyle','-.','color','r','markersize',8,'LineWidth',lineWidth);
text(33,40,'卫星轨迹','fontname','等线light','Color','yellow');
line([25 32.5],[40 40],'linestyle','--','color','b','markersize',4,'LineWidth',lineWidth);
text(33,30,'地球轨迹','fontname','等线light','Color','yellow');
line([25 32.5],[30 30],'linestyle',':','LineWidth',lineWidth);
%end
%draw the trace of the earth
s1=0:.01:2*pi;
line(Lmax1*cos(s1),Lmin1*sin(s1),'linestyle',':','LineWidth',lineWidth);
%end
%intelazation of the variables
x0=Lmax0*cos(q0);y0=Lmin0*sin(q0);
x1=x0+Lmax1*cos(q1);y1=y0+Lmin1*sin(q1);
x2=x1+Lmax2*cos(q2);y2=y1+Lmin2*sin(q2);
x3=x2+Lmax3*cos(q3);y3=y2+Lmin3*sin(q3);
mlx=x2;mly=y2;
slx=x3;sly=y3;
%end
%draw the trace of the moon and the satellite
moonline=line('xdata',mlx,'ydata',mly,'linestyle','-.','color','r','markersize',8,'LineWidth',lineWidth);
satelliteline=line('xdata',slx,'ydata',sly,'linestyle','--','color','b','markersize',4,'LineWidth',lineWidth);
t=0;
%show the current time 
termtxt=text(-15,-40,['T=' num2str(t*4,'%5.5d') '  hours'],'fontsize',20,'color','r','fontname','等线light');
%end

%one TERM
%end
axis([-60,60,-60,60]);
%if you want to be running forever,comment the codes below till the next matching %end
TERM=2400;%time of the animation you want to show
filep = mfilename('fullpath'); 
[pathstr,namestr]=fileparts(filep);
v = VideoWriter([pathstr,'\satellite.avi']);
open(v);
for t=1:TERM
    %safe quit
    if not(ishandle(hh))
        return
    end
    %end
    %evaluation the variables
    q0=t*w0;q1=t*w1;q2=t*w2;q3=t*w3;
    x0=Lmax0*cos(q0);y0=Lmin0*sin(q0);
    x1=x0+Lmax1*cos(q1);y1=y0+Lmin1*sin(q1);
    x2=x1+Lmax2*cos(q2);y2=y1+Lmin2*sin(q2);
    x3=x2+Lmax3*cos(q3);y3=y2+Lmin3*sin(q3);
    mlx=[mlx x2];mly=[mly y2];
    slx=[slx x3];sly=[sly,y3];
    %end
    %set the mark form the sun to the satellite
    set(sun,'xdata',x0,'ydata',y0);
    set(earth,'xdata',x1,'ydata',y1);
    set(moon,'xdata',x2,'ydata',y2);
    set(satellite,'xdata',x3,'ydata',y3);
    %end
    %set the trace of the moon and the satellite
    set(moonline,'xdata',mlx,'ydata',mly);
    set(satelliteline,'xdata',slx,'ydata',sly);
    %end
    %set the string to show
    set(termtxt,'string',['绕日时间 :' num2str(t*4,'%5.5d') '  hours']);
    location=100*sin(pi/50*t);
    textcolor='rgbcmykw';
    
    %end
    drawnow
    %get the frame for output
    frame=getframe(hh);
    writeVideo(v,frame);
    %end
end
close(v);
%end
%output the gif

% filename = [pathstr,'solar_system_by_joe_zhouman.gif'];%ceate the file
% for idx=1:TERM
%     [A,map]=rgb2ind(im{t},256);
%     if idx == 1
%         imwrite(A,map,filename,'gif','LoopCount',0,'DelayTime',0.01);
%     else
%         imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',0.01);
%     end
% end
%end
%run forever
%if you don't want to do that,comment it till the next matching %end
%{
while 1
    if not(ishandle(hh))
        return,
    end
    q0=t*w0;q1=t*w1;q2=t*w2;q3=t*w3;t=t+1;
    if t>=4500
        t=0;
    end
    x0=Lmax0*cos(q0);y0=Lmin0*sin(q0);
    x1=x0+Lmax1*cos(q1);y1=y0+Lmin1*sin(q1);
    x2=x1+Lmax2*cos(q2);y2=y1+Lmin2*sin(q2);
    x3=x2+Lmax3*cos(q3);y3=y2+Lmin3*sin(q3);
    mlx=[mlx x2];mly=[mly y2];
    slx=[slx x3];sly=[sly,y3];
    set(sun,'xdata',x0,'ydata',y0);
    set(earth,'xdata',x1,'ydata',y1);
    set(moon,'xdata',x2,'ydata',y2);
    set(satellite,'xdata',x3,'ydata',y3);
    set(moonline,'xdata',mlx,'ydata',mly);
    set(satelliteline,'xdata',slx,'ydata',sly);
    drawnow  
end
%}
%end