clear;
Fs = 16000;
f = 440;
t = (0 : Fs-1) /Fs;
y_kukei = 0;
y_nokogiri = 0;
for k=1:50
    y_kukei = y_kukei + (1/(2*k-1)) * sin(2*pi*f*(2*k-1)*t);
end
mfm_kukei = y_kukei - sin(2*pi*f*t);

for k=1:50
    y_nokogiri = y_nokogiri + (-1)^(k-1) * 1/3 * 2/k * sin(2*pi*f*k*t);
end
mfm_nokogiri = y_nokogiri - 1/3*2*sin(2*pi*f*t);
y = sin(2*pi*f*t);

fig0 = figure;
hold on;
plot(t,y_kukei);
plot(t,mfm_kukei);
hold off;
axis([0 0.01 -1 1]);
xlabel('time[s]');
ylabel('amplitude');
fig1 = figure;
hold on;
plot(t,y_nokogiri);
plot(t,mfm_nokogiri);
hold off;
axis([0 0.01 -1 1]);
xlabel('time[s]');
ylabel('amplitude');

sound(y_kukei,Fs);
pause(2);
sound(mfm_kukei,Fs);
pause(2);
sound(y_nokogiri,Fs);
pause(2);
sound(mfm_nokogiri,Fs);
pause(2);
