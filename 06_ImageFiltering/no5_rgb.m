clear; close all;
img = imread('file_hand.png');
r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);
bin_r = (r >= 113 & r <= 160);
bin_g = (g >= 81 & g <= 133);
bin_b = (b >= 77 & b <= 98);
bin_r = bin_r * 255;
bin_g = bin_g * 255;
bin_b = bin_b * 255;
hand = bin_r + bin_g + bin_b;
bin = (hand > 255);
hand(bin) = 255;
imshow(hand);
imwrite(hand,'../Figures/06_53_hand.png');