function modified = fermeture(image, size, shape)
    
    se = strel(shape,size);
    eroded = imerode(image,se);
    modified = imdilate(eroded, se);

end

