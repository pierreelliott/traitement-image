close all;
clear;
pkg load image;

beach = imread('beach.tif');
manhattan = imread('manhattan.tif');
sinus = imread('sinus.png');
figure(1)
subplot(2,2,1)
imshow(beach);
subplot(2,2,2)
imshow(manhattan);
subplot(2,2,3)
imshow(sinus);

% angle() -> phase
% 
image = sinus;
image_fft = fft2(image);
phase = angle(fftshift(image_fft));
module = abs(fftshift(image_fft));
figure(2)
subplot(1,2,1)
imshow(phase);
title('Phase')
subplot(1,2,2)
imshow(module);
title('Module')

reconstructed = uint8(real(ifft2(fftshift(module .* exp(1i*unwrap(phase))))));
figure(3)
imshow(reconstructed)

figure(4)
imshow(merge_with(beach, manhattan));

figure(5)
filtered = filter(fftshift(image_fft), 'disk', 10);
imshow(filtered);