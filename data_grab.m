

load('prac_data.mat');
origData= prac_data;

rng(0);
shuffleIndices=randperm(height(origData)); % randomizes order of image indices
idx= floor(0.6 * length(shuffleIndices)); %sets first 60%

trainingIdx= 1:idx;
trainingSet= origData(shuffleIndices(trainingIdx),:); %pulls first 60% of data into training

validationIdx= idx+1 : idx+1+ floor(0.1 * length(shuffleIndices));
validationSet= origData(shuffleIndices(validationIdx),:); %pulls next 10% to validate

testIdx= validationIdx(end)+1: length(shuffleIndices);
testSet= origData(shuffleIndices(testIdx),:);

imgTrain= imageDatastore(trainingSet{:,'Var1'});
labelTrain= boxLabelDatastore(trainingSet(:,'Rat'));

imgVal= imageDatastore(trainingSet{:,'Var1'});
labelVal= boxLabelDatastore(trainingSet(:,'Rat'));

imgTest= imageDatastore(trainingSet{:,'Var1'});
labelTest= boxLabelDatastore(trainingSet(:,'Rat'));

%Combine datastores
trainingData = combine(imgTrain,labelTrain);
valData= combine(imgVal, labelVal);
testData= combine(imgTest, labelTest);

%test
check= read(trainingData);
I= check{1};
bbox= check{2};

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
    augmentedData{k} = insertShape(data{1},'Rectangle',data{2});
    reset(augmentedTrainData);
end
figure
montage(augmentedData,'BorderSize',10)

