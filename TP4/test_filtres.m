function fig = test_filtres(image, image_title, noised, fig, bruit)

%noised = imnoise(lena, 'salt & pepper', proba);
%g_noised = imnoise(lena, 'gaussian', 0, variance);

% fig = fig + 1;
% figure(fig);
% imshow(image);
% title(strcat('Image originale (bruit ', bruit, ')'))

filename = ['images/' image_title ' + bruit ' bruit];

fig = test_filtre(noised, fig, 'average', 'Filtre moyenneur', [filename ' - f_moyenneur'], '');

fig = test_filtre(noised, fig, 'gaussian', 'Filtre gaussien', [filename ' - f_gaussien'], '');

fig = test_filtre(noised, fig, 'median', 'Filtre médian', [filename ' - f_median'], '');

shapes = ["square" "diamond" "disk"];
for shape = shapes
    fig = test_filtre(noised, fig, 'ouverture', 'Ouverture', strcat([filename ' - ouverture ('], shape, ')'), shape);
end

for shape = shapes
    fig = test_filtre(noised, fig, 'fermeture', 'Fermeture', strcat([filename ' - fermeture ('], shape, ')'), shape);
end

end

