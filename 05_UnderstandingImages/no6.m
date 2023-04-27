clear;

img1 = imread("fig1.jpg"); % 人あり
img2 = imread("fig2.jpg"); % 人なし
img1 = 0.3*img1(:,:,1) + 0.59*img1(:,:,2) + 0.11*img1(:,:,3);
img2 = 0.3*img2(:,:,1) + 0.59*img2(:,:,2) + 0.11*img2(:,:,3);

result = int16(img2) - int16(img1);
result = abs(result);
result = uint8(result);
figure;
imshow(result);
imwrite(result,"../Figures/05_6.png");
