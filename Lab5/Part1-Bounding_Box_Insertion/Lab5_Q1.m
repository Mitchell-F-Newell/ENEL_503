% Accidents by machine-learning-based Facial detection
faceDetector = vision.CascadeObjectDetector();
ImC = imread('People.jpg');
bbox = step(faceDetector, ImC);
Faces = insertShape(ImC, 'Rectangle', bbox);
subplot(2,1,1), imshow(Faces); title('bbox21: Detected faces');

%Manually insert the 3 missing bounding boxes to previous bbox array
bbox(22:24, 1:4) = [0,50,30,30; 70,100,30,30; 110,95,35,35];
%Re-display the bounding boxes and create new facecs image
Faces = insertShape(ImC, 'Rectangle', bbox);
%display new image with the 24 bounding boxes
subplot(2,1,2),imshow(Faces); title('bbox24: Detected faces');

%loop through each boundary box
for i = 1:24
    %crop the portion of the image that the boundary box contains
    croppedImg = imcrop(ImC, bbox(i, 1:4));
    %plot the extracted face
    subplot(4,6,i), imshow(croppedImg);
end