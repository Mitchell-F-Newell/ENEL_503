Img = imread("Statue.png");

enhancedImg1 = Algorithm1;
enhancedImg2 = Algorithm2;

subplot(1,3, 1), imshow(Img);
title("Original Image");
subplot(1,3, 2), imshow(enhancedImg1);
title("Algorithm 1");
subplot(1,3, 3), imshow(enhancedImg2);
title("Algorithm2");
