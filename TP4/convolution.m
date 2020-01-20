function img = convolution(img, filtre, with_transpo)
    % Applique le filtre à l'image et applique également sa transposée si
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