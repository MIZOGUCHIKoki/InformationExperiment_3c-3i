clear;
clc;
[y, Fs] = audioread('sound1.wav');
y=y(:,1); % ステレオからモノラルへの変換
N = length(y); % yの長さ
t = (1:N) /Fs; % 時間
z = y.*(-1);


%プロット
figure;
subplot(2,1,1);
plot(t,y);
xlabel('time[s]');
ylabel('waveform');
title('1) 「あ」の波形（一部抜粋）');
axis([0 0.01 -0.04 0.04]);

subplot(2,1,2);
plot(t,z);
xlabel('time[s]');
ylabel('waveform');
title('2) 1)の正負反転波形');
axis([0 0.01 -0.04 0.04]);

figure;
hold on;
plot(t,y);
plot(t,z);
legend({'1) 「あ」の波形（一部抜粋）','2) 1)の正負反転波形'},'Location','southwest');
xlabel('time[s]');
ylabel('waveform');
title('表示を合成');
axis([0 0.01 -0.04 0.04]);