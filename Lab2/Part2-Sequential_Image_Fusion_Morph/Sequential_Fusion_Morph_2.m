originalImages = repmat({}, 2);
morphImages = repmat({}, 4);

originalImages(1, 1).image = imread("Im21.jpg");
originalImages(1, 2).image = imread("Im22.jpg");

intermediateImg = originalImages(1, 1).image;

X = size(originalImages(1, 1).image, 1);
Y = size(originalImages(1, 2).image, 2);

subplot(1, 5, 1), imshow(originalImages(1, 1).image);
for i = 1 : 4
    for j = 1 : 3
        for k = 1 : X
            for l = 1 : Y
                img1 = double(originalImages(1, 1).image(k, l, j));
                img2 = double(originalImages(1, 2).image(k, l, j));
                
                intermediateImg(k, l, j) = img2 + (1 - (i/4)) * (img1 - img2);
            end
        end
    end 
morphImages( 1, i + 1).image = intermediateImg;
end

for i = 2 : 5
    subplot(1, 5, i), imshow(morphImages(1, i).image);
end