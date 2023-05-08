clear; close all;
img = imread("../kut.jpg");
gimg = 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3);
gimg_size = size(gimg);
gimg_height = gimg_size(1,1);
gimg_width = gimg_size(1,2);
% white Gaussian noise (wgn)
wgn = 10*randn(gimg_height, gimg_width);
wgn = uint8(wgn); % cast
wgn_img = wgn + gimg;
% scaling 
bin = (wgn_img > 255);
wgn_img(bin) = 255;
bin = (wgn_img < 0);
wgn_img(bin) = 0;
% writing
imshow(wgn_img);
imwrite(wgn_img,'./file_white-Gaussian-noise.png');

% impulse noise (in)
in_img = gimg;
rnd = rand(gimg_height,gimg_width);
in_black_bin = (rnd<0.01); % (1%)
in_white_bin = (rnd>0.99); % (1%)
in_img(in_white_bin) = 255;
in_img(in_black_bin) = 0;
% writing
figure;
imshow(in_img);
imwrite(wgn_img,'./file_impluse-noise.png');