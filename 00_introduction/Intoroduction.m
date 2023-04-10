clear;
clc;
% 3.1
a = 3
b = [1 2 3]
c = [1; 2; 3]
d = 1:5
e = 0.1:0.1:0.3

f = [1:5]'
g = [0.1:0.1:0.3]'

h = zeros(2,2)
j = ones(2,2)

e3_1 = [-10:2:10]
e3_2 = [1:1:3; 4:1:6; 7:1:9]
e3_3 = [1:1:4; 5:1:8; 9:1:12]'

% 3.2
clear;
clc;
b = [1:5]
b(3) % 要素取り出し
c = b(3:5) % b3 - b5 を取り出し

b1 = [1:3]
b2 = [4:6]
c = [b1 b2]
d = [b1; b2]
d(1,:) % 全体要素は ":" を用いる この場合 d 1行 全列 (row, col)

e3_4_1 = [1:1:10]'
e3_4_2 = [-10:1:-1]'
e3_4 = [e3_4_1 e3_4_2]
e3_5 = e3_4(1:3,:) % 1 - 3行 を取り出す
e3_6 = e3_4(4:6,:) % 4 - 6行 を取り出す

% 4
clear;
clc;
b1 = [1:3]
b2 = [4:6]
c = b1 + b2

%d = b1*b2 要素数不一致
e = b1*b2'
f=b1.*b2
g=b1'*b2

e4_1 = [1:1:10]
e4_1 = e4_1.*e4_1
e4_2 = [1:1:3; 4:1:6; 7:1:9]*[1 2 3]'

% 5
clear;
clc;
for k = 1 : 10
    disp(k)
end

for k=1.0 : -0.1 : 0.5
    disp(k)
end

for k=[1 -3 4 -5]
    disp(k)
end

% 6
clear;
clc;
Fs = 44100; % サンプリング周波数
f = 440;    % 信号周波数
% Bad example
for k=0 : Fs-1
    x(k+1) = sin(2 * pi * f * k /Fs);
end

% Good example
t = [0 : Fs-1] /Fs; % 時刻
y = sin(2 * pi * f * t); %
figure;
plot(t,y);

% 7
t = 0:0.001:1;  % 時刻
f = 5;          % 信号周波数
y = sin(2 * pi * f * t);
plot(t, y); % (x, y)
xlabel('time [s]');
ylabel('wavwform');
title('sinusoidal wave');

plot(y);
axis([0 25 -1 1])   % axis([xmin xmax ymin ymax])

figure;
subplot(3,1,1);      % subplot(m行, n列, p番目)
plot(y);
subplot(3,1,2);
plot(y);
subplot(3,1,2);
plot(t,y);