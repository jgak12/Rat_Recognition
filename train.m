tempdir= 'C:\Users\jmara\OneDrive\Desktop\Rat video series\temp training';

options = trainingOptions('sgdm', ...
        'MiniBatchSize',16, ....
        'InitialLearnRate',1e-3, ...
        'MaxEpochs',20, ... 
        'CheckpointPath',tempdir, ...
        'ValidationData',processedValData);

checkData= load('C:\Users\jmara\OneDrive\Desktop\Rat video series\temp training\yolov2_checkpoint__15__2022_03_12__16_19_43');
checkpoint= checkData.detector;

%[detector,info] = trainYOLOv2ObjectDetector(processedTrainData,lgraph,options);
[detector,info] = trainYOLOv2ObjectDetector(processedTrainData,checkpoint,options);