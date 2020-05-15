imgs = repmat({}, 6);
%Initialize data structure that will hold the similarity values
similarities = zeros(6, 6);

%Import each of the images and save them in local data structure
imgs(1, 1).image = imread("Fig1a.jpg");
imgs(1, 2).image = imread("Fig2a.jpg");
imgs(1, 3).image = imread("Fig12a.jpg");
imgs(1, 4).image = imread("Rand1a.jpg");
imgs(1, 5).image = imread("Rand2a.jpg");
imgs(1, 6).image = imread("Mandrilla.png");

%Loop through each image
for i = 1 : length(imgs)
    %Loop the images again (To compare image i with image j)
    for j = 1 : length(imgs)
        %Initialize sum variable
        sum = 0;
        %Loop through the pixels along the Y axis
        for k = 1 : 500
            %Loop through pixels along the X axis
            for l = 1: 500
                %Calculates difference between pixels and updates the sum
                %value
                sum = sum + abs(double(imgs(1, j).image(k, l)) - double(imgs(1, i).image(k, l)));
            end
            %Calculates the similarity values
            similarities(i, j) = 1 - (sum/(255 * 500 * 500));
        end
    end
end

disp("Gabor values comparison table: ");
%Create the similarities comparison table
simTable = array2table(similarities);
%Define titles for both the role and column
simTable.Properties.VariableNames = ["Fig1a", "Fig2a", "Fig12", "Rand1a", "Rand2a", "Mandrilla"];
simTable.Properties.RowNames = [ "Fig1a", "Fig2a", "Fig12a", "Rand1a.", "Rand2a", "Mandrilla"];
%Display the similarities comparison table
display(simTable);
