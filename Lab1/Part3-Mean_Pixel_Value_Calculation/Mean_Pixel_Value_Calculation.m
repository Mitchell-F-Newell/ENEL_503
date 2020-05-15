imgs = repmat({}, 6);

%Import each of the images and save them in local data structure
imgs(1, 1).image = imread("Fig1a.jpg");
imgs(1, 2).image = imread("Fig2a.jpg");
imgs(1, 3).image = imread("Fig12a.jpg");
imgs(1, 4).image = imread("Rand1a.jpg");
imgs(1, 5).image = imread("Rand2a.jpg");
imgs(1, 6).image = imread("Mandrilla.png");

%Loop through each of the images in the imgs data structure 
for i = 1 : length(imgs)
   %Determine the mean pixel (kappa) value for each image
   kappaValue = mean(imgs(1, i).image (:)) / 255;
   %Plot each of the images in the imgs data structure and title it with
   %it's corresponding kappa value
   subplot(2,3, i), imshow(imgs(1,i).image);
   title(kappaValue);
end
