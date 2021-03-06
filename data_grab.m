%By John for neural network setup ~6 hours

% %%This script: 
% loads the table with img filepaths and bounding box coordinates
% shows 2 random images on screen
% splits data into training, validation, and test sets
% displays a sample image with its box
% augments the training data with augmentData
%(FIRST STEP IN TRAINING WORKFLOW) --> network_setup


% load('prac_data.mat');
% origData= prac_data;

%loads the input table of image paths and corresponding bounding boxes
%load('C:\Users\jmara\OneDrive\Documents\MATLAB\Rat_Recog\ImageLabeled\TrainingTable\CleanFnLNew.mat');
load('C:\Users\jmara\OneDrive\Documents\MATLAB\Rat_Recog\ImageLabeled\TrainingTable\CleanFnL.mat');

%visualizes a few of those images
%Original Blank images caused by the fact that the first image is a black
%screen in the test file
figure
% imshow('C:\Users\jmara\OneDrive\Desktop\Rat video series\JohnsImages\pic2001.jpg')
subplot(1,2,1)
imshow('C:\Users\jmara\OneDrive\Desktop\Rat video series\FullDataSet\pic195.jpg')
subplot(1,2,2)
imshow('C:\Users\jmara\OneDrive\Desktop\Rat video series\FullDataSet\pic3000.jpg')
% imshow()

%copies data to origData
origData= FilesAndLabels;
%origData=CleanFnLNew;

rng(0);
shuffleIndices=randperm(height(origData)); % randomizes order of image indices
idx= floor(0.8 * length(shuffleIndices)); %sets first 60%

trainingIdx= 1:idx;
trainingSet= origData(shuffleIndices(trainingIdx),:); %pulls first 60% of data into training

validationIdx= idx+1 : idx+1+ floor(0.1 * length(shuffleIndices));
validationSet= origData(shuffleIndices(validationIdx),:); %pulls next 10% to validate

testIdx= validationIdx(end)+1: length(shuffleIndices);
testSet= origData(shuffleIndices(testIdx),:);

imgTrain= imageDatastore(trainingSet{:,'imageFilename'}); %Was Var1
labelTrain= boxLabelDatastore(trainingSet(:,'Rat')); 

imgVal= imageDatastore(trainingSet{:,'imageFilename'});
labelVal= boxLabelDatastore(trainingSet(:,'Rat'));

imgTest= imageDatastore(trainingSet{:,'imageFilename'});
labelTest= boxLabelDatastore(trainingSet(:,'Rat'));

%Combine datastores
trainingData = combine(imgTrain,labelTrain);
valData= combine(imgVal, labelVal);
testData= combine(imgTest, labelTest);

%test
check= read(trainingData);
%check= read(trainingData);
I= check{1};
bbox= check{2};

%inserts boxes onto the images
imageWBox= insertShape(I,"Rectangle",bbox);
imageWBox= imresize(imageWBox,2);
figure
imshow(imageWBox)

%Augment Training Data
augmentedTrainData= transform(trainingData,@augmentData);

% Visualize the augmented images.
augmentedData = cell(4,1);
for k = 1:4
    data = read(augmentedTrainData);
    %data= read(augmentedTrainData);
    augmentedData{k} = insertShape(data{1},'Rectangle',data{2});
    reset(augmentedTrainData);
end
figure
montage(augmentedData,'BorderSize',10)

