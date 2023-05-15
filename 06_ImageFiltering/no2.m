clear; close all;
img = imread('../kut.jpg');
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
% impulse noise (in)
in_img = gimg;
rnd = rand(gimg_height,gimg_width);
in_black_bin = (rnd<0.01); % (1%)
in_white_bin = (rnd>0.99); % (1%)
in_img(in_white_bin) = 255;
in_img(in_black_bin) = 0;

% Smoothing filter (sf)
filter_sf = ones(3,3) /9;
sf_img_wgn = filter2(filter_sf, wgn_img);
sf_img_wgn = uint8(sf_img_wgn);
sf_img_in = filter2(filter_sf, in_img);
sf_img_in = uint8(sf_img_in);

figure;
imshow(sf_img_wgn);
imwrite(sf_img_wgn,'../Figures/06_21_sf_img_wgn.png');
figure;
imshow(sf_img_in);
imwrite(sf_img_in,'../Figures/06_22_sf_img_in.png');

% Median filter (mf)
zeroPadding_height = zeros(gimg_height, 1);
zeroPadding_width = zeros(1, gimg_width + 2);
zeroPadding_img_wgn = [zeroPadding_height wgn_img zeroPadding_height];
zeroPadding_img_wgn = [zeroPadding_width ; zeroPadding_img_wgn ; zeroPadding_width];
zeroPadding_img_in = [zeroPadding_height wgn_img zeroPadding_height];
zeroPadding_img_in = [zeroPadding_width ; zeroPadding_img_in ; zeroPadding_width];

mf_img_wgn = zeroPadding_img_wgn;
mf_img_in = zeroPadding_img_in;

for h = 2:gimg_height
    for w = 2:gimg_width
        mf_img_wgn(h-1,w-1) = median(zeroPadding_img_wgn(h-1:h+1,w-1:w+1),'all');
        mf_img_in(h-1,w-1) = median(zeroPadding_img_in(h-1:h+1,w-1:w+1),'all');
    end
end
figure;
imshow(mf_img_wgn);
imwrite(mf_img_wgn,'../Figures/06_23_mf_img_wgn.png');
figure;
imshow(mf_img_in);
imwrite(mf_img_in,'../Figures/06_24_mf_img_in.png');