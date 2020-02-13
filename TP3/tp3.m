lena = imread("Lena_nb.jpg");
monde = imread("monde.png");
dominos = imread("dominos.png");
fig = 0;
close all;

fig = fig + 1;
figure(fig);
subplot(1, 3, 1), imshow(lena)
subplot(1, 3, 2), imshow(monde)
subplot(1, 3, 3), imshow(dominos)

% Filtres passe haut

h3 = [[-1 -1 -1];[0 0 0];[1 1 1]]
h4 = [[-1 -2 -1];[0 0 0];[1 2 1]]
h5 = [[0 1 0];[1 -4 1];[0 1 0]]

%Problème d'application du masque sur les bords de l'image
help conv2
% Etant donné que les filtres "agissent" sur l'image par leur pixel central, les bords de l'image risquent de poser problème. En effet, il faut choisir entre n'appliquer le filtre que sur l'image (et donc ne pas réaliser de convolution sur les pixels au bord de l'image) ou ajouter des pixels après le bord de l'image (un padding) pour pouvoir appliquer le filtre sur les bords. La fonction conv2 permet de faire ça automatiquement par l'attribut SHAPE.
% Afin d'appliquer le filtre sur l'entièreté de l'image, nous avons décidé d'utiliser le paramètre SHAPE = 'same'.

% Application des filtres H3 et H4
fig = fig + 1;
figure(fig);
subplot(2, 2, 1), convol(monde, h3, false), title('Monde.png avec H3')
subplot(2, 2, 2), convol(monde, h3', false), title('Monde.png avec H3^T')
subplot(2, 2, 3), convol(monde, h4, false), title('Monde.png avec H4')
subplot(2, 2, 4), convol(monde, h4', false), title('Monde.png avec H4^T')
saveas(gcf, '010_monde_h3&h4','png');
% Le fait d'appliquer une seule fois (et ne pas appliquer leur transposée) les filtres h3 ou h4 sur l'image ne permet de détecter qu'une partie des contours présents dans l'image, ce qui explique la présence de lignes discontinues.

% Détection des contours diagonaux avec H3
h3_d = [[0 1 2];[-1 0 1];[-2 -1 0]]
fig = fig + 1;
figure(fig);
convol(monde, h3_d, false), title('Détection des contours diagonaux avec H3')
saveas(gcf, '020_detection_contour_h3','png');

% Doubles convolutions vs H5
fig = fig + 1;
figure(fig);
subplot(2,2,1), imshow(monde), title('Image originale')
subplot(2,2,2), convol(monde, h5, false), title('Convolution H5')
subplot(2,2,3), convol(monde, h3, true), title('Double convolution H3')
subplot(2,2,4), convol(monde, h4, true), title('Double convolution H4')
saveas(gcf, '030_convol_h5','png');

% Augmentation du contraste de l'image
image = lena;
contraste = image - uint8(convol_in(image, h5, false));
fig = fig + 1;
figure(fig);
subplot(1, 2, 1), imshow(contraste), title('Image contrastée')
subplot(1, 2, 2), imshow(image), title('Image originale')
saveas(gcf, '040_augment_contraste','png');

% Filtres passe bas

h1 = (1/9) * [[1 1 1];[1 1 1];[1 1 1]]
h2 = (1/16) * [[1 2 1];[2 4 2];[1 2 1]]

% Application des filtres H1 et H2
fig = fig + 1;
figure(fig);
subplot(1, 2, 1), convol(lena, h1, false), title('Lena + Filtre H1')
subplot(1, 2, 2), convol(lena, h2, false), title('Lena + Filtre H2')
saveas(gcf, '050_lena_h1&h2','png');

% Différences avec le sur-échantillonnage
cameraman_1 = imread('cameraman_interp_up_2.jpg');
cameraman_2 = imread('cameraman_interp_up_4.jpg');

fig = fig + 1;
figure(fig);
subplot(2, 2, 1), imshow(cameraman_1), title('Cameraman sur-échantillonné (x2)')
subplot(2, 2, 3), convol(cameraman_1, h1, false), title('Sur-échantillonnage + Filtre H1')
subplot(2, 2, 4), convol(cameraman_1, h2, false), title('Sur-échantillonnage + Filtre H2')
saveas(gcf, '060_surechantillon_1_h1&h2','png');

fig = fig + 1;
figure(fig);
subplot(2, 2, 1), imshow(cameraman_2), title('Cameraman sur-échantillonné (x4)')
subplot(2, 2, 3), convol(cameraman_2, h1, false), title('Sur-échantillonnage + Filtre H1')
subplot(2, 2, 4), convol(cameraman_2, h2, false), title('Sur-échantillonnage + Filtre H2')
saveas(gcf, '070_surechantillon_2_h1&h2','png');


% Augmentation de la taille de H1
fig = fig + 1;
figure(fig);
subplot(2, 2, 1), imshow(lena), title('Image originale')
subplot(2, 2, 2), convol(lena, expand_mask(h1, 1), false), title('H1 + 1')
subplot(2, 2, 3), convol(lena, expand_mask(h1, 2), false), title('H1 + 2')
subplot(2, 2, 4), convol(lena, expand_mask(h1, 3), false), title('H1 + 3')
saveas(gcf, '080_lena_h1_expanded','png');
% Le fait d'augmenter la taille du filtre H1 éclaircit énormément l'image. En effet, augmenter la taille du filtre augmente le nombre de pixels adjacents pris en compte dans le calcul de la "moyenne".
