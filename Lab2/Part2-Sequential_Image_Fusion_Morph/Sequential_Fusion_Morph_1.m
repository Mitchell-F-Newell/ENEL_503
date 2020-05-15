originalImages = repmat({}, 2);
morphImages = repmat({}, 4);

originalImages(1, 1).image = imread("Im21.jpg");
originalImages(1, 2).image = imread("Im22.jpg");
subplot(1, 5, 1), imshow(originalImages(1,1).image); 

for i = 1 : 4
    factor = 1 - (i/4);
    morphImages(1, i).image = (originalImages(1,2).image - factor * originalImages(1,2).image + ...
        factor * originalImages(1,1).image);
    subplot(1,5,i + 1), imshow(morphImages(1, i).image);
end