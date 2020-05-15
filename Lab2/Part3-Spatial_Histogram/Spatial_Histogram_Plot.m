Image = imread("SH_Test.tif");
[X, Y] = size(Image);
Hx = zeros(1, X);
Hy = zeros(1, Y);

for i = 1 : X
    sum = 0;
    for j = 1 : Y
        sum = sum + double(Image(i, j));
    end
    Hx(1, i) = sum / Y;
end

for i = 1 : Y
    sum = 0;
    for j = 1 : X
        sum = sum + double(Image(j, i));
    end
    Hy(1, i) = sum / X;
end

subplot(1, 3, 1), imshow(Image), title("Original Image");
subplot(1, 3, 2), plot(Hx), title("X");
subplot(1, 3, 3), plot(Hy), title("Y");