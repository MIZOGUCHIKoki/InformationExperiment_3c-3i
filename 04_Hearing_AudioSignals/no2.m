clear;
Fs = 16000;
freq = (-Fs/2 : 1 : Fs/2 - 1);
f = 200;
f2 = 2000;
t_noise= (0 : 0.1*Fs-1) /Fs;
t_y = (0 : Fs-1) /Fs;
y = sin(2*pi*f*t_y);
y2 = sin(2*pi*f2*t_y);
t_all = (0 : (4*Fs + 0.4*Fs - 1));
noise_A = 2 * (rand(1,Fs) - 0.5);

A_fft = fft(noise_A);
A_fft = fftshift(A_fft);

fig0 = figure; % ノイズB_fft
plot(freq,A_fft);
xlabel('frequency[Hz]');
ylabel('amplitude');

noise_filter = ones(1,Fs);
filter_rangeS = 1020;
filter_rangeG = 1620;
noise_filter((Fs/2)-filter_rangeG : (Fs/2)-filter_rangeS) = 0;
noise_filter((Fs/2)+filter_rangeS : (Fs/2)+filter_rangeG) = 0;
B_fft = noise_filter.* A_fft;

fig1 = figure; % ノイズB_fft
plot(freq,B_fft);
xlabel('frequency[Hz]');
ylabel('amplitude');

B_fft = ifftshift(B_fft);
noise_B = ifft(B_fft);
noise_B = real(noise_B);

noise_A = noise_A(1:1600);
noise_B = noise_B(1:1600);

fig2 = figure; % ノイズA
plot(t_noise, noise_A);
xlabel('time[s]');
ylabel('amplitude');
fig3 = figure; % ノイズB
plot(t_noise,noise_B);
xlabel('time[s]');
ylabel('amplitude');

EX1 = [y noise_A];
EX1 = repmat(EX1, 1, 4);
EX2 = [y noise_B];
EX2 = repmat(EX2, 1, 4);
EX3 = [y2 noise_A];
EX3 = repmat(EX3, 1, 4);
EX4 = [y2 noise_B];
EX4 = repmat(EX4, 1, 4);

fig4 = figure;
plot(t_all,EX1);
xlabel('time[s]');
ylabel('amplitude');

soundsc(EX1,Fs);    % pure tone A + noise A   
pause(5);
soundsc(EX2,Fs);    % pure tone A + noise B
pause(5);
soundsc(EX3,Fs);    % pure tone B + noise A
pause(5);
soundsc(EX4,Fs);    % pure tone B + noise B

