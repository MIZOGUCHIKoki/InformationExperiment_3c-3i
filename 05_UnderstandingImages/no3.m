clear;
img = imread("kut.jpg");
gimg = 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3);
gimg = cast(gimg,"double");
gimg_i = -1 * gimg;
gimg_i = gimg_i + 255;
gimg_i = cast(gimg_i,"uint8");
figure;
imshow(gimg_i);
imwrite(gimg_i,"../Figures/05_318.png");

gray_4bit = bitshift(gimg,-4) * (255/15);  % XXXX XXXX -> XXXX
gray_2bit = bitshift(gimg,-6) * (255/3);   % XXXX XXXX -> XX
gray_1bit = bitshift(gimg,-7) * (255/1);   % XXXX XXXX -> X

gray_4bit = cast(gray_4bit,"double");
gimg_i4 = -1 * gray_4bit;
gimg_i4 = gimg_i4 + 255;
gimg_i4 = cast(gimg_i4,"uint8");
figure;
imshow(gimg_i4);
imwrite(gimg_i4,"../Figures/05_324.png");

gray_2bit = cast(gray_2bit,"double");
gimg_i2 = -1 * gray_2bit;
gimg_i2 = gimg_i2 + 255;
gimg_i2 = cast(gimg_i2,"uint8");
figure;
imshow(gimg_i2);
imwrite(gimg_i2,"../Figures/05_332.png");

gray_1bit = cast(gray_1bit,"double");
gimg_i1 = -1 * gray_1bit;
gimg_i1 = gimg_i1 + 255;
gimg_i1 = cast(gimg_i1,"uint8");
figure;
imshow(gimg_i1);
imwrite(gimg_i1,"../Figures/05_341.png");