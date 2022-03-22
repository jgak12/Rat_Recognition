%COMBINE DATA STORES
%%Another nightmare function from using datastores.
%% it worked eventually but again, combining tables is much easier then converting to datastores separately

% [n, ~] = size(gTruth.DataSource);
% newstr = 'FullDataSet';
% for i=1:n
%     q=class(gTruth.DataSource{1,1}) %lol says cant use brace indexing
%     tochange = gTruth.DataSource{i,1};
%     pieces = strsplit(tochange, '\');
%     pieces{1,7} = newstr;
%     together = strjoin(pieces,'\');
%     gTruth.DataSource{i,1} = groundTruthDataSource(together);
% end


% load('ImageLabeled\Rayna_fixed.mat')
% a= cell2table(gTruth.DataSource.Source)
% load('ImageLabeled\Maya_fixed.mat')
% b= cell2table(gTruth.DataSource.Source)
% load('ImageLabeled\John_fixed.mat')
% c= cell2table(gTruth.DataSource.Source)


class(gTruth.LabelData)
load('ImageLabeled\Rayna_fixed.mat')
%a= cell2table(gTruth.LabelData)
load('ImageLabeled\Maya_fixed.mat')
%b= cell2table(gTruth.LabelData)
load('ImageLabeled\John_fixed.mat')
%c= cell2table(gTruth.LabelData)