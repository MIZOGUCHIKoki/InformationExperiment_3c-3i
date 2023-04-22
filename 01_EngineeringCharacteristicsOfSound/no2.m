clear;

Fs = 16000; % 
f1 = 440;   % [Hz]

t1 = (0:(Fs-1)) /Fs;
for k=0:Fs
    y1 = sin(2*pi*f1*t1);
end

p = pi/2;
for k=0:Fs
    y2 = sin(2*pi*f1*t1 + p);
end

p = pi;
for k=0:Fs
    y3 = sin(2*pi*f1*t1 + p);
end

for k=0:Fs
    y4 = 0.5 * sin(2*pi*f1*t1);
end

for k=0:Fs
    y5 = 0.25 * sin(2*pi*f1*t1);
end

ys2 = [y1;y2]';
ys3 = [y1;y3]';
ys4 = [y1;y4]';
ys5 = [y1;y5]';

sound(ys2,Fs); % pi/2
pause(3)
sound(ys3,Fs); % pi
pause(3)
sound(ys4,Fs); % 0.5倍
pause(3)
sound(ys5,Fs); % 0.25倍

fig0 = figure;
hold on;
plot(t1,y1);
plot(t1,y2);
plot(t1,y3);
xlabel('time[s]');
ylabel('amplitude');
axis([0 0.01 -1.01 1.01])
legend({'pure tone','shift by 90 degrees','shift by 180 degrees'},'Location','southwest');
hold off;


fig1 = figure;
hold on;
plot(t1,y1);
plot(t1,y4);
plot(t1,y5);
yticks(-1:0.25:1);
xlabel('time[s]');
ylabel('amplitude');

axis([0 0.01 -1.1 1.1]);
legend({'pure tone','1/2 times amplitude','1/4 times amplitude'},'Location','southwest');
hold off;

exportgraphics(fig1,'../Figures/01_02_1.pdf','ContentType','vector');
exportgraphics(fig0,'../Figures/01_02_2.pdf','ContentType','vector');