clear; close all;
H = 256;
W = 256;
img4 = zeros(H,W);
img16 = zeros(H,W);
img64 = zeros(H,W);
for h = 1:H
    for w = 1:W
        img4(h,w) = 1 + sin((2*pi*h) / H*4);
        img16(h,w) = 1 + sin((2*pi*h) / H*16);
        img64(h,w) = 1 + sin((2*pi*h) / H*64);
    end
end
img4_fft = abs(fftshift(fft2(img4))).^2;
img16_fft = abs(fftshift(fft2(img16))).^2;
img64_fft = abs(fftshift(fft2(img64))).^2;

fig0 = figure;
colormap('gray');
imagesc(img4);
axis off;
exportgraphics(fig0,'../Figures/08_21_img4.pdf','ContentType','vector');
fig0 = figure;
colormap('gray');
imagesc(img16);
axis off;
exportgraphics(fig0,'../Figures/08_22_img16.pdf','ContentType','vector');
fig0 = figure;
colormap('gray');
imagesc(img64);
axis off;
exportgraphics(fig0,'../Figures/08_23_img64.pdf','ContentType','vector');

fig0 = figure;
colormap('gray');
imagesc(img4_fft);
axis off;
exportgraphics(fig0,'../Figures/08_24_img4-fft.pdf','ContentType','vector');
fig0 = figure;
colormap('gray');
imagesc(img16_fft);
axis off;
exportgraphics(fig0,'../Figures/08_25_img16-fft.pdf','ContentType','vector');
fig0 = figure;
colormap('gray');
imagesc(img64_fft);
axis off;
exportgraphics(fig0,'../Figures/08_26_img64-fft.pdf','ContentType','vector');