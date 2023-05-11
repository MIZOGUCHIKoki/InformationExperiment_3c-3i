clear; close all;
img1 = imread("fig1.jpg"); % 人あり
img2 = imread("fig2.jpg"); % 人なし
img1 = 0.3*img1(:,:,1) + 0.59*img1(:,:,2) + 0.11*img1(:,:,3);
img2 = 0.3*img2(:,:,1) + 0.59*img2(:,:,2) + 0.11*img2(:,:,3);
imwrite(img1,"fig1_g.jpg");
imwrite(img2,"fig2_g.jpg");
result = int16(img2) - int16(img1);
result = abs(result);
result = uint8(result);
figure;
imshow(result);
imwrite(result,"../Figures/05_60.png");

threshold1 = 32;
threshold2 = 64;
threshold3 = 128;
threshold1_r = result > threshold1; 
threshold1_r = threshold1_r.*255;
threshold2_r = result > threshold2;
threshold2_r = threshold2_r.*255;
threshold3_r = result > threshold3;
threshold3_r = threshold3_r.*255;
figure;
imshow(threshold1_r);
imwrite(threshold1_r,"../Figures/05_61.png");
figure;
imshow(threshold2_r);
imwrite(threshold2_r,"../Figures/05_62.png");
figure;
imshow(threshold3_r);
imwrite(threshold3_r,"../Figures/05_63.png");