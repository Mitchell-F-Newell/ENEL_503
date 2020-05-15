In = imread("LennaGNoise.jpg");

%Arithmetic mean filter
Filter1 = fspecial('average', [5 5]);
If1 = imfilter(In, Filter1);

%Laplacian mean filter
If2 = imgaussfilt(In, 1);

subplot(1,3, 1), imshow(In);
title("Original Image");
subplot(1,3, 2), imshow(If1);
title("Average filter Image");
subplot(1,3, 3), imshow(If2);
title("Gaussian filter Image");




