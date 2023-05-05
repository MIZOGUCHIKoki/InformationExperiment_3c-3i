clear;
Fs = 16000;
t = (0 : (Fs-1)) /Fs;
tl = length(t);
rng(0,'twister'); % 乱数生成器 初期化
a = 0.2; % 標準偏差
b = 0; % 平均
y = a.*randn(tl,1) + b;

fig0 = figure;
plot(t,y);
xlabel('time[s]');
ylabel('amplitude');
num=100; % ヒストグラム分割数
[h, c] = hist(y, num);

fig1 = figure;
plot(c,h);
xlabel('amplitude');
ylabel('frequency[times]');

sound(y,Fs);
exportgraphics(fig0,'../Figures/01_05_0.pdf','ContentType','vector');
exportgraphics(fig1,'../Figures/01_05_1.pdf','ContentType','vector');