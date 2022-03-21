tempdir= 'C:\Users\jmara\OneDrive\Desktop\Rat video series\temp training';

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

checkData= load('C:\Users\jmara\OneDrive\Desktop\Rat video series\temp training\yolov2_checkpoint__35__2022_03_17__13_29_26');
checkpoint= checkData.detector;

%[detector,info] = trainYOLOv2ObjectDetector(processedTrainData,lgraph,options);
[detector,info] = trainYOLOv2ObjectDetector(processedTrainData,checkpoint,options);