function [out] = my_copyfiles(origin_dir, folder_name, dest_dir, extension)

new_dir = fullfile(origin_dir, folder_name);

% Get a cell with filenames in the origin_dir/folder_name
% Mind transposing to have them in the rows
NEW = struct2cell(dir(fullfile(new_dir, extension)))';

dest_folder = fullfile(dest_dir, folder_name);

% disp(dest_folder)

if ~exist(dest_folder, 'dir')
mkdir(dest_folder)
end

%% CAUTION, This is the step
% Use names from NEW to generate fullnames in dest_dir that would match
filenames = fullfile(dest_dir, NEW(:,1));
destination = fullfile(dest_folder, NEW(:,1));

% if you wanted from origin, instead run
% filenames = fullfile(new_dir, NEW(:,1));

% make the copies
cellfun(@copyfile,filenames, destination);

%Save the call

out.originDir = new_dir;
out.copyFrom = dest_dir;
out.to = dest_folder;
out.filenames = filenames;
out.destination = destination;

end