A = [0 0 0 0 0; 0 1 1 0 0; 0 1 1 0 0; 0 0 1 0 0; 0 0 0 0 0];
Mask = [1 1; 1 1];

Image1 = matrix2binary(A);
Image2 = matrix2binary(Mask);
Image3 = imdilate(A, Mask);
Image4 = imdilate(Mask, A);
Image5 = imerode(A, Mask);
Image6 = imerode(Mask, A);

subplot(2,4, 1), imshow(Image1);
title("Image1 (A)");
subplot(2,4, 2), imshow(Image2);
title("Image2(Mask)");
subplot(2,4, 3), imshow(Image3);
title("Image3 (S(+)A)")
subplot(2,4, 4), imshow(Image4);
title("Image4 (A(+)S)");
subplot(2,4, 5), imshow(Image5);
title("Image1 (A)");
subplot(2,4, 6), imshow(Image6);
title("Image2(Mask)");
subplot(2,4, 7), imshow(Image5);
title("Image5 (S(-)A)");
subplot(2,4, 8), imshow(Image6);
title("Image6 (A(-)S)");

