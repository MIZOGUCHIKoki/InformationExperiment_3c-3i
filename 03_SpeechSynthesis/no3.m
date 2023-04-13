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
 
 y1l = length(y1);
 y2l = length(y2);
 fs1 = [-Fs1/2:Fs1/y1l:(Fs1/2)-Fs1/y1l];
 fs2 = [-Fs2/2:Fs2/y2l:(Fs2/2)-Fs2/y2l];
 figure;
 plot(fs1,A1);
 axis([0 5000 0 80]);
 title('"a"');
 figure;
 plot(fs2,A2);
 axis([0 5000 0 80]);
 title('"i"');

 y1mx = [1092 545 819 682 956 2868 ]