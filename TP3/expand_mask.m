function mask = expand_mask(mask, expansion)
    % Augmente la dimension du masque de 'expansion', ne fonctionne qu'avec
    % les masques uniformes (ex: H1)
    % Ex: (3, 3) -> (4, 4)
    val = mask(1,1);
    mask = val * ones(size(mask) + expansion);
end