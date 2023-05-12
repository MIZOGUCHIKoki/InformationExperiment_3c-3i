clear; close all;
img = imread("../kut.jpg");
gimg = 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3);
% Differential filter (diff)
filter_diff_y = [-1 -2 -1; 0 0 0; 1 2 1];
filter_diff_x = filter_diff_y';
diff_x_img = filter2(filter_diff_x,gimg);
diff_x_img = abs(diff_x_img);
diff_x_img = diff_x_img /2; % 最大値で割る
diff_x_img = uint8(diff_x_img);
diff_y_img = filter2(filter_diff_y,gimg);
diff_y_img = abs(diff_y_img);
diff_y_img = diff_y_img /2; % 最大値で割る
diff_y_img = uint8(diff_y_img);
diff_img = diff_y_img + diff_x_img;
% writing
figure;
imshow(diff_x_img);
imwrite(diff_x_img,"../Figures/06_31_diff-x-img.png");
figure;
imshow(diff_y_img);
imwrite(diff_y_img,"../Figures/06_32_diff-y-img.png");
figure;
imshow(diff_img);
imwrite(diff_img,"../Figures/06_33_diff-img.png");