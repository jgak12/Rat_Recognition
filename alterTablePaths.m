%By John write/debug ~2 hours

function [OutputTable] = alterTablePaths(inputTable,newbasepath)
    %Takes a Nx2 table with image filepaths in the first column and
    %bounding box coordinates in the second. Replaces path with input
    %'newbasepath' but keeps image name and order.

    %Example: when going from Windows to Oracle Linux
    %newbasepath='/gpfs/home/jmaragak/NetworkTrain/Rat_Recognition/FullData/'
    
    %Function used to take input table filepath, but currently can be run
    %just by giving the input table itself
    %inputTable= importdata('C:\Users\jmara\OneDrive\Documents\MATLAB\Rat_Recog\ImageLabeled\TrainingTable\CleanFnL.mat');
    %load('/gpfs/home/jmaragak/NetworkTrain/Rat_Recognition/ImageLabeled/TrainingTable/CleanFnL.mat')

    %finds the index of the actual filenames from the full paths in the
    %table
    outputTable= inputTable;
    label= char(outputTable{1,1});
    a=length(label);
    ind=0;
    for i=1:a
        if label(i)== '\' || label(i)=='/'
            ind= i;
        end
    end


    disp(label(1:ind));
    disp(label);


    %inputTable{1,1}={'hi'};
    %changes the filepaths in the first column of the table to the
    %newbasepath + filenames
    for i=1:size(outputTable,1)
        fullName= char(outputTable{i,1});
        imgTag= fullName(ind+1:end);
        outputTable(i,1)= {strcat(newbasepath, imgTag)};
    end
    OutputTable= outputTable;
end





%end