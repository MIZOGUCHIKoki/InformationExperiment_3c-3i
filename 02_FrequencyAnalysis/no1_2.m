clear;

Fs = 8192;
t = (0 : 4*(Fs-1)) / Fs;
f = 440;
fs = (-Fs/2 : Fs/(128*2*4) : (Fs/2)-Fs/(128*2*4));

y_0 = zeros(1,128);
y_1 = ones(1,128);

y = [y_0 y_1];
y = [y y y y];
figure;
xlabel('点[個]');
ylabel('振幅');
plot(y);
axis([0 1024 0 1.5]);

fft_y = fft(y);
ln = length(abs(fftshift(fft(y))));
fft_ys = fftshift(fft_y);
fft_ys = abs(fft_ys);
figure;
plot(fs,fft_ys);
xlabel('周波数');
ylabel('振幅');
axis([0 200 -10 1000]);