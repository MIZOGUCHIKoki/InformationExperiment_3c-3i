clear;
 [y1,Fs1] = audioread('sound1.wav');
 y1=y1(:,1);
 t1=[0:length(y1)-1]/Fs1;

 % ピークを探すための処理
 Y1=fft(y1);
 Y1shift=fftshift(Y1);
 A1=abs(Y1shift);

 y1l = length(y1);
 fs1 = [-Fs1/2:Fs1/y1l:(Fs1/2)-Fs1/y1l];
 
 figure;
 plot(fs1,A1);
 % axis([0 5000 0 80]);
 title('"a"');

 y1mx = [1092 545 819 682 956 2868 3555 136 1219 3680];
 y1my = [77 51 50 42 36 35 30.3459 25 25 21];

 ya=0;
 for k=1:10
    ya=ya+y1my(k)*sin(2*pi*y1mx(k)*t1);
 end
 figure;
 plot(t1,ya);
 % sound(ya,Fs1);