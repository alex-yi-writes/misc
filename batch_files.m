clc; clear


path_origin = fullfile('/Users/yeojin/Desktop/B_scripts/tasks/memorability_stim/lamem/','images/');
load('/Users/yeojin/Desktop/B_scripts/tasks/memorability_stim/lamem/filenames.mat');


for i1 = 1:20
    mkdir(['batch_' num2str(i1)])
end

cnt = 1;
batch = 1;
path_destin = fullfile(path_origin, ['/batch_' num2str(batch)]);

while cnt <= 3000
    cellfun(@copyfile, cellstr(fullfile(path_origin, names{cnt})), cellstr(fullfile(path_destin, names{cnt})))
    cnt=cnt+1;
end

cnt

while 3000 < cnt && cnt <= 6000
    my_copyfiles(path_origin, '/batch_2/', path_origin, names{cnt})
    cnt=cnt+1;
end

cnt

while 6000 < cnt && cnt <= 9000
    copyfile([path_origin '/' names{cnt}], [path_origin '/batch_3/' names{cnt}])
    cnt=cnt+1;
end

cnt

while 9000 < cnt && cnt <= 12000
    copyfile([path_origin '/' names{cnt}], [path_origin '/batch_4/' names{cnt}])
    cnt=cnt+1;
end

cnt

while 12000 < cnt && cnt <= 15000
    copyfile([path_origin '/' names{cnt}], [path_origin '/batch_5/' names{cnt}])
    cnt=cnt+1;
end

cnt

while 15000 < cnt && cnt <= 18000
    copyfile([path_origin '/' names{cnt}], [path_origin '/batch_6/' names{cnt}])
    cnt=cnt+1;
end

cnt

while 21000 < cnt && cnt <= 24000
    copyfile([path_origin '/' names{cnt}], [path_origin '/batch_7/' names{cnt}])
    cnt=cnt+1;
end

cnt

while 24000 < cnt && cnt <= 27000
    copyfile([path_origin '/' names{cnt}], [path_origin '/batch_8/' names{cnt}])
    cnt=cnt+1;
end

cnt

while 27000 < cnt && cnt <= 30000
    copyfile([path_origin '/' names{cnt}], [path_origin '/batch_9/' names{cnt}])
    cnt=cnt+1;
end

cnt

while 30000 < cnt && cnt <= 33000
    copyfile([path_origin '/' names{cnt}], [path_origin '/batch_10/' names{cnt}])
    cnt=cnt+1;
end

cnt

while 33000 < cnt && cnt <= 36000
    copyfile([path_origin '/' names{cnt}], [path_origin '/batch_11/' names{cnt}])
    cnt=cnt+1;
end

cnt

while 36000 < cnt && cnt <= 39000
    copyfile([path_origin '/' names{cnt}], [path_origin '/batch_12/' names{cnt}])
    cnt=cnt+1;
end

cnt

while 39000 < cnt && cnt <= 42000
    copyfile([path_origin '/' names{cnt}], [path_origin '/batch_13/' names{cnt}])
    cnt=cnt+1;
end

cnt

while 42000 < cnt && cnt <= 45000
    copyfile([path_origin '/' names{cnt}], [path_origin '/batch_14/' names{cnt}])
    cnt=cnt+1;
end

cnt

while 45000 < cnt && cnt <= 48000
    copyfile([path_origin '/' names{cnt}], [path_origin '/batch_15/' names{cnt}])
    cnt=cnt+1;
end

cnt

while 48000 < cnt && cnt <= 51000
    copyfile([path_origin '/' names{cnt}], [path_origin '/batch_16/' names{cnt}])
    cnt=cnt+1;
end

cnt

while 51000 < cnt && cnt <= 54000
    copyfile([path_origin '/' names{cnt}], [path_origin '/batch_17/' names{cnt}])
    cnt=cnt+1;
end

cnt

while 54000 < cnt && cnt <= 57000
    copyfile([path_origin '/' names{cnt}], [path_origin '/batch_18/' names{cnt}])
    cnt=cnt+1;
end

cnt

while 57000 < cnt && cnt <= size(names,1)
    copyfile([path_origin '/' names{cnt}], [path_origin '/batch_19/' names{cnt}])
    cnt=cnt+1;
end


