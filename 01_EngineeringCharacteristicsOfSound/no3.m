clear;
Fs = 16000; % 
f1 = 440;   % [Hz]
f2 = 441;   % [Hz]
t = (0:4*(Fs-1)) /Fs;
for k=0:Fs
    y1 = sin(2*pi*f1*t);
end

for k=0:Fs
    y2 = sin(2*pi*f2*t);
end

y = y1 + y2;
sound(y,Fs);

fig0 = figure;
plot(t,y);
xticks(0:1:4);
xlabel('time[s]');
ylabel('amplitude');
axis([0 4 -2.01 2.01]);
exportgraphics(fig0,'../Figures/01_03.pdf','ContentType','vector');
