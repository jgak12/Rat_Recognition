function [] = trackOverlay(inputTable)
    pathStart='/Users/johnmaragakis/Documents/GitHub/Rat_Recognition/DifferenceImgs/';
    
    working=inputTable;
    figure
%     a= importdata(strcat(pathStart,working{1,1}));
%     a=insertShape(a,'Line',[working{1,2} working{1,3} working{1+1,2} working{1+1,3}]);
%     imshow(a);

    linepos= zeros(size(working,1),4);
    for l= 1:size(working,1)-1
        linepos(l,1)=working{l,2};
        linepos(l,2)=working{l,3};
        linepos(l,3)=working{l+1,2};
        linepos(l,4)=working{l+1,3};
    end

    for i=1:size(working,1)-1
        a= importdata(strcat(pathStart,working{i,1}));
        a=insertShape(a,'Line',linepos(1:i,:));
        imshow(a,'InitialMagnification',8000);
        %pause(0.25);
    end

end