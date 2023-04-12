clear all;
Fs=16000;
f=440;
t=[0:2*(Fs-1)]/Fs;
y=0;
for k=1:50;
    y=y + (1/(2*k-1)) * sin(2*pi*f*(2*k-1)*t);
end
plot(t,y);
axis([0 0.01 -3 3]);