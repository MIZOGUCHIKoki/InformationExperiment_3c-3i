clear all;
clc;

Fs = 16000;
T = 1/2; % 周期
f = 1/T; % 周波数

t = [0:4*(Fs-1)] /Fs;

y = 0;
for k=1
    y = y + (1/(2*k-1)) * sin(2*pi*f*(2*k-1)*t);
end
subplot(3,1,1);
plot(t,y);
axis([0 1 -3 3]);
title('N=1');

y = 0;
for k=1:5
    y = y + (1/(2*k-1)) * sin(2*pi*f*(2*k-1)*t);
end
subplot(3,1,2);
plot(t,y);
axis([0 1 -3 3]);
title('N=5');

y = 0;
for k=1:25
    y = y + (1/(2*k-1)) * sin(2*pi*f*(2*k-1)*t);
end
subplot(3,1,3);
plot(t,y);
axis([0 1 -3 3]);
title('N=25');