clear; close all;
img = imread('file_hand.png');
img_hsv = rgb2hsv(img);
img_hsv_255 = img_hsv * 255;
img_hsv_255= uint8(img_hsv_255);
figure;
imshow(img_hsv_255);
imwrite(img_hsv,'../Figures/06_51_img-hsv.png');
hsv_h = img_hsv(:,:,1); % Hue（色相）
hsv_s = img_hsv(:,:,2); % Saturation（彩度）
hsv_v = img_hsv(:,:,3); % Value（明度）
img_size = size(img);
img_height = img_size(1,1);
img_width = img_size(1,2);

% Skin color detection (scd)
scd = zeros(img_height, img_width);
for h = 1:img_height
    for w = 1:img_width
        if((hsv_h(h,w) >= 0.507) || (hsv_h(h,w) <= 0.108)) && (hsv_s(h,w) >= 0.197) && (hsv_v(h,w) >= 0.362) && (hsv_s(h,w) <= 0.622) && (hsv_v(h,w) <= 0.920)
            scd(h,w) = 255;
        end
    end
end
scd = scd * 255;
scd = uint8(scd);
figure;
imshow(scd);
imwrite(scd,'../Figures/06_52_scd.png');