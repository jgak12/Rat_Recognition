%function newStore= fix_file_paths(img_path,label_file)
    %disp(gTruth.DataSource{2,1})
    
    practice= gTruth
    practice.DataSource
    %for i=1:size(practice.DataSource,1)
    i=1;
%         a= practice.DataSource{i,1}; %works for mac not PC?
        class(practice.DataSource)
        a= practice.DataSource{i,1};
        
        %APPARENTLY IT IS ABSOLUTELY IMPERATIVE THAT THE NEXT LINE INCLUDES
        %THE ENTIRE CURRENTLY REPRESENTED PATH UP TO BUT NOT INCLUDING
        %\image_name.jpg (so change the value of a(1:x))
        currentpath= a(1:60) %specific to Rayna's file path, change later (35 for rayna?)
%         currentpath='poop';

        b= a(37:end); %same as above^
        %newpath= fullfile('C:\Users\jmara\OneDrive\Desktop\Rat video series\FullDataSet\',b);
        newpath= 'C:\Users\jmara\OneDrive\Desktop\Rat video series\FullDataSet';

        %practice.DataSource{i,1}= strcat('C:\Users\jmara\OneDrive\Desktop\Rat video series\FullDataSet\',b)
        altpath= {currentpath newpath}
        unresolvedPaths= changeFilePaths(practice,altpath) % this should be the line that does it, no idea why it isnt working
        %it has some problem with the format of altpath but thats exactly
        %how they make it in the documentation

    %end

%end

