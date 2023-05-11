clear; close all;
img = imread("../kut.jpg");
gimg = 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3);
figure;
imshow(gimg);
imwrite(gimg,"../Figures/05_21_gimg.png");
gray_4bit = bitshift(gimg,-4) * (255/15);  % XXXX XXXX -> XXXX
gray_2bit = bitshift(gimg,-6) * (255/3);   % XXXX XXXX -> XX
gray_1bit = bitshift(gimg,-7) * (255/1);   % XXXX XXXX -> X

figure;
imshow(gray_4bit);
imwrite(gray_4bit,"../Figures/05_22_4bit.png");
figure;
imshow(gray_2bit);
imwrite(gray_2bit,"../Figures/05_23_2bit.png");
figure;
imshow(gray_1bit);
imwrite(gray_1bit,"../Figures/05_24_1bit.png");
