clear;
Fs = 16000; % サンプリング周波数
f = 440; % 基本周波数
t = (0 : 2*Fs-1) /Fs; % 時刻
phi1 = pi / 4;
phi2 = pi / 2;

y1 = 0;
y2 = 0;
y3 = 0;
y4 = 0;
% ノコギリ波
for k = 1 : 50
    y1 = y1 + (-1)^(k-1) * 1/3 * 2/k * sin(2*pi*f*k*t);       % 級数を表現
    y2 = y2 + (-1)^(k-1) * 1/3 * 2/k * sin(2*pi*f*k*t+phi1);
    y3 = y3 + (-1)^(k-1) * 1/3 * 2/k * sin(2*pi*f*k*t+phi2);
    y4 = y4 + (-1)^(k-1) * 1/3 * 2/k * sin(2*pi*f*k*t+rand);
end

sound(y1,Fs);
pause(3);
sound(y2,Fs);
pause(3);
sound(y3,Fs);
pause(3);
sound(y4,Fs);
pause(3);

fig1 = figure;
plot(t,y1);
xlabel('time[s]');
ylabel('amplitude');
axis([0 0.01 -3 3]);
exportgraphics(fig1,'../Figures/03_21_nokogiri.pdf','ContentType','vector');

fig2 = figure;
plot(t,y2);
xlabel('time[s]');
ylabel('amplitude');
axis([0 0.01 -3 3]);
exportgraphics(fig2,'../Figures/03_22.pdf','ContentType','vector');

fig3 = figure;
plot(t,y3);
xlabel('time[s]');
ylabel('amplitude');
axis([0 0.01 -3 3]);
exportgraphics(fig3,'../Figures/03_23.pdf','ContentType','vector');

fig4 = figure;
plot(t,y4);
xlabel('time[s]');
ylabel('amplitude');
axis([0 0.01 -3 3]);
exportgraphics(fig4,'../Figures/03_24.pdf','ContentType','vector');