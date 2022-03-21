%%paired w frame_compare
%will take an input of a file path full of image files in sequence
%returns a table of xy values for each file

%path= 'C:\Users\jmara\OneDrive\Desktop\Rat video series\DifferenceTrain'
path='/Users/johnmaragakis/Documents/GitHub/Rat_Recognition/DifferenceImgs';

loc= path;
files= dir(loc);
list= {files.name};

img1= imread(fullfile(loc,list{1,3}));
imgList=[]; %maybe change to zeros() to preallocate later on
xlist=[];
ylist=[];

for i= 3:15 %size(list,2)-1

%     img1=imread(fullfile(path,"image_0001.jpg"));
%     img2=imread(fullfile(path,"image_0002.jpg"));


        img1=imread(fullfile(path,list{1,i}));
        img2=imread(fullfile(path,list{1,i+1}));
        [x y z]= frame_compare(img1,img2);
        imgList=[imgList;list{1,i+1}];
        xlist= [xlist;x];
        ylist= [ylist;y];
        

end
t= table(imgList,xlist,ylist);



% % load(fullfile(path,"image_0001.jpg"))
% % load(fullfile(path,"image_0002.jpg"))
% 
% 
% 
% figure
% subplot(2,2,1)
% imshow(a);
% subplot(2,2,2)
% imshow(b);
% 
% c= a-b;
% subplot(2,2,3)
% imshow(c);
% xavg=0;
% yavg=0;
% 
% a(1,1,1)
% difArray= zeros(size(a,1),size(a,2));
% totPixelDif=0;
% numNonZpixels=0;
% for pixelx=1: size(a,2)
%     for pixely=1:size(a,1)
%         for pixelrgb=1:3
%             chanPixelDif= c(pixely,pixelx,pixelrgb);
%             totPixelDif= totPixelDif+ chanPixelDif;
%         end
%         if totPixelDif>25
%             difArray(pixely,pixelx)=totPixelDif;
%             numNonZpixels= numNonZpixels +1;
%         end
%         totPixelDif=0;
%     end
% end
% 
% subplot(2,2,4)
% %imshow(difArray);
% 
% weightTot=0;
% for pixelx=1: size(difArray,2)
%     for pixely=1:size(difArray,1)
%         %Attempted to weight position averages by intensity and got
%         %confused. Just going to do avg pos for now
%         %JK gonna try anyway
%         xavg= xavg + (difArray(pixely,pixelx)*pixelx);
%         yavg= yavg +(difArray(pixely,pixelx)*pixely);
% 
%         weightTot= weightTot + difArray(pixely,pixelx);
% 
%     end
% end
% numpixels= numNonZpixels;
% xavg=round(xavg/weightTot);
% yavg=round(yavg/weightTot);
% pos= [xavg yavg];
% 
% dot= insertMarker(difArray,pos,'plus');
% dotImg= insertMarker(a,pos,'plus');
% imshow(dot)
% figure
% imshow(dotImg)
