%function newStore= fix_file_paths(img_path,label_file)
    disp(gTruth.DataSource{2,1})
    practice.DataSource
    practice= gTruth
    for i=1:size(practice.DataSource,1)
        a= practice.DataSource{i,1};
        currentpath= a(1:35); %specific to Rayna's file path, change later
        b= a(37:end); %same as above^
        newpath= fullfile('C:\Users\jmara\OneDrive\Desktop\Rat video series\FullDataSet\',b);
        
        %practice.DataSource{i,1}= strcat('C:\Users\jmara\OneDrive\Desktop\Rat video series\FullDataSet\',b)
        altpath= {[a newpath]}
        unresolvedPaths= changeFilePaths(practice,altpath) % this should be the line that does it, no idea why it isnt working
        %it has some problem with the format of altpath but thats exactly
        %how they make it in the documentation

    end

%end

