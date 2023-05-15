clear; close all;
img = imread('../kut.jpg');
gimg = 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3);
% Laplacian filter (lf)
filter_lf = [1 1 1; 1 -8 1; 1 1 1];
lf_img = filter2(filter_lf,gimg);
lf_img = abs(lf_img);
lf_img = lf_img /8; % 最大値で割る
lf_img = uint8(lf_img);
figure;
imshow(lf_img);
imwrite(lf_img,'../Figures/06_41_lf-img.png');
% Thresholding
num1 = zeros(1, 256);
for i = 0:255
    num1(i+1) = sum(sum(lf_img > i));
end
x = (0:255);
fig0 = figure;
plot(x,num1);
axis([0 255 0 max(num1)+10000]);
xlabel('pixel value');
ylabel('number of pixels');
exportgraphics(fig0,'../Figures/06_42_Thresholding-graph.pdf','ContentType','vector');
bin = lf_img > 30; % Threshold = 30
lf_img_thresholding = lf_img;
lf_img_thresholding(bin) = 255;
figure;
imshow(lf_img_thresholding);
imwrite(lf_img_thresholding,'../Figures/06_43_lf-img-thresholding.png');