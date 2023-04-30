clear;
 [y1,Fs1] = audioread('sound1.wav');
 [y2,Fs2] = audioread('sound2.wav');

 y1 = y1(:,1);
 y2 = y2(:,1);

 t1 = (0 : length(y1)-1) /Fs1;
 t2 = (0 : length(y2)-1) /Fs2;
 
 figa = figure;
 plot(t1, y1);
 xlabel('time[s]');
 ylabel('amplitude');
 axis([0 1 -0.04 0.04]);
 exportgraphics(figa,'../Figures/03_30_0a.pdf','ContentType','vector');

 figi = figure;
 plot(t2, y2);
 xlabel('time[s]');
 ylabel('amplitude');
 axis([0 1 -0.04 0.04]);
 exportgraphics(figi,'../Figures/03_30_0i.pdf','ContentType','vector');

 y1l = length(y1);
 y2l = length(y2);
 fs1 = (-Fs1/2 : Fs1/y1l : (Fs1/2)-Fs1/y1l);
 fs2 = (-Fs2/2 : Fs2/y2l : (Fs2/2)-Fs2/y2l);
 
 Y1 = fft(y1);
 Y2 = fft(y2);
 Y1 = fftshift(Y1);
 Y2 = fftshift(Y2);
 
 Y1=abs(Y1);
 Y2=abs(Y2);

 fig0 = figure; % [a_fft]
 plot(fs1, Y1);
 axis([0 10000 -10 80]);
 xlabel('frequency[Hz]');
 ylabel('amplitude');
 exportgraphics(fig0,'../Figures/03_30_afft.pdf','ContentType','vector');
 
 fig1 = figure; % [i_fft]
 plot(fs2, Y2);
 axis([0 10000 -10 80]);
 xlabel('frequency[Hz]');
 ylabel('amplitude');
 exportgraphics(fig1,'../Figures/03_31_ifft.pdf','ContentType','vector');

 y1mx = [1092 545 819 682 956 2868 3555 136 1219 3680];
 y1my = [77 51 50 42 36 35 30.3459 25 25 21];
 y2mx = [306 2906 2447 153 2884 2442 2980 2436 302 2419];
 y2my = [52 52 44 41 34 34 41 33 38 31];
 ya = 0; yi = 0;

 for k=1:10
    ya = ya + y1my(k) * sin(2*pi*y1mx(k)*t1);
    yi = yi + y2my(k) * sin(2*pi*y2mx(k)*t2);
 end

 fig2 =  figure;
 plot(t1, ya);
 xlabel('time[s]');
 ylabel('amplitude');
 axis([0 1 -400 400]);
 exportgraphics(fig2,'../Figures/03_32_a.pdf','ContentType','vector');

 fig3 = figure; 
 plot(t2, yi);
 xlabel('time[s]');
 ylabel('amplitude');
 axis([0 1 -400 400]);
 exportgraphics(fig3,'../Figures/03_33_i.pdf','ContentType','vector');

 % sound(ya,Fs1);
 % pause(4);
 % sound(yi,Fs2);