function modified = ouverture(image, size, shape)

    if strcmp(shape, "disk")
        se = strel(shape, size, 0);
    else
        se = strel(shape,size);
    se
    dilated = imdilate(image, se);
    modified = imerode(dilated,se);

end

