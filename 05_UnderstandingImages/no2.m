clear;
img = imread("kut.jpg");
gimg = 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3);
figure;
imshow(gimg);
imwrite(gimg,"../Figures/05_21gimg.png");
gray_4bit = bitshift(gimg,-4) * 16;  % XXXX XXXX -> XXXX
gray_2bit = bitshift(gimg,-6) * 128; % XXXX XXXX -> XX
gray_1bit = bitshift(gimg,-7) * 255; % XXXX XXXX -> X
figure;
imshow(gray_4bit);
imwrite(gray_4bit,"../Figures/05_224bit.png");
figure;
imshow(gray_2bit);
imwrite(gray_4bit,"../Figures/05_232bit.png");
figure;
imshow(gray_1bit);
imwrite(gray_4bit,"../Figures/05_241bit.png");