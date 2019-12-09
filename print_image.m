function  print_image(matrix,filename, func)

    figure('visible', 'off')
    title(filename)
    if func == 1
        imshow(matrix,[])
    elseif func == 2
        histogram(matrix)
    end
    axis off
    print(filename,'-djpeg');
    
end

