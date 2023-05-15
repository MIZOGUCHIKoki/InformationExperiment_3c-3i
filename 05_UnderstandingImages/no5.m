clear; close all;
img = imread('../kut.jpg');
gimg = 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3);
pixel = (0:1:255);
nof_pixel = zeros(1,256);
for k=1:256
    lng = gimg == k - 1;
    nof_pixel(k) = sum(sum(lng));
end
fig0 = figure;
plot(pixel,nof_pixel);
xlabel('pixcel value');
ylabel('number of pixels');
axis([0 255 0 8000]);
exportgraphics(fig0,'../Figures/05_50_graph.pdf','ContentType','vector');
