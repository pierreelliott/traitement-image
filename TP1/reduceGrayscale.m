function [outputImage] = reduceGrayscale(inputImage)
outputImage = bitsra(inputImage, reduced);
outputImage = bitsll(outputImage, reduced);
end

