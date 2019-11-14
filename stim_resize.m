%% stimulus adjustments pipeline
%  resize and crop

%% paths and files

close all;clear;clc

% folders
parents            = '/Users/yeojin/Desktop/B_scripts/tasks/memorability_stim/lamem/images';
% path_source_HA     = 'stim_sorted_human_animal/';
% path_source_IO     = 'stim_sorted_in_out/';
path_output_HA     = 'stim_resized_HA_sml/';
path_output_IO     = 'stim_resized_IO_sml';
path_source_HA     = 'stim_resized_HA_big';
path_source_IO     = 'stim_resized_IO_big';


% stim infos: filenames-category-size-Y-memorability
load('/Users/yeojin/Desktop/B_scripts/tasks/memorability_stim/lamem/stiminfo_complete/stiminfo_all.mat')
% stiminfo.HA = load('/Users/yeojin/Desktop/B_scripts/tasks/memorability_stim/lamem/stiminfo_complete/stiminfo_complete_humananimal.mat');
% stiminfo.IO = load('/Users/yeojin/Desktop/B_scripts/tasks/memorability_stim/lamem/stiminfo_complete/stiminfo_complete_inout.mat');

%% resize images

% human/animal
cd(fullfile(parents,path_source_HA));
for i1 = 1:size(stiminfo.HA.stiminfo_compl_HA.values,1)
    try
        fprintf('\nprogress: %d/%d\n', i1,size(stiminfo.HA.stiminfo_compl_HA.values,1))

        imgname     = stiminfo.HA.stiminfo_compl_HA.values{i1,1};
        imgname     = [imgname(1:8) '_r.bmp'];
        I_HA{i1,1}  = imread(imgname); % read in a image
        rI_HA{i1,1} = imresize(I_HA{i1,1},[360 500]);

        imwrite(rI_HA{i1,1},fullfile(parents,path_output_HA,[imgname(1:8) '_r.bmp']))

        clear imgname
        
    catch
        buglist{i1} = imgname;
        
    end
    
end
    clear i1

    
% in/out
cd(fullfile(parents,path_source_IO));
for i1 = 1:size(stiminfo.IO.stiminfo_compl_IO.values,1)
    
    fprintf('\nprogress: %d/%d\n', i1,size(stiminfo.IO.stiminfo_compl_IO.values,1))

    imgname     = stiminfo.IO.stiminfo_compl_IO.values{i1,1};
    imgname     = [imgname(1:8) '_r.bmp'];
    I_IO{i1,1}  = imread(imgname); % read in a image
    rI_IO{i1,1} = imresize(I_IO{i1,1},[360 500]);
    
    imwrite(rI_IO{i1,1},fullfile(parents,path_output_IO,[imgname(1:8) '_r.bmp']))
    
    clear imgname
    
end
    clear i1


%% crop the weird gray space around it

% human/animal
cd(fullfile(parents,path_source_HA));
for i1 = 1:size(stiminfo.HA.stiminfo_compl_HA.values,1)
    try
        
        imgname     = stiminfo.HA.stiminfo_compl_HA.values{i1,1};
        temp_img    = image_crop(fullfile(parents,path_output_HA),[imgname(1:8) '_r.bmp'],[240 240 240]);
        imwrite(temp_img, fullfile(parents,path_output_HA,[imgname(1:8) '_r.bmp']));
        clear imgname temp_img
        
    catch
        buglist{i1} = imgname;
        
    end
    
end
    clear i1

    
% indoor/outdoor    
    cd(fullfile(parents,path_source_IO));
for i1 = 1:size(stiminfo.IO.stiminfo_compl_IO.values,1)
    try
        
        imgname     = stiminfo.IO.stiminfo_compl_IO.values{i1,1};
        temp_img    = image_crop(fullfile(parents,path_output_IO),[imgname(1:8) '_r.bmp'], [240 240 240]);
        imwrite(temp_img, fullfile(parents,path_output_IO,[imgname(1:8) '_r.bmp']));
        clear imgname temp_img
        
    catch
        buglist{i1} = imgname;
        
    end
    
end
    clear i1
