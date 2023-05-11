clear; close all;
C = 0.5; % コントラスト（今回は0.5）
f = 0.05; % 空間周波数（今回は0.05）
f1 = 0.03; % 空間周波数（今回は0.03）
d1 = (-1/6)*pi;
d2 = (1/3)*pi;
L_0 = 128;
height = 300;
width = 300;
L_l30 = zeros(height,width);
L_r60 = zeros(height,width);


for x = 1:width
    for y = 1:height
        L_l30(y,x) = L_0 * (1 + C * sin(2 * pi * f*(y*sin(d1)+x*cos(d1))));
        L_r60(y,x) = L_0 * (1 + C * sin(2 * pi * f1*(y*sin(d2)+x*cos(d2))));
    end
end

figure;
colormap(gray(256));
image(L_l30);
axis off;
axis image;

figure;
colormap(gray(256));
image(L_r60);
axis off;
axis image;