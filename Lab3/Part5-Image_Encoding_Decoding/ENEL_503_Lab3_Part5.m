Barcode = zeros(16, 16);
Str = 'Hello World! This is my barcode.';
StrB = reshape(dec2bin(Str, 8).'-'0', 1, []);

for i = 1:size(Barcode, 1)
    for j = 1:size(Barcode, 2)
        Barcode(i, j) = StrB(((i - 1)*16) + j);
    end
end

Image = mat2gray(Barcode);
subplot(1,1,1), imshow(Image);
title('Generated Barcode');

