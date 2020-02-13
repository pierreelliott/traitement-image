close all;
clear;
pkg load image;

beach = imread('beach.tif');
manhattan = imread('manhattan.tif');
sinus = imread('sinus.png');
figure()
subplot(2,2,1)
imshow(beach);
subplot(2,2,2)
imshow(manhattan);
subplot(2,2,3)
imshow(sinus);

% angle() -> phase
% 
decompose_image(sinus, 'sinus');
decompose_image(beach, 'beach');
decompose_image(manhattan, 'manhattan');

##reconstructed = uint8(real(ifft2(fftshift(module .* exp(1i*unwrap(phase))))));
##figure()
##imshow(reconstructed)

figure()
imshow(merge_with(beach, manhattan));
saveas(gcf, 'images/merge beach with manhattan', 'png');

figure()
subplot(1,2,1), imshow(real(fftshift(fft2(beach)))), title('Fourier - Beach')
subplot(1,2,2), imshow(real(fftshift(fft2(manhattan)))), title('Fourier - Manhattan')
saveas(gcf, 'images/transformees de fourier', 'png');

figure()
filtered = filter(fftshift(image_fft), 'disk', 10);
imshow(filtered);

