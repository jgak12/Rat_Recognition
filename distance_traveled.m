%function that will detect whether a rat is freezing based on its x and y
%coordinates not changing

% output will be boxes with four coordinates (top left x position, top left y position,
% width, height)
%while loop that's true when there are new frames to check

function [total_distance] = distance_traveled(table_x, start, finish)
%

a = table_x;
%disp(a(1,1)); %output is a cell with an array inside of it -- need to write code that pulls out those values for one cell
a{:,2};
n = 1; %eventually going to do n = a to b
start = 1;
finish = height(a);
total_distance = 0;
    for n = start:finish
        coords1 = a.Rat{n};
        x1 = coords1(1);
        y1 = coords1(2);
        w1 = coords1(3);
        h1 = coords1(4);
        
        x_m1 = x1+(w1/2);
        y_m1 = y1+(h1/2);
        
        coords2 = a.Rat{n+1};
        x2 = coords2(1);
        y2 = coords2(2);
        w2 = coords2(3);
        h2 = coords2(4);
        
        x_m2 = x2+(w2/2);
        y_m2 = y2+(h2/2);
        
        distance = sqrt((x_m2 - x_m1)^2 + (y_m2 - y_m1)^2);
        total_distance = total_distance + distance;
    end
end

%char(a{1,"Rat"})
%table2array(table_x)

%(x,y,w,h)
%   x_0 = x
%   y_0 = y
%   x_m = x_0 + (w/2)
%   y_m = y_0 + (h/2)
%   midpoint = (x_m, y_m)
%need to add something that goes from frame to frame and stores midpoint of each box
%distance = sqrt((x_m2 - x_m1)^2 + (y_m2 - y_m1)^2)
% run it by calling distance_traveled(a)
%loop that runs from time point b to time point c
%start by getting total distance traveled

% figure
% plot (x_m, y_m)



%end