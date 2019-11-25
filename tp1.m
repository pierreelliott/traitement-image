clear;
imdata = imread('mandrill.bmp');
sizeIm = size(imdata)
nbOctets = sizeIm(1) * sizeIm(2) * sizeIm(3)
imfinfo('mandrill.bmp')

"2. Quantification"
"Infos sur les niveaux de gris"
imfinfo('cameraman.jpg')

"R�duction du niveau de gris de l'image (modifier le param�tre 'reduced')"
im_cameraman = imread('cameraman.jpg');
im_reduced = im_cameraman

reduced = 6;
im_reduced = im_reduced/(2.^reduced);
im_reduced = im_reduced*(2.^reduced);
imshow(im_reduced)

"Downscale l'image"
down2 = im_cameraman(1:2:end,1:2:end);
down4 = im_cameraman(1:4:end,1:4:end);

imshow(down4)

"Upscale l'image"
interp_up2 = interp2(single(down2),1);
interp_up4 = interp2(single(down4),3);

imagesc(interp_up4)
colormap gray
axis off