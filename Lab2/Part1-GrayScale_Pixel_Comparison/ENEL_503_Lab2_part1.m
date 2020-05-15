imgs = repmat({}, 6);

%Import Mandrill.png and convert it into 6 different file formats
%C/G/R/G2/B3/ImGs
imgs(1, 1).image = imread("Mandrill.png");
imgs(1, 2).image = rgb2gray(imgs(1, 1).image);
imgs(1, 3).image = imgs(1, 1).image(:,:,1);
imgs(1, 4).image = imgs(1, 1).image(:,:,2);
imgs(1, 5).image = imgs(1, 1).image(:,:,3);
imgs(1, 6).image = (0.2989 * imgs(1, 3).image + 0.5870 * imgs(1, 4).image + 0.1140 * imgs(1, 5).image);

%Determine the mean pixel (kappa) value for each image
kappaValue1 = mean(imgs(1, 2).image (:)) / 255;
kappaValue2 = mean(imgs(1, 6).image (:)) / 255;
differenceKappa = kappaValue1 - kappaValue2;
%Plot each of the images in the imgs data structure and title it with
%it's corresponding kappa value
subplot(1,2, 1), imshow(imgs(1,2).image);
title(kappaValue1);
subplot(1,2, 2), imshow(imgs(1,6).image);
title(kappaValue2);




