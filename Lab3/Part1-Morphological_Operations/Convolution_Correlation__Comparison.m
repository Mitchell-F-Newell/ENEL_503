P = [0 0 0; 0 5 8; 0 5 2];
M= [-2 -1 0; -1 1 1; 0 1 1];
Mmir = [1 1 0; 1 1 -1; 0 -1 -2];

convolution = conv2(M, P);
correlation = conv2(Mmir, P);

Img1 = matrix2binary(P);
Img2 = matrix2binary(M);
Img3 = matrix2binary(convolution);
Img4 = matrix2binary(correlation);

subplot(2,3, 1), imshow(Img1);
title("Original Image (P)");
subplot(2,3, 2), imshow(Img2);
title("Mask (M)");
subplot(2,3, 3), imshow(Img3);
title("Convolution M*P")
subplot(2,3, 4), imshow(Img1);
title("Original Image (P)");
subplot(2,3, 5), imshow(Img2);
title("Mask (M)");
subplot(2,3, 6), imshow(Img4);
title("Correlation  M(.)P");

