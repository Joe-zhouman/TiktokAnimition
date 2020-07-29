clc,clear,close all
r0 = 20;
r1 = 40;
r2 = 15;
lineWidth = 2;
hh = figure;
xSun = @(t)(-cos(2*pi/365*t));
ySun = @(t)(-sin(2*pi/365*t));
xMars = @(t)(1.5237*cos(2*pi/686.98*t)-cos(2*pi/365*t));
yMars = @(t)(1.5237*sin(2*pi/686.98*t)-sin(2*pi/365*t));

hold on
earth=line(0,0,'color','b','marker','.','markersize',r0,'LineWidth',lineWidth);
sun=line(xSun(0),ySun(0),'color','r','marker','.','markersize',r1,'LineWidth',lineWidth);
mars=line(xMars(0),yMars(0),'color','y','marker','.','markersize',r2,'LineWidth',lineWidth);
axis([-2.5,2.5,-2.5,2.5]);
axis off
sunline=line(xSun(0),ySun(0),'linestyle','-.','color','r','markersize',8,'LineWidth',lineWidth);
marsline=line(xMars(0),yMars(0),'linestyle','--','color','y','markersize',4,'LineWidth',lineWidth);

for t=1:1:10000
    set(sun,'xdata',xSun(t),'ydata',ySun(t));
    set(mars,'xdata',xMars(t),'ydata',yMars(t));
    
    set(sunline,'xdata',xSun(1:t),'ydata',ySun(1:t));
    set(marsline,'xdata',xMars(1:t),'ydata',yMars(1:t));
    
    drawnow
end