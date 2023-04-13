clear all;
clc;
Fs = 16000; % 
f1 = 440;   % [Hz]
f2 = 660;   % [Hz]

t1 = [0:(Fs-1)] /Fs;
y1 = sin(2*pi*f1*t1);

t2 = [0:(Fs-1)] /Fs;
y2 = sin(2*pi*f2*t2);

sound(y1,Fs);
pause(3)
sound(y2,Fs);

figure;
subplot(2,1,1)
plot(t1,y1);
xticks(0:1/f1:1);
title('440[Hz]');
xlabel('time[s]');
ylabel('waveform');
axis([0 3/f1 -1.01 1.01])

subplot(2,1,2)
plot(t2,y2);
xticks(0:1/f2:1);
title('660[Hz]');
xlabel('time[s]');
ylabel('waveform');
axis([0 3/f1 -1.01 1.01])
