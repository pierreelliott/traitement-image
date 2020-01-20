clear;
close all;
fig = 0;

cameraman_b = imread("cameraman_grayscale_x2.jpg");
lena = imread("Lena_nb.jpg");

fig = fig + 1;
figure(fig);
subplot(2, 2, 1), imshow(cameraman_b), title('Image originale')
subplot(2, 2, 3), imshow(ouverture(cameraman_b,3, 'square')), title('Après ouverture')
subplot(2, 2, 4), imshow(fermeture(cameraman_b,3, 'square')), title('Après fermeture')
saveas(gcf, 'images/Test ouverture_fermeture', 'png');


fig = fig + 1;
figure(fig);
imshow(gradient_morpho(lena));
title("Détection de contours")
saveas(gcf, 'images/detection_contour', 'png');


lena_n = imnoise(lena, 'salt & pepper', 0.05);
lena_ng = imnoise(lena, 'gaussian', 0, 0.01);

fig = fig + 1;
figure(fig);
subplot(2, 2, 1), imshow(lena), title('Lena')
subplot(2, 2, 3), imshow(lena_n), title('Lena (+bruit)')
subplot(2, 2, 4), imshow(lena_ng), title('Lena (+bruit gaussien)')
saveas(gcf, 'images/lena + bruit', 'png');


fig = test_filtres(lena, 'lena', lena_n, fig, 'impulsionnel');
fig = test_filtres(lena, 'lena', lena_ng, fig, 'gaussien');