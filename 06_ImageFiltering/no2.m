clear; close all;
in_img = imread("file_impluse-noise.png");
in_img_size = size(in_img);
in_img_size_height = in_img_size(1,1);
in_img_size_width = in_img_size(1,2);
wgn_img = imread("file_white-Gaussian-Noise.png");
% Smoothing filter (sf)
filter_sf = ones(3,3) /9;
sf_img_wgn = filter2(filter_sf, wgn_img);
sf_img_wgn = uint8(sf_img_wgn);
sf_img_in = filter2(filter_sf, in_img);
sf_img_in = uint8(sf_img_in);
figure;
imshow(sf_img_wgn);
imwrite(sf_img_wgn,"../Figures/06_21-sf_img_wgn.png");
figure;
imshow(sf_img_in);
imwrite(sf_img_wgn,"../Figures/06_22-sf_img_in.png");

% Median filter (mf)
zeroPadding_height = zeros(in_img_size_height, 1);
zeroPadding_width = zeros(1, in_img_size_width + 2);
zeroPadding_img_wgn = [zeroPadding_height wgn_img zeroPadding_height];
zeroPadding_img_wgn = [zeroPadding_width ; zeroPadding_img_wgn ; zeroPadding_width];
zeroPadding_img_in = [zeroPadding_height wgn_img zeroPadding_height];
zeroPadding_img_in = [zeroPadding_width ; zeroPadding_img_in ; zeroPadding_width];

mf_img_wgn = zeroPadding_img_wgn;
mf_img_in = zeroPadding_img_in;

for h = 2:in_img_size_height
    for w = 2:in_img_size_width
        mf_img_wgn(h-1,w-1) = median(zeroPadding_img_wgn(h-1:h+1,w-1:w+1),"all");
        mf_img_in(h-1,w-1) = median(zeroPadding_img_in(h-1:h+1,w-1:w+1),"all");
    end
end
figure;
imshow(mf_img_wgn);
imwrite(sf_img_wgn,"../Figures/06_23-mf_img_wgn.png");
figure;
imshow(mf_img_in);
imwrite(sf_img_wgn,"../Figures/06_23-mf_img_ing.png");