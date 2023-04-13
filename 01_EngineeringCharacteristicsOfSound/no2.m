clear all;
clc;
Fs = 16000; % 
f1 = 440;   % [Hz]

t1 = [0:(Fs-1)] /Fs;
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
sound(y1,Fs); % 基本
pause(3)
sound(y2,Fs); % pi/2
pause(3)
sound(y3,Fs); % pi
pause(3)
sound(y4,Fs); % 0.5倍
pause(3)
sound(y5,Fs); % 0.25倍

figure;
subplot(5,1,1)
plot(t1,y1);
% xticks(0:1/f1:1);
title('Base');
xlabel('time[s]');
ylabel('waveform');
axis([0 0.01 -1.01 1.01])

subplot(5,1,2)
plot(t1,y2);
% xticks(0:1/f1:1);
title('位相 pi/2');
xlabel('time[s]');
ylabel('waveform');
axis([0 0.01 -1.01 1.01])

subplot(5,1,3)
plot(t1,y3);
% xticks(0:1/f1:1);
title('位相 pi');
xlabel('time[s]');
ylabel('waveform');
axis([0 0.01 -1.01 1.01])

subplot(5,1,4)
plot(t1,y4);
% xticks(0:1/f1:1);
yticks(-1:0.25:1);
title('振幅 1/2');
xlabel('time[s]');
ylabel('waveform');
axis([0 0.01 -0.5 0.5])

subplot(5,1,5)
plot(t1,y5);
% xticks(0:1/f1:1);
title('振幅 1/4');
yticks(-1:0.25:1);
xlabel('time[s]');
ylabel('waveform');
axis([0 0.01 -0.25 0.25])