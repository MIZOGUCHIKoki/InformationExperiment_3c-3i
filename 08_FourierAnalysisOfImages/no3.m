clear; close all;
H = 256;
W = 256;
img1 = zeros(H,W);
img1(H/2-30:H/2+30,W/2-15:W/2+15) = 255;
fig0 = figure;
imshow(img1);
axis off;
exportgraphics(fig0,'../Figures/08_31_rec1.pdf','ContentType','vector');
img2 = zeros(H,W);
img2(H/2+60-30:H/2+60+30,W/2+60-15:W/2+60+15) = 255;
fig0 = figure;
imshow(img2);
axis off;
exportgraphics(fig0,'../Figures/08_32_rec2.pdf','ContentType','vector');

img1_fft = log(1 + abs(fftshift(fft2(img1))).^2);
img2_fft = log(1 + abs(fftshift(fft2(img2))).^2);

fig0 = figure;
colormap('gray');
imagesc(img1_fft);
axis off;
exportgraphics(fig0,'../Figures/08_33_rec1-fft.pdf','ContentType','vector');
fig0 = figure;
colormap('gray');
imagesc(img2_fft);
axis off;
exportgraphics(fig0,'../Figures/08_34_rec2-fft.pdf','ContentType','vector');

diff = img2_fft - img1_fft;
diff_max = max(max(diff));
diff_min = min(min(diff));