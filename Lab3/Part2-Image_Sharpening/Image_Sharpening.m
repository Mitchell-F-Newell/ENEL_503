Im = imread("Moon.tif");
Inoi = imnoise(Im,'gaussian',0.01);
Fblur = fspecial('average', 5);
Iblur = imfilter(Inoi,Fblur);

SharpIm = (Im - Iblur) + Im;

subplot(1,2, 1), imshow(Im);
title("Original Image");
subplot(1,2, 2), imshow(SharpIm);
title("Sharpened Image");




