clear;

Fs = 16000;
t = (0 : (Fs-1)) /Fs;
tl = length(t);

rng(0,'twister'); % 乱数生成器 初期化

a = 0.2; % 標準偏差
b = 0; % 平均

y = a.*randn(tl,1) + b;

figure;
plot(t,y);
title('白色ガウス雑音');
xlabel('time[s]');
ylabel('振幅');


num=100; % ヒストグラム分割数

[h, c] = hist(y, num);
figure;
plot(c,h);
title('ヒストグラム');
xlabel('周波数');
ylabel('頻度');

sound(y,Fs);