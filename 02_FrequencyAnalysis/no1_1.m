clear;

Fs = 8192;
t = (0:(Fs-1)) / Fs;
f = 440;
fs = (-Fs/2 : Fs/1024 : (Fs/2) - Fs/1024);
y = sin(2*pi*f*t);

fft_y = fft(y,1024);
ln = length(abs(fftshift(fft(y))));
fft_ys = fftshift(fft_y);
fft_ys = abs(fft_ys);
fig0 = figure;
plot(fs,fft_ys);
xlabel('frequency[Hz]');
ylabel('|amplitude|');
axis([0 1000 -10 600]);
exportgraphics(fig0,'../Figures/02_01.pdf','ContentType','vector');