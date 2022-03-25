%Written/used by john ~3 hours

function list = randomize_training_set(folder_path)
 %randomize_training_set('C:\Users\jmara\OneDrive\Desktop\Rat video series\FullDataSet')
    
    %gets list of all things in directory?
    loc=folder_path;
    files= dir(loc);
    list= {files.name};
    
    

    for i=1:size(list,2)-2
        list{i}= fullfile(folder_path,list{i+2});
    end
    list(end-1:end)=[];


    loc1= cell(1,size(list,2));
    %disp(size(loc1))
    for w=1:size(loc1,2)
        loc1{w}= folder_path; %FAILING HERE, CHARACTER ARRAYS ARE BROKEN
    end

    %randPerm= num2str(randperm(size(list,2)));
    randPerm=randperm(size(list,2));
    
    %newPath= loc1 + randPerm;
    newlist= cell(1,size(list,2));
    for i=1:size(list,2)
        tempnum=randPerm(i);
%         i
%         z=num2str(tempnum)
        newlist{i}=strcat(loc1{i}, '\pic', num2str(tempnum),".jpg"); 

    end

    for j=1:size(list,2)
        movefile(list{j},newlist{j})
    end
end
