
fnames = stiminfo.IO.stiminfo_compl_IO.values(:,1);


for i = 1:length(fnames)
    cd('/Users/yeojin/Desktop/B_scripts/BD_tasks/task_scripts/pilot_3T/stim_resized_IO_sml_new/')
    I = imread(fnames{i}); % flip the graph
    Ir = flipdim(I,2);
    cd('/Users/yeojin/Desktop/B_scripts/BD_tasks/task_scripts/pilot_3T/stim_resized_IO_sml_new/flipped/')
    imwrite(Ir,fnames{i},'bmp'); % save it again
    clear I Ir
end