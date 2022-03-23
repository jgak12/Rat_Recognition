%function that will detect whether a rat is freezing based on its x and y
%coordinates not changing



function [total_distance] = distance_traveled_version2(table_x, start, finish)
    working_table = table_x;
    total_distance = 0;
    if finish > size(working_table,1)-1
        finish = size(working_table,1)-1;
    end
    for i = start:finish
        x1 = working_table{i,2};
        y1 = working_table{i,3};
        x2 = working_table{(i+1),2};
        y2 = working_table{(i+1),3};
    
        distance = sqrt((x2 - x1)^2 + (y2 - y1)^2);
        total_distance = total_distance + distance;
    end
    total_distance
end
