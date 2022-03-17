%function [outputArg1,outputArg2] = untitled(inputArg1,inputArg2)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here

    %newbase='C:\jokeplace\'
    newbase='/gpfs/home/jmaragak/NetworkTrain/Rat_Recognition/FullData/'

    load('C:\Users\jmara\OneDrive\Documents\MATLAB\Rat_Recog\ImageLabeled\TrainingTable\CleanFnL.mat')
    %load('/gpfs/home/jmaragak/NetworkTrain/Rat_Recognition/ImageLabeled/TrainingTable/CleanFnL.mat')


    outputTable= FilesAndLabels;
    label= char(outputTable{1,1})
    a=length(label)
    ind=0;
    for i=1:a
        if label(i)== '\' || label(i)=='/'
            ind= i;
        end
    end


    disp(label(1:ind));
    disp(label);


    %inputTable{1,1}={'hi'};
    for i=1:size(outputTable,1)
        fullName= char(outputTable{i,1});
        imgTag= fullName(ind+1:end);
        outputTable(i,1)= {strcat(newbase, imgTag)};
    end
    CleanFnLNew= outputTable;





%end