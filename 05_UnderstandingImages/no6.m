clear;
img1 = imread("fig1.jpg"); % 人あり
img2 = imread("fig2.jpg"); % 人なし

result = img2 - img1;
figure;
imshow(result);
imwrite(result,"../Figures/05_6.png");
