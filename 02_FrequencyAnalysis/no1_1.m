clear all;
clc;

Fs = 8192;
t = [0:(Fs-1)] / Fs;
f = 440;
fs=[-Fs/2:Fs/1024:(Fs/2)-Fs/1024];
y = sin(2*pi*f*t);


y = y(1,1:1024);
fft_y = fft(y);
ln = length(abs(fftshift(fft(y))));
figure;
plot(fs,fft_y);
title('ftt');
xlabel('周波数');

fft_ys = fftshift(fft_y);
figure;
plot(fs,fft_ys);
title('fttshift');
xlabel('周波数');


fft_ys = abs(fft_ys);
figure;
plot(fs,fft_ys);
title('abs');
xlabel('周波数');
axis([-1000 1000 -10 600]);