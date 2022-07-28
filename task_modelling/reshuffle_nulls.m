%% reshape the design matrix to include null trials

%%

null_locations = randperm(179);

null_r1 = null_locations(1:20);
null_r2 = null_locations(21:40);
null_r3 = null_locations(41:60);
null_r4 = null_locations(61:80);

nullmat = repmat([0 0 0 4.5 3.5 5 0],20,1);

load('/Users/yeojin/Desktop/B_scripts/BD_tasks/task_scripts/MRPET/models/Main_GA_designstruct_D2_ver1.mat');

tmpmat1 = nan(180,7);
tmpmat1(null_r2,:) = nullmat; trl_r1 = find(isnan(tmpmat1(:,1)));
tmpmat1(trl_r1,:) = design_struct.eventlist(:,:);
tmpmat1(null_r2,:) = nullmat(:,:);

design_struct.eventlist = tmpmat1;

save('/Users/yeojin/Desktop/B_scripts/BD_tasks/task_scripts/MRPET/models/Main_GA_designstruct_D2_ver1.mat','design_struct','meanrecipvif','vifs')