function img = convolution(img, filtre, with_transpo)
    % Applique le filtre � l'image et applique �galement sa transpos�e si
    % 'with_transpo' == True
    convol1 = conv2(img, filtre, 'same');
    if(with_transpo)
        convol2 = conv2(img', filtre, 'same');
        img = sqrt(power(convol1, 2) + power(convol2', 2));
    else
        img = convol1;
    end
    img = uint8(img);
end