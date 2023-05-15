clear; close all;
img = imread('../kut.jpg');
gimg = 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3);
gimg = double(gimg);
gimg_i = -1 * gimg;
gimg_i = gimg_i + 255;
gimg_i = uint8(gimg_i);
figure;
imshow(gimg_i);
imwrite(gimg_i,'../Figures/05_31_8.png');

gray_4bit = bitshift(gimg,-4) * (255/15);  % XXXX XXXX -> XXXX
gray_2bit = bitshift(gimg,-6) * (255/3);   % XXXX XXXX -> XX
gray_1bit = bitshift(gimg,-7) * (255/1);   % XXXX XXXX -> X

gray_4bit = double(gray_4bit);
gimg_i4 = -1 * gray_4bit;
gimg_i4 = gimg_i4 + 255;
gimg_i4 = uint8(gimg_i4);
figure;
imshow(gimg_i4);
imwrite(gimg_i4,'../Figures/05_32_4.png');

gray_2bit = double(gray_2bit);
gimg_i2 = -1 * gray_2bit;
gimg_i2 = gimg_i2 + 255;
gimg_i2 = uint8(gimg_i2);
figure;
imshow(gimg_i2);
imwrite(gimg_i2,'../Figures/05_33_2.png');

gray_1bit = double(gray_1bit);
gimg_i1 = -1 * gray_1bit;
gimg_i1 = gimg_i1 + 255;
gimg_i1 = uint8(gimg_i1);
figure;
imshow(gimg_i1);
imwrite(gimg_i1,'../Figures/05_34_1.png');
