% Flower Extraction using the color information in the query image
% Step 1: Establish the system
% Location of the compressed data set
url = 'http://www.robots.ox.ac.uk/~vgg/data/flowers/17/17flowers.tgz';
% Store the output in a temporary folder
outputFolder = fullfile(tempdir, '17Flowers');   % define output folder
if ~exist(outputFolder, 'dir')                   % download only once
    disp('Downloading 17-Category Flower Dataset (58 MB)...');
    untar(url, outputFolder);
end
flowerImageSet = imageDatastore(fullfile(outputFolder,'jpg'),'LabelSource','foldernames');

% Step 2: Select the image features for retrieval
% The following function returns matching images with a similarity of 0.95
% or higher
queryImageNum = 100;
[matchIndex, similarity] = similarityMatch(queryImageNum, flowerImageSet);
if(matchIndex > 0)
    subplot(1,2,1), imshow(readimage(flowerImageSet, queryImageNum)), title("Original query Image");
    subplot(1,2,2), imshow(readimage(flowerImageSet, matchIndex)), title("Matching Image" + newline + "Similarity = " + similarity);
else
    disp("No matching image was found for image index 100");
end

function [index, returnSim] = similarityMatch(queryImageNum, imgs) 
    index = -1;
    returnSim = -1;
    queryImage = readimage(imgs, queryImageNum);
    [X,Y,Z] = size(queryImage);
    %Loop through each image
    for i = 1 : 600
        %skip similarity check against the queryImage
        if(i == queryImageNum) 
            continue;
        end
        %get image "i" from the imgs set
        Img = readimage(imgs, i);
        %resize image to be the same size as the query image
        Img = imresize(Img, [X,Y]);

        %Initialize sum variable
        sum = 0;
        %Loop through the pixels along the X axis
        for j = 1 : X
            %Loop through pixels along the Y axis
            for k = 1: Y
                %RGB pixels
                for l = 1:3
                    %Calculates difference between pixels and updates the sum
                    sum = sum + abs(double(queryImage(j, k, l)) - double(Img(j, k, l)));
                end
            end
        end
        %Calculates the similarity values
        similarity = 1 - (sum / (255 * X * Y * Z));
        %If similarity is >= 0.95 consider it a match and return
        if(similarity >= 0.95)
            index = i;
            returnSim = similarity;
        end
    end
end
