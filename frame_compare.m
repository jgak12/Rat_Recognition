%Written by John as a function of differenceTracker (~4 hours)
%%% Paired w differenceTracker

function [xavg,yavg,markedImg] = frame_compare(frame1,frame2)
    %FRAME_COMPARE Summary of this function goes here
    %   Returns weighted center position of all movement in an image as
    %   well as the second image with a marker placed
    % If change is not enough to trigger a position: [0 0 unmarkedImg] is
    % returned

    %sets sensitivity to trigger location change
    sens_coef=1.1; %alter this only
    sensitivity= sens_coef*10000000;

    x_out=0;
    y_out=0;
    %markedImg=0;

    a=frame1;
    b=frame2;
    
    % load(fullfile(path,"image_0001.jpg"))
    % load(fullfile(path,"image_0002.jpg"))
    
    
    
%     figure
%     subplot(2,2,1)
%     imshow(a);
%     subplot(2,2,2)
%     imshow(b);
    
    %subtracts the two images' values
    c= a-b;

%     subplot(2,2,3)
%     imshow(c);
    xavg=0;
    yavg=0;
    
    %creates a 2d array(difArray) that sums each pixel's differences across all 3
    %channels
    a(1,1,1);
    difArray= zeros(size(a,1),size(a,2));
    totPixelDif=0;
    numNonZpixels=0;
    for pixelx=1: size(a,2)
        for pixely=1:size(a,1)
            for pixelrgb=1:3
                chanPixelDif= c(pixely,pixelx,pixelrgb);
                totPixelDif= totPixelDif+ chanPixelDif;
            end
            if totPixelDif>100
                difArray(pixely,pixelx)=totPixelDif;
            end
            totPixelDif=0;
        end
    end
    
%     subplot(2,2,4)
    %imshow(difArray);
    
    %calculates rat location by taking the weighted average of all pixel
    %locations with differences
    weightTot=0;
    for pixelx=1: size(difArray,2)
        for pixely=1:size(difArray,1)

            xavg= xavg + (difArray(pixely,pixelx)*pixelx);
            yavg= yavg +(difArray(pixely,pixelx)*pixely);
    
            weightTot= weightTot + difArray(pixely,pixelx);
    
        end
    end
    
    %determines if enough difference was detected in the entire image to
    %justify a position update (determined by sensitivity)
    if xavg>sensitivity
        xavg=round(xavg/weightTot);
        yavg=round(yavg/weightTot);
        pos= [xavg yavg];
    else %returns 0 0 if change is below threshold
        xavg=0;
        yavg=0;
        pos=[xavg yavg];
    end
    
    %loads images with their markers
    if pos(1)>0 && pos(1)<640 && pos(2)>0 && pos(2)<480
        dot= insertMarker(difArray,pos,'plus');
        markedImg= insertMarker(b,pos,'plus');
    else
        dot= difArray;
        markedImg=b;
    end
    
    %imshow(dot)
    %figure
    %imshow(markedImg);
    
end

