Im = imread("car1.jpg");
Im2 = Im;
Im3 = rgb2gray(Im);
Im4 = Im3;
[Shadowr, Shadowg, Shadowb] = tonicityCheck(140,115,144,119,Im);
Shadowgray = grayTonicityCheck(140,115,144,119,Im);
[Backgroundr, Backgroundg, Backgroundb] = tonicityCheck(160, 50, 170, 60,Im);
Backgroundgray = grayTonicityCheck(160, 50, 170, 60,Im);

for i = 1 : 180
    for j = 1 : 320
        if abs( double(Im(i, j, 1)) - Shadowr) < 0.79 * double(Im(i, j, 1)) && ...
           abs( double(Im(i, j, 2)) - Shadowg) < 0.79 * double(Im(i, j, 2)) && ...
           abs( double(Im(i, j, 3)) - Shadowb) < 0.79 * double(Im(i, j, 3))
            Im2(i, j, 1) = Backgroundr;
            Im2(i, j, 2) = Backgroundg;
            Im2(i, j, 3) = Backgroundb;
        end
    end
end

for i = 1 : 180
    for j = 1 : 320
        if abs( double(Im(i, j)) - Shadowgray) < 0.59 * double(Im(i, j))
            Im4(i, j) = Backgroundgray;
        end
    end
end

subplot(3, 2, 1), imshow(Im), title("TheCar");
subplot(3, 2, 2), imshow(Im3), title("TheGrayCar");
subplot(3, 2, 3), imshow(Im4), title("RemovedShadowGrayCar");
subplot(3, 2, 4), imshow(Im2), title("RemovedShadowCar");