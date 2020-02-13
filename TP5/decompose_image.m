function decompose_image (image, titre)
  
  image_fft = fft2(image);
  phase = angle(fftshift(image_fft));
  module = abs(fftshift(image_fft));
  figure()
  subplot(1,2,1), imshow(phase), title(strcat('Phase (', titre, ')'))
  subplot(1,2,2), imshow(module), title(strcat('Module (', titre, ')'))
  saveas(gcf, strcat('images/phase & module - ', titre), 'png');

endfunction
