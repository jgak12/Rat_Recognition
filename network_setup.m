%%THIS FUNCTION:
%sets input image size and number of object classes
%Preprocesses the training and validation data
%Runs an anchor box dimension estimator from the input data
%loads the resnet feature extractor
%Sets an activation layer
%Establishes the yolov2 network based on these parameters
%(SECOND STEP IN NETWORK WORKFLOW) --> train.m

%data initialize
%ratTrainData= preprocess();


xsize= 640; %both temp., will replace with values from preprocessing
ysize= 480;

%sets the size of the input images
imageSize= [ysize xsize 3]; 
classesNum= 1; %for now this is just 1(rat),
                %could be more if we look for more features later

% load dataset here (processed image, box labels)
%Preprocess Data
processedTrainData= transform(augmentedTrainData, @(data)preprocessData(data,imageSize));
processedValData= transform(valData, @(data)preprocessData(data,imageSize));

data= read(processedTrainData);
%data= read(processedTrainData)

I = data{1};
bbox = data{2};
annotatedImage = insertShape(I,'Rectangle',bbox);
annotatedImage = imresize(annotatedImage,2);
figure
imshow(annotatedImage)

%This will estimate the proper anchor box size based on the boxes
%that we have drawn on the training data
numAnchors= 5;
[boxes, meanIoU]=estimateAnchorBoxes(processedTrainData,numAnchors);

%load feature extration network (too complicated to make ourselves)
%could try replacing with a scanning window if we hate ourselves later
featureExtraction= resnet50;

%sets activation function
featureLayer= 'activation_40_relu';

lgraph= yolov2Layers(imageSize,classesNum,boxes,featureExtraction,featureLayer);
