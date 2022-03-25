%%paired w frame_compare
%will take an input of a file path full of image files in sequence
%returns a table of xy values for each file
function [outputTable]= differenceTracker(path,checkInterval)

%path= 'C:\Users\jmara\OneDrive\Desktop\Rat video series\DifferenceTrain'
%%%%path='/Users/johnmaragakis/Documents/GitHub/Rat_Recognition/DifferenceImgs';

    loc= path;
    files= dir(loc);
    list= {files.name};
    
    img1= imread(fullfile(loc,list{1,3}));
    imgList=[]; %maybe change to zeros() to preallocate later on
    xlist=[];
    ylist=[];
    
    
    x_last=320;
    y_last=240;
    figure;
    for i= 3:checkInterval:size(list,2)-1
    %for i= 3:14
    
    %     img1=imread(fullfile(path,"image_0001.jpg"));
    %     img2=imread(fullfile(path,"image_0002.jpg"));
    
    
            img1=imread(fullfile(path,list{1,i}));
            img2=imread(fullfile(path,list{1,i+1}));
    % For testing 2 frame compare methods
    % compare is weighted by amount of change, compare_test is not weighted
    %         [p r q]= frame_compare(img1,img2);
    %         [x y z]= frame_compare_test(img1,img2);
    %         
    %         figure
    %         subplot(1,2,1)
    %         imshow(q);
    %         subplot(1,2,2)
    %         imshow(z);
    %         
            [x y z]=frame_compare(img1,img2);
    
            imgList=[imgList;list{1,i+1}];
            
            if x~=0
                xlist= [xlist;x];
                ylist= [ylist;y];
                x_last=x;
                y_last=y;
                imshow(z,'InitialMagnification',8000);
            else
                temp_loc= [x_last y_last];
                imshow(insertMarker(z,temp_loc,'plus'),'InitialMagnification',8000);
                xlist=[xlist;x_last];
                ylist=[ylist;y_last];
            end
            
    
           % pause(0.0001);
    end



    %%This is a test for checking a smaller box for differences once
    %%original position is found
%     for i=15:checkInterval:size(list,2)-1
%         img1=imread(fullfile(path,list{1,i}));
%         img2=imread(fullfile(path,list{1,i+1}));
%         [x y z]=frame_compare(img1,img2);
%     
%         imgList=[imgList;list{1,i+1}];
%         
%         if x~=0
%             xlist= [xlist;x];
%             ylist= [ylist;y];
%             x_last=x;
%             y_last=y;
%             imshow(z);
%         else
%             temp_loc= [x_last y_last];
%             imshow(insertMarker(z,temp_loc,'plus'));
%             xlist=[xlist;x_last];
%             ylist=[ylist;y_last];
%         end
%     end

    outputTable= table(imgList,xlist,ylist);
end
