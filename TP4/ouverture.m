function modified = ouverture(image, size, shape)

    se = strel(shape,size);
    dilated = imdilate(image, se);
    modified = imerode(dilated,se);

end

