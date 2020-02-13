## Author: pierr <pierr@LAPTOP-RPAK4954>
## Created: 2020-02-03

function reconstructed = merge_with (image, style)
  
  image_fft = fft2(image);
  phase = angle(fftshift(image_fft));
  %module = abs(fftshift(image_fft));
  image_size = size(image);
  style_fft = fft2(style, image_size(1), image_size(2));
  %phase = angle(fftshift(image_fft));
  module = abs(fftshift(style_fft));
  reconstructed = uint8(real(ifft2(fftshift(module .* exp(1i*phase)))));

endfunction
