clear;
[y, Fs] = audioread('sound1.wav');
y=y(:,1); % ステレオからモノラルへの変換
N = length(y); % yの長さ
t = (1:N) /Fs; % 時間
z = y.*(-1);

soundsc(y,Fs);
pause(5);
soundsc(z,Fs);

fig = figure;
hold on;
plot(t,y);
plot(t,z);
plot(t,y+z);
hold off;
legend({'1) original wave','2) sign inversion wave','3) synthetic wave'},'Location','southwest');
xlabel('time[s]');
ylabel('amplitude');
axis([0 0.01 -0.04 0.04]);
exportgraphics(fig,'../Figures/03_2_i.pdf','ContentType','vector');