function list = randomize_training_set(folder_path)
    loc=folder_path;
    files= dir(loc);
    list= {files.name};
    
    

    for i=1:size(list,2)-2
        list(i)= fullfile(folder_path,list(i+2));
    end
    list(end-1:end)=[];
    list;

    loc1= blanks(size(list,2));
    for w=1:size(loc1)
        loc1(w)= folder_path; %FAILING HERE, CHARACTER ARRAYS ARE BROKEN
    end

    randPerm= num2str(randperm(size(list,2)));
    newPath= loc1 + randPerm;
    newlist= cell(1,size(list,2));
    for q=1:size(newlist,2)
        newlist(q)= newPath(1);
    end

    for j=1:size(list,2)
        movefile(list(j),newlist(j))
    end
end
