clear;
clc;

Fs = 8192;
t = (0 : 0.25*(Fs-1)) /Fs;
t8 = (0 : 2*(Fs)-1) /Fs;

f0 = 261.38;
f1 = 293.67;
f2 = 329.63;
f3 = 349.23;
f4 = 392.00;
f5 = 440.00;
f6 = 493.88;
f7 = 523.23;
y_0 = sin(2 * pi * f0 * t);
y_1 = sin(2 * pi * f1 * t);
y_2 = sin(2 * pi * f2 * t);
y_3 = sin(2 * pi * f3 * t);
y_4 = sin(2 * pi * f4 * t);
y_5 = sin(2 * pi * f5 * t);
y_6 = sin(2 * pi * f6 * t);
y_7 = sin(2 * pi * f7 * t);
y = [y_0 y_1 y_2 y_3 y_4 y_5 y_6 y_7];

fig0 = figure;
plot(t8,y);
xticks(0:0.25:2);
xlabel('time[s]');
ylabel('amplitude');
axis([0 2 -1.5 1.5]);

fft_y = fft(y);
fft_y = fftshift(fft_y);
f = (-Fs/2 : Fs/length(fft_y)  : Fs/2 - Fs/length(fft_y));

fig1 = figure;
subplot(2,1,1);
plot(f,fft_y);
xlabel('frequency[Hz]');
ylabel('amplitude');
axis([-1000 1000 -1500 1500]);

for k=1:length(fft_y)
    if f(k) >= 375.00 || f(k) <= -375.00
        fft_y(k) = 0;
    end
end
subplot(2,1,2);
plot(f,fft_y);
axis([-1000 1000 -1500 1500]);
xlabel('frequency[Hz]');
ylabel('amplitude');
ifft_y = ifftshift(fft_y);
ifft_y = ifft(ifft_y);
ifft_real = real(ifft_y);

fig2 = figure;
plot(t8,ifft_y);
xlabel('time[s]');
ylabel('amplitude');
xticks(0:0.25:2);
axis([0 2 -1.5 1.5]);
% sound(ifft_real,Fs)
exportgraphics(fig0,'../Figures/02_20.pdf','ContentType','vector');
exportgraphics(fig1,'../Figures/02_21.pdf','ContentType','vector');
exportgraphics(fig2,'../Figures/02_22.pdf','ContentType','vector');
