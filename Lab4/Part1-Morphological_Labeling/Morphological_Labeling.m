%Code Adapted from ENEL 503 L8 slide 40
ImC = imread('Universe.jpg');
ImG = rgb2gray(ImC);
Gth = 0.2;
subplot(2,3, 1), imshow(ImC);
title("Original Image");
subplot(2,3, 2), imshow(ImG);
title("Gray Image");

thresholdArray = [0.3 0.6 0.8];
titleArray = ["Threshold: 0.3", "Threshold: 0.6", "Threshold: 0.8"]; 
for th = 1:3
    Imbw = im2bw(ImG, thresholdArray(th) );
    [LabeledIm, Objects] = bwlabel(Imbw, 4);
    starNumber = "Observed stars: " + newline + Objects;
    
    subplot(2,3, th + 3), imshow(Imbw);
    title(titleArray(th) + newline + starNumber);
end