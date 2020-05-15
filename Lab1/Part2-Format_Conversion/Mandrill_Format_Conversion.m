imgs = repmat({}, 8);

%Import Mandrill.png and convert it into 7 different file formats
%C/G/B/SC/R/G2/B3
imgs(1, 1).image = imread("Mandrill.png");
imgs(1, 2).image = rgb2gray(imgs(1, 1).image);
imgs(1, 3).image = imbinarize(imgs(1, 2).image, 0.4);
imgs(1, 4).image = grayslice(imgs(1,2).image, 10);
imgs(1, 5).image = imgs(1, 1).image;
imgs(1, 6).image = imgs(1, 1).image(:,:,1);
imgs(1, 7).image = imgs(1, 1).image(:,:,2);
imgs(1, 8).image = imgs(1, 1).image(:,:,3);

%Names for each of the created 7 file formats
titles = [ "MandrillC", "MandrillG", "MandrillB", "MandrillSC", "MandrillC", "MandrillR1", "MandrillG2", "MandrillB3"];

%Loop through each of the images in the imgs data structure
for i = 1 : length(imgs)
    
    % Special case to plot the SC image format
    if i == 4
        subplot(2,4,i), imshow(imgs(1, i).image, jet(10));
        title(titles(i));
   %Plot each of the created file formats with titles
   else
   subplot(2,4,i), imshow(imgs(1,i).image);
   title(titles(i));
   end
end
