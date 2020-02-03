function filtered = filter (image, filtre, size)
  
  sfiltre = fspecial(filtre, size);
  filtered = conv2(image, sfiltre, 'same');

endfunction
