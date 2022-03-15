function dataset = randomize()
%creates a folder of 100 random images from all of our video frame to make
%diverse datasets for training
mkdir dataset3
ii = 1;
while ii < 100
    number = randperm(40481, 1);
    number = num2str(number);
    frame = dir(['frame' number '.jpg']);
    frame = getfield(frame, {1}, 'name');
    if isempty(frame)
        ii = ii - 1;
    else 
        movefile(frame, 'dataset3');
    end
    ii = ii + 1;
end
end