%Maya

function dataset = randomize()
%creates a folder of 100 random images from all of our video frame to make
%diverse datasets for training
mkdir Rayna
ii = 1;
while ii < 1001
    number = randperm(44476, 1);
    number = num2str(number);
    frame = dir(['frame' number '.jpg']);
    frame = getfield(frame, {1}, 'name');
    if isempty(frame)
        ii = ii - 1;
    else 
        movefile(frame, 'Rayna');
    end
    ii = ii + 1;
dataset = frame;
end
end