clear; close all;
img = imread('../LENNA.bmp');
H = 256;
W = 256;
filter_50 = ones(H,W);
filter_100 = ones(H,W);
c_x = H/2;
c_y = W/2;
for y = 1:H
    for x = 1:W
        d = sqrt((x-c_x)^2 + (y-c_y)^2);
        if d <= 50
            filter_50(y,x) = 0;
        end
        if d <= 100
            filter_100(y,x) = 0;
        end
    end
end
fig0 = figure;
imshow(filter_50);
axis off;
exportgraphics(fig0,'../Figures/08_41_filter.pdf','ContentType','vector');
img_fft = fftshift(fft2(img));
fig0 = figure;
colormap('gray');
imagesc(log(1 + abs(img_fft).^2));
axis off;
exportgraphics(fig0,'../Figures/08_42_fft.pdf','ContentType','vector');

img_filter50 = img_fft.*filter_50;
img_filter100 = img_fft.*filter_100;
img_ifilter50 = real(ifft2(ifftshift(img_filter50)));
img_ifilter100 = real(ifft2(ifftshift(img_filter100)));
fig0 = figure;
colormap('gray');
imagesc(log(1 + abs(img_filter50).^2));
axis off;
exportgraphics(fig0,'../Figures/08_43_fft-filter.pdf','ContentType','vector');
fig0 = figure;
colormap('gray');
imagesc(img_ifilter50);
axis off;
exportgraphics(fig0,'../Figures/08_44_fft-filter-50.pdf','ContentType','vector');
fig0 = figure;
colormap('gray');
imagesc(img_ifilter100);
axis off;
exportgraphics(fig0,'../Figures/08_45_fft-filter-100.pdf','ContentType','vector');