function convol(img, filtre, with_transpo)
    % Applique la convolution et affiche l'image
    a = convol_in(img, filtre, with_transpo);
    imshow(a)
end