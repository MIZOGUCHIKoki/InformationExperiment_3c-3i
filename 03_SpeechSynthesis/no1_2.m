%やっていることはkadai1_1とほぼ同じなのでそちらを参照

clear all;

Fs=16000;
f=440;
t=[0:2*(Fs-1)]/Fs;
phi1=pi/4;
phi2=pi/2;
phi3=rand;

y1=0;
y2=0;
y3=0;
y4=0;
for k=1:2:50;
    y1=y1+1/k*sin(2*pi*f*k*t);
    y2=y2+1/k*sin(2*pi*f*k*t+phi1);
    y3=y3+1/k*sin(2*pi*f*k*t+phi2);
    y4=y4+1/k*sin(2*pi*f*k*t+phi3);
end

subplot(4,1,1);
plot(t,y1);
xlabel('time[s]');
ylabel('waveform');
title('通常短形波');
axis([0 0.01 -3 3]);
subplot(4,1,2);
plot(t,y2);
xlabel('time[s]');
ylabel('waveform');
title('π/4位相ずれ');
axis([0 0.01 -3 3]);
subplot(4,1,3);
plot(t,y3);
xlabel('time[s]');
ylabel('waveform');
title('π/2位相ずれ');
axis([0 0.01 -3 3]);
subplot(4,1,4);
plot(t,y4);
xlabel('time[s]');
ylabel('waveform');
title('ランダム位相ずれ');
axis([0 0.01 -3 3]);