%Written by Rayna
%Debugged by John ~1 hour
function [total_distance] = distance_traveled_version2(table_x, start, finish, outputPlot)
    working_table = table_x; %use output from John's movement tracker
    total_distance = 0;
    if finish > size(working_table,1)-1 
        finish = size(working_table,1)-1; %makes sure that it's not trying to read off the end of the table
    end
    for i = start:finish
        x1 = working_table{i,2}; %taking the value from the xlist column of the table
        y1 = working_table{i,3}; %taking the value from the ylist column of the table
        x2 = working_table{(i+1),2};
        y2 = working_table{(i+1),3};
    
        distance = sqrt((x2 - x1)^2 + (y2 - y1)^2);
        total_distance = total_distance + distance;
  
    end
     x = working_table{:,2};
     y = working_table{:,3};
     if outputPlot==true
         figure
         plot(x,y) %plot of where the rat was over the course of the frames
     end
    total_distance; %displays the total distance the rat moved over the course of the frames you selected
end
