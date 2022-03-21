%function that will detect whether a rat is freezing based on its x and y
%coordinates not changing

%specify inputs, outputs
%true if frozen, or adds a count given x y positions from labeler and a whole video
% output will be boxes with four coordinates (top left x position, top left y position,
% width, height)

%center point will be midpint of rectangle --> x and y position

%write function that uses input x and y (center of box) 
%if pixels vary by more than w amount between q nmber of frames -->
%not frozen

%make w up top as a system parameter that we can change easily and set to
%whatever number works best later

%output: could be csv with timestamp and frames, etc. THINK ABOUT THIS

%will take an array of all of the x and y positions at every frame

%could also make a function that draws a line on top of the video -- WOULD
%THIS BE EASIER? 
%draw a dot where the midpoint of the box is, do the same in the next frame, draw a line between them, etc.