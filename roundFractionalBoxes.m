%NOTE: NOT OUR CODE, MATLAB PROVIDED

function boxes = roundFractionalBoxes(boxes, imageSize)
% If fractional data is present, issue one-time warning and round data and
% clip to image size.
persistent hasIssuedWarning

allPixelCoordinates = isequal(floor(boxes), boxes);
if ~allPixelCoordinates
    
    if isempty(hasIssuedWarning)
        hasIssuedWarning = true;
        warning('Rounding ground truth bounding box data to integer values.')
    end
    
    boxes = round(boxes);
    boxes(:,1:2) = max(boxes(:,1:2), 1); 
    boxes(:,3:4) = min(boxes(:,3:4), imageSize([2 1]));
end
end