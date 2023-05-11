clear; close all;
clear; close all;
C = 0.5; % コントラスト（今回は0.5）
f = 0.05; % 空間周波数（今回は0.05）
d1 = (-1/6)*(1/3)*pi; % 10度
d2 = (1/4)*pi; % 45度
d0 = (0)*pi;
L_0 = 128;
height = 400;
width = 400;
L_p10 = zeros(height,width);
L_n10 = zeros(height,width);
L_p45 = zeros(height,width);
L_n45 = zeros(height,width);
L = zeros(height,width);


for x = 1:width
    for y = 1:height
        L_p10(y,x) = L_0 * (1 + C * sin(2 * pi * f*(y*sin(d1)+x*cos(d1))));
        L_n10(y,x) = L_0 * (1 + C * sin(2 * pi * f*(y*sin(-1*d1)+x*cos(-1*d1))));
        L_p45(y,x) = L_0 * (1 + C * sin(2 * pi * f*(y*sin(d2)+x*cos(d2))));
        L_n45(y,x) = L_0 * (1 + C * sin(2 * pi * f*(y*sin(-1*d2)+x*cos(-1*d2))));
        L(y,x) = L_0 * (1 + C * sin(2 * pi * f*(y*sin(d0)+x*cos(d0))));
    end
end

[w, h] = meshgrid(-199:200, 50:-1:-49);
Y2 = 255*0.95;
cir = (w.^2 + h.^2 >= 10.^2)*Y2;

rct = ones(100,400);
rct = rct * Y2;
rct(50-9:50+10,200-49:200+50)=0;

dg_90 = [L; cir; L];
dg_10 = [L_p10; rct; L_n10];
dg_45 = [L_n45; rct; L_p45];

fig10 = figure;
set(fig10, "position",get(0,"ScreenSize"));
colormap(gray(256));
image(dg_10);
axis off;
axis image;
pause(5);
colormap(gray(256));
image(dg_90);
axis off;
axis image;

pause(5);
close all;

fig45 = figure;
set(fig45, "position",get(0,"ScreenSize"));
colormap(gray(256));
image(dg_45);
axis off;
axis image;
pause(5);
colormap(gray(256));
image(dg_90);
axis off;
axis image;
pause(5);
close all;
