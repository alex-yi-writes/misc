% tmp = dir;
% folders = {tmp.name}; folders(1:2) = [];
% 
clc; clear
% 
% for q = 1:length(IDs)
%     ID_emomem(q,1) = str2double(IDs{q,1}(1:3));
% end

% IDs = [2220 2221];
% IDs     = [2202 2203 2204 2205 2206 2207 2208 2109 2110 2112 2113 2114 2115 2116 2217 2218 2219 2220 2221]; % 2113(D1), 2207(D2), 2116(D1) 2117(D2) -> bad data / 2201, 2111 -> dropout
% days    = [1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2];
% IDs     = [2202 2203 2204 2205 2206 2207 2208 2109 2110 2112 2113]; % 2113(D1), 2207(D2), 2116(D1) 2117(D2) -> bad data / 2201, 2111 -> dropout
% days    = [1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2];

% 2113(D1), 2207(D2), 2116(D1) 2117(D2) -> bad data / 2201, 2111 -> dropout
% days    = [1 2];

for uu = 1:length(tmp)
    ID_daniella{uu,1} = tmp{uu,1}(1:3);
end

IDs = ID_daniella;

k = 0; folders = [];
for i = 1:length(IDs)
%     for d = 1:2
%         k = k+1;
        folders{i} = num2str(IDs(i));
%         folders{k} = [num2str(IDs(i)) num2str(d)];
%     end
end

folders = IDs;

% generalpath = '/Users/yeojin/Desktop/E_data/EB_cleaned/EBC_mri/pilot_3T_2sess/MainTask/';
% generalpath = '/Users/yeojin/Desktop/E_data/EA_raw/EAB_MRI/EABB_preprocessed/MainTask_coreg/';
generalpath = '/Users/yeojin/Desktop/E_data/ED_coreg/daniella/';
movedpath1   = '/Users/yeojin/Desktop/E_data/ED_coreg/LIDO/';
% generalpath = '/Users/yeojin/Desktop/E_data/ED_coreg/pilot_3T_SyN_done_20190923/'


clear k

for k = 2:length(IDs)
%     try
    for d = 1:2
        cd(movedpath1)
        mkdir(folders{k})
        cd(folders{k})
%         mkdir([num2str(IDs(k)) num2str(d)])
%         cd([num2str(IDs(k)) num2str(d)])
        mkdir('coreg')
        cd('coreg')
        copyfile([generalpath folders{k} '/meanEPI_SW.nii'], [movedpath1 folders{k} '/coreg/meanEPI_SW.nii'])
        copyfile([generalpath folders{k} '/T1mean.nii'], [movedpath1 folders{k} '/coreg/T1mean.nii'])
        copyfile([generalpath folders{k} '/HMRI_MTw.nii'], [movedpath1 folders{k} '/coreg/t1slab.nii'])
%         copyfile([generalpath folders{k} '/data/LCmask_' folders{k} '.nii'], [movedpath1 folders{k} '/data/LCmask_' folders{k} '.nii'])
% 
%         for cc = [2 3 6 7]
%             copyfile([generalpath folders{k} '_' num2str(d) '/con_000' num2str(cc) '.nii'], [movedpath1 folders{k} num2str(d) '/data/con_000' num2str(cc) '.nii'])
%         end
%         
%         for cc = [10 11 12 14]
%             copyfile([generalpath folders{k} '_' num2str(d) '/con_00' num2str(cc) '.nii'], [movedpath1 folders{k} num2str(d) '/data/con_00' num2str(cc) '.nii'])
%         end
%         copyfile([generalpath num2str(IDs(k)) num2str(d) '/data/LCmask_' num2str(IDs(k)) num2str(d) '.nii.gz'], [movedpath1 num2str(IDs(k)) num2str(d) '/data/LCmask_' num2str(IDs(k)) num2str(d) '.nii.gz'])

%         try
%             copyfile([generalpath num2str(IDs(k)) '_' num2str(d) '/meana' num2str(IDs(k)) '_Main_4D_MT' num2str(d) '.nii'], [movedpath1 num2str(IDs(k)) num2str(d) '/data/meanEPI3D1.nii'])
%         catch
%             copyfile([generalpath num2str(IDs(k)) '_' num2str(d) '/meana' num2str(IDs(k)) '_Main_4D_MT' num2str(d) '_1.nii'], [movedpath1 num2str(IDs(k)) num2str(d) '/data/meanEPI3D1.nii'])
%         end
%         copyfile([generalpath num2str(IDs(k)) '_' num2str(d) '/' num2str(IDs(k)) '_Main_4D_MPRAGE' num2str(d) '_2.nii'], [movedpath1 num2str(IDs(k)) num2str(d) '/data/T1mean.nii'])
%         copyfile([generalpath num2str(IDs(k)) '_' num2str(d) '/' num2str(IDs(k)) '_Main_4D_FLASH' num2str(d) '_2.nii'], [movedpath1 num2str(IDs(k)) num2str(d) '/data/t1slab.nii'])
%         end
        
%         for cc = 10:15
%             copyfile([generalpath num2str(IDs(k)) '_' num2str(d) '/con_00' num2str(cc) '.nii'], [movedpath1 num2str(IDs(k)) num2str(d) '/data/con_00' num2str(cc) '.nii'])
%         end

    end
%     catch
%         disp(folders{k})
%     end
end


%% reverse
clc; clear

% IDs = [2220 2221];
IDs     = [2202 2203 2204 2205 2206 2207 2208 2109 2110 2112 2113 2114 2115 2116 2217 2218 2219 2220 2221]; % 2113(D1), 2207(D2), 2116(D1) 2117(D2) -> bad data / 2201, 2111 -> dropout
days    = [1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2; 1 2];

k = 0; folders = [];
for i = 1:length(IDs)
    for d = 1:2
%         k = k+1;
%         folders{i} = num2str(IDs(i));
        folders{i} = [num2str(IDs(i)) num2str(d)];
    end
end

movedpath1 = '/Users/yeojin/Desktop/E_data/EB_cleaned/EBC_mri/pilot_3T_2sess_coreg/MainTask/';
generalpath = '/Users/yeojin/Desktop/E_data/ED_coreg/models/done_20190930/models_new_2/';


clear k

for k = 1:length(IDs)
    for d = 1:2
%         cd(movedpath1)
% %         mkdir(folders{k})
% %         cd(folders{k})
%         cd([num2str(IDs(k)) num2str(d)])
%         cd('data')
%         copyfile([generalpath folders{k} '/data/meanEPI3D1.nii'], [movedpath1 folders{k} '/data/meanEPI3D1.nii'])
%         copyfile([generalpath folders{k} '/data/T1mean.nii'], [movedpath1 folders{k} '/data/T1mean.nii'])
%         copyfile([generalpath folders{k} '/data/t1slab.nii'], [movedpath1 folders{k} '/data/t1slab.nii'])
%         copyfile([generalpath folders{k} '/data/LCmask_' folders{k} '.nii'], [movedpath1 folders{k} '/data/LCmask_' folders{k} '.nii'])

        for cc = [6]
            copyfile([generalpath folders{k} '_con_000' num2str(cc) '_to_MNI.nii'], [movedpath1 num2str(IDs(k)) '_' num2str(d) '/con_000' num2str(cc) '_t.nii'])
        end
%         
%         for cc = [10 11 12 14]
%             copyfile([generalpath folders{k} '_' num2str(d) '/con_00' num2str(cc) '.nii'], [movedpath1 folders{k} num2str(d) '/data/con_00' num2str(cc) '.nii'])
%         end
%         copyfile([generalpath num2str(IDs(k)) num2str(d) '/data/NLreg_meanEPI3D1_to_MNI.nii'], [movedpath1 num2str(IDs(k)) '_' num2str(d) '/meanEPI3D_' num2str(IDs(k)) '_' num2str(d) '.nii'])
%         copyfile([generalpath num2str(IDs(k)) num2str(d) '/data/NLreg_T1mean_to_MNI.nii'], [movedpath1 num2str(IDs(k)) '_' num2str(d) '/T1mean_' num2str(IDs(k)) '_' num2str(d) '.nii'])
%         copyfile([generalpath num2str(IDs(k)) num2str(d) '/data/NLreg_LCmask_to_MNI.nii'], [movedpath1 num2str(IDs(k)) '_' num2str(d) '/LCmask_' num2str(IDs(k)) '_' num2str(d) '.nii'])
%         copyfile([generalpath num2str(IDs(k)) num2str(d) '/data/NLreg_LCmask_to_MNI_binarized.nii'], [movedpath1 num2str(IDs(k)) '_' num2str(d) '/LCmask_bin_' num2str(IDs(k)) '_' num2str(d) '.nii'])
    end
end