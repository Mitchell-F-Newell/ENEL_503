function [enhancedImg] = Algorithm2()

    Img = imread("Statue.png");
    mask = strel('disk', 3);

    openImg = imopen(Img, mask);
    closeImg = imopen(Img, mask);

    enhancedImg = Img + (Img - openImg) - (closeImg - Img);
end