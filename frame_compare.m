function [xavg,yavg,markedImg] = frame_compare(frame1,frame2)
    %FRAME_COMPARE Summary of this function goes here
    %   Detailed explanation goes here

    x_out=0;
    y_out=0;
    %markedImg=0;

    a=frame1;
    b=frame2;
    
    % load(fullfile(path,"image_0001.jpg"))
    % load(fullfile(path,"image_0002.jpg"))
    
    
    
    figure
    subplot(2,2,1)
    imshow(a);
    subplot(2,2,2)
    imshow(b);
    
    c= a-b;
    subplot(2,2,3)
    imshow(c);
    xavg=0;
    yavg=0;
    
    a(1,1,1)
    difArray= zeros(size(a,1),size(a,2));
    totPixelDif=0;
    numNonZpixels=0;
    for pixelx=1: size(a,2)
        for pixely=1:size(a,1)
            for pixelrgb=1:3
                chanPixelDif= c(pixely,pixelx,pixelrgb);
                totPixelDif= totPixelDif+ chanPixelDif;
            end
            if totPixelDif>25
                difArray(pixely,pixelx)=totPixelDif;
            end
            totPixelDif=0;
        end
    end
    
    subplot(2,2,4)
    %imshow(difArray);
    
    weightTot=0;
    for pixelx=1: size(difArray,2)
        for pixely=1:size(difArray,1)
            %Attempted to weight position averages by intensity and got
            %confused. Just going to do avg pos for now
            %JK gonna try anyway
            xavg= xavg + (difArray(pixely,pixelx)*pixelx);
            yavg= yavg +(difArray(pixely,pixelx)*pixely);
    
            weightTot= weightTot + difArray(pixely,pixelx);
    
        end
    end
    xavg=round(xavg/weightTot);
    yavg=round(yavg/weightTot);
    pos= [xavg yavg];
    
    dot= insertMarker(difArray,pos,'plus');
    markedImg= insertMarker(a,pos,'plus');
    imshow(dot)
    figure
    imshow(markedImg)
    
end

