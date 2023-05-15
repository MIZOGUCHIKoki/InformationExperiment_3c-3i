clear; close all;
H = 256;
W = 256;
img4 = zeros(H,W);
img16 = zeros(H,W);
img64 = zeros(H,W);
for h = 1:H
    for w = 1:W
        img4(h,w) = 1 + sin((2*pi*w) / W*4);
        img16(h,w) = 1 + sin((2*pi*w) / W*16);
        img64(h,w) = 1 + sin((2*pi*w) / W*64);
    end
end
img4_fft = abs(fftshift(fft2(img4))).^2;
img16_fft = abs(fftshift(fft2(img16))).^2;
img64_fft = abs(fftshift(fft2(img64))).^2;

figure;
colormap('gray');
imagesc(img4);
figure;
colormap('gray');
imagesc(img16);
figure;
colormap('gray');
imagesc(img64);

figure;
colormap('gray');
imagesc(img4_fft);
xlabel('x: frequency');
ylabel('y: frequency');
figure;
colormap('gray');
imagesc(img16_fft);
xlabel('x: frequency');
ylabel('y: frequency');
figure;
colormap('gray');
imagesc(img64_fft);
xlabel('x: frequency');
ylabel('y: frequency');