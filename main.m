%%MAIN FXN

img_folder_path= '/DifferenceImgs';

%MAC
path_to_imgfolder= [pwd img_folder_path];

%This runs the difference tracker and makes pos data,
%in the meantime, loading trackedOutput from old data is faster
%%posTable= differenceTracker(path_to_imgfolder,1);
posTable= trackedOutput;

totDistance= distance_traveled_version2(posTable,1,10000000);
