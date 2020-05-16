%Code from ENEL 503 L9 Slides 20 - 22
ImB = imread('TestShapes.png');
[B, L] = bwboundaries(ImB);
figure; imshow(ImB), hold on;

for k = 1 : length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:, 1), 'g', 'LineWidth', 2);
end

hold off;

[L, N] = bwlabel(ImB);
ImC = label2rgb(L, 'hsv', [.5 .5 .5], 'shuffle');
figure; imshow(ImC); hold on;

for k = 1:N
    boundary = B{k};
    plot(boundary(:, 2), boundary(:, 1), 'w', 'LineWidth', 2);
    text(boundary(1, 2) - 11, boundary(1, 1) + 11, num2str(k), 'color', 'yellow', 'FontSiz', 10, 'FontWeight', 'bold');
end
hold off;

%Extraction of Features
Stats = regionprops(L, 'all');
temp = zeros(1, N);

for k = 1:N
    %Compute thiness ratio
    temp(k) = 4 * pi * Stats(k, 1).Area / (Stats(k, 1).Perimeter)^2;
    Stats(k, 1).ThinnessRatio = temp(k);
    
    %compute aspect ratio
    temp(k) = (Stats(k, 1).BoundingBox(3)) / (Stats(k, 1).BoundingBox(4));
    Stats(k, 1).AspectRatio = temp(k);
end

Features = uint16(zeros(N, 8));

for k = 1:N
    Features(k, 1) = k; %Object #
    Features(k, 2) = Stats(k, 1).Area;
    Features(k, 3) = Stats(k, 1).Centroid(1);
    Features(k, 4) = Stats(k, 1).Centroid(2);
    Features(k, 5) = Stats(k, 1).Perimeter;
    Features(k, 6) = Stats(k, 1).EulerNumber;
    Features(k, 7) = Stats(k, 1).ThinnessRatio;
    Features(k, 8) = Stats(k, 1).AspectRatio;
end

Table = array2table(Features);
Table.Properties.VariableNames ={'Object', 'Area', 'Centroid1', 'Centroid2', 'Permieter', 'EulerNumber', 'ThinnessRatio', 'AspectRatio'};
disp(Table);