function [enhancedImg] = Algorithm1()

    Img = imread("Statue.png");
    mask = strel('disk', 3);

    tophatImg = imtophat(Img, mask);
    bottomhatImg = imbothat(Img, mask);

    enhancedImg = Img + tophatImg - bottomhatImg;
end