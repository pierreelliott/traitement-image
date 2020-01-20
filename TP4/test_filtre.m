function fig = test_filtre(noised, fig, filtre, nom_filtre, filename, option)

fig = fig + 1;
figure('visible', 'off', 'Name', filename);
subplot(3, 2, 1), imshow(noised), title('Image bruitée');
j = 2;
% Variations du filtre
for i = 3:2:11
    modified = apply_filter(noised, filtre, i, option);
    titre = [nom_filtre '(' num2str(i)];
    if not(strcmp(option, ''))
        titre = strcat(titre, ',', option);
    end
    titre = strcat(titre, ')');
    subplot(3, 2, j), imshow(modified), title(titre);
    j = j +1;
end
saveas(gcf, filename,'png');

end

