function dataset = randomize()
%creates a folder of 100 random images from all of our video frame to make
%diverse datasets for training
mkdir dataset6
for ii = 1:100
    number = randperm(32798, 1);
    number = num2str(number);
    frame = dir(['*' number '*']);
    frame = getfield(frame, {1}, 'name');
    copyfile(frame, 'dataset1');
end
end