%%read AVIs, break into frame by frame %%
function still_frames = avi_processing(mp4_file)
video = VideoReader(mp4_file);

path = '/Users/mayamazumder/MATLAB/Projects/rats/videos';

%loop through each frame and make jpg
ii = 1;
while hasFrame(video)
   frame = readFrame(video);
   filename = [sprintf('frame%d',(ii + 14552)) '.jpg'];
   fullname = fullfile(path, 'images' ,filename);
   imwrite(frame,fullname)    % Write out to a JPEG file (img1.jpg, img2.jpg, etc.)
   ii = ii+1;
end
%take everything in this folder and make it a cell array of images
still_frames = dir(fullfile(path, 'images','*.jpg'));
still_frames = {still_frames.name}';
end