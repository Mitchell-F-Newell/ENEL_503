function [Image] = matrix2binary(matrix)
    for i = 1:size(matrix, 1)
        for j = 1:size(matrix, 2)
            if matrix(i, j) <= 0
                matrix(i, j) = 0;
            else
                matrix(i, j) = 1;
            end
        end
    end

    Image = mat2gray(matrix);
end