clc;
clear all;
close all;

color_img = imread("C:\Users\Sufyan Parkar\Desktop\SEM 7\ICE\mini proj_image compression\images\apple.jpeg");
imshow(color_img)
title('Actual Image');
gray_img = rgb2gray(color_img);
figure()
imshow(gray_img)
title('Grayscale Image');
gray_img = double(gray_img);
compressed_img = zeros(size(gray_img));
decompressed_img = zeros(size(gray_img));
[x, y] = size(gray_img);
for i = 1:x
    compressed_img(i,1) = gray_img(i,1);
    for j = 2:y
        compressed_img(i,j) = gray_img(i,j-1) - gray_img(i,j);
    end
end

for m = 1:x
    decompressed_img(m,1) = compressed_img(m,1);
    for n = 2:y
        decompressed_img(m,n) = decompressed_img(m,n-1) - compressed_img(m,n);
    end
end
    

figure()
imshow(compressed_img)
title('Compressed Image');
        
figure()
colormap(gray)
imagesc(decompressed_img)
axis off
title('Decompressed Image');


