function modified = fermeture(image, size, shape)
    
    if strcmp(shape, "disk")
      se = strel(shape, size, 0);
    else
      se = strel(shape,size);
    eroded = imerode(image,se);
    modified = imdilate(eroded, se);

end

