clear;

Fs = 16000; % 
f1 = 440;   % [Hz]
f2 = 660;   % [Hz]

t1 = (0:(Fs-1)) /Fs;
y1 = sin(2*pi*f1*t1);

t2 = (0:(Fs-1)) /Fs;
y2 = sin(2*pi*f2*t2);

sound(y1,Fs);
pause(3)
sound(y2,Fs);

fig0 = figure;
hold on;
plot(t1,y1);
plot(t2,y2);
hold off;
xlabel('time[s]');
ylabel('amplitude');
legend({'440Hz','660Hz'},'Location','southwest');
axis([0 0.01 -1.01 1.01]);
% exportgraphics(fig0,'../Figures/01_no1.pdf','ContentType','vector');