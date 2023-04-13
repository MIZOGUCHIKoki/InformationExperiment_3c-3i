clear all;
clc;

Fs = 8192;
t = [0:(Fs-1)] / Fs;
f = 440;

y = sin(2*pi*f*t);


y = y(1,1:1024);
fft_y = fft(y);
fft_ys = fftshift(fft_y);
fft_ys = abs(fft_ys);
fs=[-Fs/2:Fs/1024:(Fs/2)-1];
plot(fs,fft_ys);
xlabel('周波数');
axis([-1000 1000 0 600]);