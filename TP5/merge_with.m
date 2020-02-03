## Copyright (C) 2020 pierr
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} merge_with (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

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
