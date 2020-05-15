imgs = repmat({}, 6);

imgs(1, 1).image = imread("Fig1.jpg");
imgs(1, 2).image = imread("Fig2.jpg");
imgs(1, 3).image = imread("Fig12.jpg");
imgs(1, 4).image = imread("Rand1.jpg");
imgs(1, 5).image = imread("Rand2.jpg");
imgs(1, 6).image = imread("Mandrill.png");

filename = [ "Fig1a.jpg", "Fig2a.jpg", "Fig12a.jpg", "Rand1a.jpg", "Rand2a.jpg", "Mandrilla.png"];
titles = [ "Fig1 Gray", "Fig2 Gray", "Fig 12 Gray", "Rand1 Gray", "Rand2 Gray", "Mandrill Gray"];
for i = 1 : length(imgs)
   imgs(1, i).image = rgb2gray(imgs(1, i).image);
   imgs(1, i).image = imresize(imgs(1, i).image, [500, 500]);
   imwrite(imgs(1, i).image, filename(i));
   subplot(2,3, i), imshow(imgs(1,i).image);
   title(titles(i));
end


