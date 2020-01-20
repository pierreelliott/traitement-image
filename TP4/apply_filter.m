function modified = apply_filter(image, filtre, size, option)

if strcmp(filtre, 'ouverture')
    modified = ouverture(image, size, option);
elseif strcmp(filtre, 'fermeture')
    modified = fermeture(image, size, option);
elseif strcmp(filtre, 'median')
    modified = medfilt2(image, [size size]);
elseif strcmp(filtre, 'gaussian')
    modified = convolution(image, fspecial(filtre, size, 5), false);
else
    modified = convolution(image, fspecial(filtre, size), false);
end

end

