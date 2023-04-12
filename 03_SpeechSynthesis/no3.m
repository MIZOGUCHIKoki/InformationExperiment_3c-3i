clear;
 [y1,Fs1] = audioread('sound1.wav');
 [y2,Fs2] = audioread('sound2.wav');

 y1=y1(:,1);
 y2=y2(:,1);

 t1=[0:length(y1)-1]/Fs1;
 t2=[0:length(y2)-1]/Fs2;

 % ピークを探すための処理
 Y1=fft(y1);
 Y2=fft(y2);
 Y1shift=fftshift(Y1);
 Y2shift=fftshift(Y2);

 A1=abs(Y1shift);
 A2=abs(Y2shift);

 n1=length(A1);
 F1 = (-n1/2:n1/2-1)*Fs1/n1;

 n2=length(A2);
 F2 = (-n2/2:n2/2-1)*Fs2/n2;

 figure;
 plot(F1,A1);
 axis([0 5000 ,0 80]);
 title('a');
 xlabel('Frequency(Hz)');
 ylabel('amplitude');
 figure;
 plot(F2,A2);
 axis([0 5000 ,0 80]);
 title('i');
 xlabel('Frequency(Hz)');
 ylabel('amplitude');
 h1=[1092 545 819 682 2868 956 3555 1228 136 273];
 d1=[77 51 50 42 36 35 30 25 25 23];
 D1= d1 ./ (length(y1)/2);
 h2=[306 2906 2447 153 2756 2601 3061 2295 3214 3367];
 d2=[52 52 44 41 24 23 17 16 12 12];
 D2= d2 ./ (length(y2)/2);
 
 ya=0;
 yi=0;
 N=10;

 %合成
 for k=1:N
 ya=ya+D1(k)*sin(2*pi*h1(k)*t1);
 yi=yi+D2(k)*sin(2*pi*h2(k)*t2);
 end
 n3=length(ya);
 F3 = (-n3/2:n3/2-1)*Fs1/n3;
 n4=length(yi);
 F4 = (-n4/2:n4/2-1)*Fs2/n4;
 yaf=fft(ya);
 yif=fft(yi);
 yafs=fftshift(yaf);
 yifs=fftshift(yif);
 Yaf=abs(yafs);
 Yif=abs(yifs);
 na=length(Yaf);
 Fa = (-na/2:na/2-1)*Fs1/na;
 ni=length(Yif);
 Fi = (-ni/2:ni/2-1)*Fs2/ni;
 figure;
 plot(Fa,Yaf);
 axis([0 10000 ,0 80]);
 title('a');
 xlabel('Frequency(Hz)');
 ylabel('amplitude');
 figure;
 plot(Fi,Yif);
 axis([0 10000 ,0 80]);
 title('i');
 xlabel('Frequency(Hz)');
 ylabel('amplitude');
 soundsc(y1,Fs1);
 pause(3);
 soundsc(y2,Fs2);
 pause(3);
 soundsc(ya,Fs1);
 pause(3);
 soundsc(yi,Fs2);
 pause(3);