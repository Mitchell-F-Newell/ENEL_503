% Code adapted from ENCM 503 L8 slides 35-38
ImC = imread('Flowers.jpg');
ImG = rgb2gray(ImC);

%Gradient Magnitude as the segmentation Function
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(ImG), hy, 'replicate');
Ix = imfilter(double(ImG), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2); %generate gradient distribution

%Mark the foreground objects
se = strel('rectangle', [15, 25]);
Io = imopen(ImG, se);
Ie = imerode(ImG, se);
Iobr = imreconstruct(Ie, ImG);
Ioc = imclose(Io, se);
Iobrd = imdilate(Iobr, se);
Iobrcbr = imreconstruct( imcomplement(Iobrd), imcomplement(Iobr) );
Iobrcbr = imcomplement(Iobrcbr);
fgm = imregionalmax(Iobrcbr);
I2 = ImG;
I2(fgm) = 255;
se2 = strel(ones(5, 5));
fgm2 = imclose(fgm, se2);
fgm3 = imerode(fgm2, se2);
fgm4 = bwareaopen(fgm3, 20);
I3 = ImG;
I3(fgm4) = 255;

%Compute background markers
bw = imbinarize(Iobrcbr);
D = bwdist(bw);
DL = watershed(D);
bgm = DL == 0;

%Compute the watershed transformation of the segmentation function
gradmag2 = imimposemin(gradmag,bgm | fgm4);
L = watershed(gradmag2);

%VIsualize the result
I4 = ImG;

I4(imdilate(L == 0, ones(3, 3)) | bgm | fgm4) = 255;
Lrgb = label2rgb(L, 'jet', 'w', 'shuffle');

figure
subplot(1, 4, 1), imshow(ImC), title('Original');
subplot(1, 4, 2), imshow(bgm), title('Watershed lines');
subplot(1, 4, 3), imshow(I4), title('Segmented');
subplot(1, 4, 4), imshow(Lrgb), title('Composed');
