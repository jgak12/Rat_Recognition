%function that takes bounding box arrays that finds the midpoint x and y
% going to take xlist in column 2 and ylist in column 3
function [midpoint_table] = box_to_midpoint(table_x)
    a = table_x;
    a{1,"Rat"};
    n = 1;
    start = 1;
    finish = height(a);
    total_distance = 0;
    %table1 = table()
    %two column filled with NaNs, populate the table each time you go
    %through the for loop
    for n = start:finish
        coords = a.Rat{n};
        x = coords(1);
        y = coords(2);
        w = coords(3);
        h = coords(4);
        
        x_m = x+(w/2);
        y_m = y+(h/2);

   
        table1 = table(x_m, y_m)
    end
end

