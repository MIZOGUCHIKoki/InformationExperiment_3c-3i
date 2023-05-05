clear;
Fs = 16000;
f = 440;
t = (0:2*Fs-1) /Fs;
phi1 = pi/4;
phi2 = pi/2;

y1=0;
y2=0;
y3=0;
y4=0;
% 矩形波
for k = 1:50
    y1 = y1 + 1/(2*k-1) * sin(2*pi*f*(2*k-1)*t);
    y2 = y2 + 1/(2*k-1) * sin(2*pi*f*(2*k-1)*t+phi1);
    y3 = y3 + 1/(2*k-1) * sin(2*pi*f*(2*k-1)*t+phi2);
    y4 = y4 + 1/(2*k-1) * sin(2*pi*f*(2*k-1)*t+rand);
end

sound(y1,Fs);
pause(3);
sound(y2,Fs);
pause(3);
sound(y3,Fs);
pause(3);
sound(y4,Fs);
pause(3);

fig0 = figure;
plot(t,y1);
xlabel('time[s]');
ylabel('amplitude');
axis([0 0.01 -3 3]);
exportgraphics(fig0,'../Figures/03_11_kukei.pdf','ContentType','vector');

fig1 = figure;
plot(t,y2);
xlabel('time[s]');
ylabel('amplitude');
axis([0 0.01 -3 3]);
exportgraphics(fig1,'../Figures/03_12.pdf','ContentType','vector');

fig2 = figure;
plot(t,y3);
xlabel('time[s]');
ylabel('amplitude');
axis([0 0.01 -3 3]);
exportgraphics(fig2,'../Figures/03_13.pdf','ContentType','vector');

fig3 = figure;
plot(t,y4);
xlabel('time[s]');
ylabel('amplitude');
axis([0 0.01 -3 3]);
exportgraphics(fig3,'../Figures/03_14.pdf','ContentType','vector');