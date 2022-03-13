%%read AVIs, break into frame by frame %%
function still_frames = avi_processing(avi_file)
video = VideoReader(avi_file);

%loop through each frame and make jpg
ii = 1;
while hasFrame(video)
   frame = readFrame(video);
   filename = [sprintf('ratvideo%d',ii) '.jpg'];
   fullname = fullfile(workingDir, sprintf('images%d', avi_file),filename);
   imwrite(frame,fullname)    % Write out to a JPEG file (img1.jpg, img2.jpg, etc.)
   ii = ii+1;
end
%take everything in this folder and make it a cell array of images
still_frames = dir(fullfile(workingDir,sprintf('images%d', avi_file),'*.jpg'));
still_frames = {still_frames.name}';
end