%% this script begins training on the neural network setup in the last step(network_setup)
%sets checkpoint filepath and training options
%begins training
%run on computer with NVIDIA GPU if at all possible (requires parallel
%processing toolbox)

%change to your own desired location
tempdir= 'C:\Users\jmara\OneDrive\Desktop\Rat video series\temp training';

%these settings dont work great but idk why
options = trainingOptions('sgdm', ...
        'MiniBatchSize',32, .... %%%was 16, but I'm upping it
        'InitialLearnRate', 25e-7, ... %%%1e-3, ...
        'MaxEpochs',20, ...
        'Plots', 'training-progress', ...%%% add plots and shuffle
        'Shuffle', 'every-epoch', ...
        'Verbose',true, ...
        'VerboseFrequency',10, ...
        'CheckpointPath',tempdir, ...
        'ValidationData',processedValData);

%use this block if resuming training
%checkData= load('C:\Users\jmara\OneDrive\Desktop\Rat video series\temp training\yolov2_checkpoint__35__2022_03_17__13_29_26');
%checkpoint= checkData.detector;

%training for a new network
%[detector,info] = trainYOLOv2ObjectDetector(processedTrainData,lgraph,options);

%training from a checkpoint
[detector,info] = trainYOLOv2ObjectDetector(processedTrainData,checkpoint,options);