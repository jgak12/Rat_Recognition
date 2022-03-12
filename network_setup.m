
%data initialize
%%ratTrainData= preprocess();


xsize= 640; %both temp., will replace with values from preprocessing
ysize= 480;

%sets the size of the input images
imageSize= [xsize ysize 3]; 
classesNum= 1; %for now this is just 1(rat),
                %could be more if we look for more features later

% load dataset here (processed image, box labels)

%This will estimate the proper anchor box size based on the boxes
%that we have drawn on the training data
numAnchors= 5;
[boxes, meanIoU]=estimateAnchorBoxes(ratTrainData,numAnchors);

%load feature extration network (too complicated to make ourselves)
%could try replacing with a scanning window if we hate ourselves later
featureExtraction= resnet50;

%sets activation function
featureLayer= 'activation_40_relu';

lgraph= yolov2Layers(imageSize,classesNum,boxes,featureExtraction,featureLayer);
