function [g] = grayTonicityCheck(x1,y1,x2,y2,Im)
    sum = 0;
    count = 0;
    for i = x1 : x2
        for j = y1: y2
            sum = sum + double(Im(i, j));
        end
    end
    g = sum / count;