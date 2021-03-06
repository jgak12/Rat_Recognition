%Implemented by John ~1 hour
%This function needs to randomly flip, and scale data
%should also do the same to all the boxes
%Also color jitter
%NOTE: NOT ENTIRELY OUR CODE, MATLAB PROVIDED (edited now)
%most of the work here was implementing their code into our program 

function B = augmentData(A)
    % Apply random horizontal flipping, and random X/Y scaling. Boxes that get
    % scaled outside the bounds are clipped if the overlap is above 0.25. Also,
    % jitter image color.
    
    B = cell(size(A));
    
    I = A{1};
    sz = size(I);
    if numel(sz)==3 && sz(3) == 3
        I = jitterColorHSV(I,...
            'Contrast',0.1,...
            'Hue',0,...
            'Saturation',0.05,...
            'Brightness',0.1);
    end
    
    % Randomly flip and scale image.
    tform = randomAffine2d('XReflection',true,'YReflection',true);
    rout = affineOutputView(sz,tform,'BoundsStyle','CenterOutput');
    B{1} = imwarp(I,tform);
    
    % Sanitize box data, if needed.
    A{2} = helperSanitizeBoxes(A{2}, sz);
    
    % Apply same transform to boxes.
    [B{2},indices] = bboxwarp(A{2},tform,rout,'OverlapThreshold',0.25);
    B{3} = A{3}(indices);
    
    % Return original data only when all boxes are removed by warping.
    if isempty(indices)
        B = A;
    end
end

