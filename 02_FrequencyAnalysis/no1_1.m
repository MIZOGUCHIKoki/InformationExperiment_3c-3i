clear;

Fs = 8192;
t = (0:(Fs-1)) / Fs;
f = 440;
fs = (-Fs/2 : Fs/1024 : (Fs/2) - Fs/1024);
y = sin(2*pi*f*t);

fft_y = fft(y,1024);
ln = length(abs(fftshift(fft(y))));
figure;
plot(fs,fft_y);
title('ftt');
xlabel('周波数');
ylabel('振幅');

fft_ys = fftshift(fft_y);
figure;
plot(fs,fft_ys);
title('fttshift');
xlabel('周波数');
ylabel('振幅');


fft_ys = abs(fft_ys);
figure;
plot(fs,fft_ys);
title('振幅スペクトル');
xlabel('周波数');
ylabel('振幅');
axis([-1000 1000 -10 600]);