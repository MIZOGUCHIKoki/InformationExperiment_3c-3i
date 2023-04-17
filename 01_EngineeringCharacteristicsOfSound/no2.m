clear;

Fs = 16000; % 
f1 = 440;   % [Hz]

t1 = (0:(Fs-1)) /Fs;
for k=0:Fs
    y1 = sin(2*pi*f1*t1);
end

p = pi/2;
for k=0:Fs
    y2 = sin(2*pi*f1*t1 + p);
end

p = pi;
for k=0:Fs
    y3 = sin(2*pi*f1*t1 + p);
end

for k=0:Fs
    y4 = 0.5 * sin(2*pi*f1*t1);
end

for k=0:Fs
    y5 = 0.25 * sin(2*pi*f1*t1);
end
sound(y1,Fs); % 基本
pause(3)
sound(y2,Fs); % pi/2
pause(3)
sound(y3,Fs); % pi
pause(3)
sound(y4,Fs); % 0.5倍
pause(3)
sound(y5,Fs); % 0.25倍

figure;
hold on;
plot(t1,y1);
xlabel('time[s]');
ylabel('振幅');
axis([0 0.01 -1.01 1.01])

plot(t1,y2);
xlabel('time[s]');
ylabel('振幅');
axis([0 0.01 -1.01 1.01])

plot(t1,y3);
xlabel('time[s]');
ylabel('振幅');
axis([0 0.01 -1.01 1.01])
legend({'初期','90度ずれ','180度ずれ'},'Location','southwest');
hold off;


figure;
hold on;
plot(t1,y1);
xlabel('time[s]');
ylabel('振幅');

plot(t1,y4);
yticks(-1:0.25:1);
xlabel('time[s]');
ylabel('振幅');

plot(t1,y5);
yticks(-1:0.25:1);
xlabel('time[s]');
ylabel('振幅');

axis([0 0.01 -1.1 1.1]);
legend({'初期','振幅 1/2','振幅 1/4'},'Location','southwest');
hold off;