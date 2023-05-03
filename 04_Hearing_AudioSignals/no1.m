clear;

Fs = 16000;
f1 = 1000;
f2 = 990;
f3 = 800;
f4 = 200;
t = (0 : (0.2*Fs-1)) /Fs; % 0.1秒時間軸
ta = (0 : (4*Fs-1)) /Fs; % 0.1 * 20 = 2秒時間軸

y1 = sin(2*pi*f1*t);
y2 = sin(2*pi*f2*t);
y3 = sin(2*pi*f3*t);
y4 = sin(2*pi*f4*t);

EX1 = [y1 y2];
EX1_rep = repmat(EX1, 1, 10);
EX2 = [y1 y3];
EX2_rep = repmat(EX2, 1, 10);
EX3 = [y1 y4];
EX3_rep = repmat(EX3, 1, 10);

sound(EX1_rep,Fs);
pause(5);
sound(EX2_rep,Fs);
pause(5);
sound(EX3_rep,Fs);

fig0 = figure;
plot(ta, EX1_rep);
xlabel('time[s]');
ylabel('amplitude');

fig1 = figure;
plot(ta, EX2_rep);
xlabel('time[s]');
ylabel('amplitude');
fig2 = figure;
plot(ta, EX3_rep);
xlabel('time[s]');
ylabel('amplitude');