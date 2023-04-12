clear all;
clc;

Fs = 8192;
t = [0:2*(Fs-1)] / Fs;
f = 440;

y = sin(2*pi*f*t);

% figure;
% plot(t,y);
% axis([0 2/f -3 3]);

y = y(1,1:1024);
fft_y = fft(y);