clear;
clc;
[y, Fs] = audioread('sound1.wav');

N = length(y); % yの長さ
t = [1:N] /Fs; % 時間

z = zeros(size(y));

for k=1 : N % 長さの倍（要素数）
    z(k) = y(k) * (-1); % 全ての要素の値を逆転
end

%プロット
figure;
subplot(2,1,1);
plot(t,y);
xlabel('time[s]');
ylabel('waveform');
title('「あ」の波形から1部抜粋');
axis([0 0.01 -0.04 0.04]);

subplot(2,1,2);
plot(t,z);
xlabel('time[s]');
ylabel('waveform');
title('上下逆転波形');
axis([0 0.01 -0.04 0.04]);

figure;
hold on;
plot(t,y);
plot(t,z);
xlabel('time[s]');
ylabel('waveform');
title('表示を合成');
axis([0 0.01 -0.04 0.04]);