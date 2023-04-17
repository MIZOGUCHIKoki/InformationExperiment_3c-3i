clear all;
clc;

Fs = 8192;
t = [0:4*(Fs-1)] / Fs;
f = 440;
fs = [-Fs/2:Fs/(128*2*4):(Fs/2)-Fs/(128*2*4)];

y_0 = zeros(1,128);
y_1 = ones(1,128);

y = [y_0 y_1];
for k=1:2
    y = [y y];
end
plot(y);

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
axis([0 200 -10 1000]);