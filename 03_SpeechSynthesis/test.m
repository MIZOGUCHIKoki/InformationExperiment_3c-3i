clear all;
% clc;
Fs = 16000; % サンプリング周波数
f = 440; % 基本周波数
t = [0 : 2*(Fs-1)] /Fs; % 時刻
phi1 = pi / 4;
phi2 = pi / 2;
phi3 = rand;

y1 = 0;
y2 = 0;
y3 = 0;
y4 = 0;

for k = 1 : 500
    y1 = y1 + (-1)^(k-1) * 2/k * sin(2*pi*f*k*t);       % 級数を表現
end
figure;

figure;
plot(t,y1);
xticks(0:1/f:3/f);
xlabel('time[s]');
ylabel('waveform');
title('通常ノコギリ波');
axis([0 3/f -3.5 3.5]);
