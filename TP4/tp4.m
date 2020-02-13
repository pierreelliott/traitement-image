clear;
close all;
pkg load image;
fig = 0;

cameraman_b = imread("cameraman_grayscale_x2.jpg");
lena = imread("Lena_nb.jpg");

fig = fig + 1;
figure(fig);
subplot(2, 2, 1), imshow(cameraman_b), title('Image originale')
subplot(2, 2, 3), imshow(ouverture(cameraman_b,3, 'square')), title('Après ouverture')
subplot(2, 2, 4), imshow(fermeture(cameraman_b,3, 'square')), title('Après fermeture')
saveas(gcf, 'images/Test ouverture_fermeture', 'png');

h5 = [[0 1 0];[1 -4 1];[0 1 0]];

fig = fig + 1;
figure(fig);
subplot(1, 2, 1), imshow(gradient_morpho(lena)), title("Détection de contours (gradient morpho)")
subplot(1, 2, 2), convol(lena, h5, false), title('Détection de contours (filtre H5)')
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