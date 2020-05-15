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

Message = blanks(32);
tempBinChar = zeros(1, 8);
tempBinChar2 = zeros(1, 8);
value = 1;

for i = 1:16
    for j = 1:8
        tempBinChar(j) = Barcode(i, j);
        tempBinChar2(j) = Barcode(i, j + 8);
    end
    
    tmpStrA = mat2str(tempBinChar);
    tmpStrA = erase(tmpStrA, "[");
    tmpStrA = erase(tmpStrA, "]");
    tmpStrA = erase(tmpStrA, " ");
    Message(value) = bin2dec(tmpStrA);
    value = value + 1;
    
    tmpStrB = mat2str(tempBinChar2);
    tmpStrB = erase(tmpStrB, "[");
    tmpStrB = erase(tmpStrB, "]");
    tmpStrB = erase(tmpStrB, " ");
    Message(value) = bin2dec(tmpStrB);
    value = value + 1;
end

disp(Message);