%COMBINE DATA STORES

[n, ~] = size(gTruth.DataSource);
newstr = 'FullDataSet';
for i=1:n
    tochange = gTruth.DataSource{i,1};
    pieces = strsplit(tochange, '\');
    pieces{1,7} = newstr;
    together = strjoin(pieces,'\');
    gTruth.DataSource{i,1} = groundTruthDataSource(together);
end



