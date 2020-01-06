clear;
close all;
imdata = imread('mandrill.bmp');
sizeIm = size(imdata)
nbOctets = sizeIm(1) * sizeIm(2) * sizeIm(3)
imfinfo('mandrill.bmp')

fprintf("2. Quantification")
fprintf("Infos sur les niveaux de gris")
imfinfo('cameraman.jpg')

fprintf("Réduction du niveau de gris de l'image (modifier le paramètre 'reduced')\n")
DO_GRAYSCALE = true;

if DO_GRAYSCALE
    im_cameraman = imread('cameraman.jpg');
    scales = [1:8];
    
    for reduced = scales
        im_reduced = im_cameraman;
        im_reduced = im_reduced/(2.^reduced);
        im_reduced = im_reduced*(2.^reduced);
        print_image(im_reduced,strcat('cameraman_grayscale_x',num2str(2.^(8-reduced+1))), 1);
    end
end

fprintf("Downscale l'image\n")
down2 = im_cameraman(1:2:end,1:2:end);
down4 = im_cameraman(1:4:end,1:4:end);

print_image(down2,'cameraman_downscale_2',1);

print_image(down4,'cameraman_downscale_4',1);

fprintf("Upscale l'image\n")
% Fonctionne pas...
[x_up2,y_up2] = meshgrid(1:128);
interp_up2 = interp2(double(down2),x_up2,y_up2);

[x_up4,y_up4] = meshgrid(1:64);
interp_up4 = interp2(double(down4),x_up4,y_up4);

%figure
%imagesc(interp_up2)
%colormap gray
%axis off
print_image(interp_up2,'cameraman_interp_up_2',1);

%figure
%imagesc(interp_up4)
%colormap gray
%axis off
print_image(interp_up4,'cameraman_interp_up_4',1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf("Espaces colorimétriques\n")
pool = imread('pool.jpg');
colors = ["red";"green";"blue"];
colors_min = [];
colors_max = [];

for i = 1:3
    print_image(pool(:,:,1),strcat('pool_',colors(i),'_to_gray'),1);
    color = pool;
    removing = (1:3);
    removing(i) = [];
    color(:,:,removing) = 0;
    print_image(color,'pool_red',1);
    colors_min(i) = min(nonzeros(color));
    colors_max(i) = max(nonzeros(color));
end

pool_yuv = rgb2ycbcr(pool);
for i = 1:3
    print_image(pool(:,:,1),strcat('pool_yuv_',num2str(i),'_to_gray'),1);
    %{
    color = pool;
    removing = (1:3);
    removing(i) = [];
    color(:,:,removing) = 0;
    print_image(color,'pool_red',1);
    colors_min(i) = min(nonzeros(color));
    colors_max(i) = max(nonzeros(color));
    %}
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('7 différences\n');

im1 = imread('erreurs_7_1.jpg');
im2 = imread('erreurs_7_2.jpg');

diff = abs(im1-im2) + abs(im2-im1);
print_image(diff, '7 differences',1);

im1_m = im1;
im1_m(:,:,1) = im1_m(:,:,1) + diff(:,:,1);
print_image(im1_m,'Image 1 with diff',1);

im2_m = im2;
im2_m(:,:,1) = im2_m(:,:,1) + diff(:,:,1);
print_image(im2_m,'Image 2 with diff',1);


%figure, axis on, histogram(R(:,:,1));