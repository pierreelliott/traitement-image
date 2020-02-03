function filtered = filter (image, filtre, ssize)
  
  %sfiltre = fspecial(filtre, size);
  elt = strel('disk', ssize, 0)
  resize = size(image) - size(elt)
  filter = padarray(getnhood(test), image_size, direction="both");
  % Multiply image by filter
  %filtered = conv2(image, sfiltre, 'same');

endfunction
