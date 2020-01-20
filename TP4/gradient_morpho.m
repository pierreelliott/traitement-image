function modified = gradient_morpho(image)

    se = strel('square',3);
    eroded = imerode(image,se);
    dilated = imdilate(image,se);
    modified = dilated - eroded;

end

