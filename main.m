%%MAIN FXN
%Runs all functionality of this repo on any image dataset loaded into the
%program
%John ~1 hour
%This unfortunately does not represent all the time that went into
%establishing a neural network for rat identification (~18 hours), because
%it could not be finished in time.
%Its functionality was replaced by a simple motion detector
%'differenceTracker'

img_folder_path= '/DifferenceImgs';

%MAC
path_to_imgfolder= [pwd img_folder_path];

%This runs the difference tracker and makes pos data,
%in the meantime, loading trackedOutput from old data is faster
posTable= differenceTracker(path_to_imgfolder,2);
%posTable= trackedOutput;

%outputs total distance traveled by the rat marker in pixels
totDistance= distance_traveled_version2(posTable,1,10000000,true);

%outputs a graph of when the ratmarker was frozen
plot= freezing(posTable);

%input('press Enter to show tracking','s')

%outputs the input video annotated with the rat's path
trackOverlay(posTable);





