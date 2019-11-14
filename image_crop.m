
function [croppedImage] = image_crop (folder,fname,RGB)

% IMAGE_CROP crop the part of specified colour outside the main image
%      input Arguments: image_crop(folder, filename, colour vector in RGB)
%                       1) folder: string type directory
%                       2) filename: string type file name including
%                       extension, but not the entire directory
%                       3) RGB vector: e.g. [255 255 255] if you want to
%                       cut out white part
%      output         : cropped image. To save, use imwrite
%
%      01-06-2018 Yeo-Jin Yi

imtool close all;  % Close all imtool figures if you have the Image Processing Toolbox.
% clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;


% Read in a standard MATLAB color demo image.
folder = folder;
baseFileName = fname;
% Get the full filename, with path prepended.
fullFileName = fullfile(folder, baseFileName);
if ~exist(fullFileName, 'file')
	% Didn't find it there.  Check the search path for it.
	fullFileName = baseFileName; % No path this time.
	if ~exist(fullFileName, 'file')
		% Still didn't find it.  Alert user.
		errorMessage = sprintf('Error: %s does not exist.', fullFileName);
		uiwait(warndlg(errorMessage));
		return;
	end
end
rgbImage = imread(fullFileName);
% Get the dimensions of the image.  numberOfColorBands should be = 3.
[rows, columns, numberOfColorBands] = size(rgbImage);
% Display the original color image.
subplot(2, 2, 1);
imshow(rgbImage);
title('Original Color Image', 'FontSize', 13);
% Enlarge figure to full screen.
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);

% Extract the individual red, green, and blue color channels.
redChannel = rgbImage(:, :, 1);
greenChannel = rgbImage(:, :, 2);
blueChannel = rgbImage(:, :, 3);

% Get binary image of the green rectangle
binaryImage = redChannel < RGB(1) & greenChannel < RGB(2) & blueChannel < RGB(3);
% Display the image.
subplot(2, 2, 2);
imshow(binaryImage);
title('Binary Image', 'FontSize', 13);

% Fill the rectangle
binaryImage = imfill(binaryImage, 'holes');
% Get rid of small things
% binaryImage = bwareaopen(binaryImage, 1000);
% Get the convex hull
binaryImage = bwconvhull(binaryImage, 'objects');
% Display the image.
subplot(2, 2, 3);
imshow(binaryImage);
title('Binary Image', 'FontSize', 13);

% Measure areas
measurements = regionprops(binaryImage, 'Area', 'BoundingBox');
% Take the largest one
allAreas = [measurements.Area];
[sortedAreas, indexes] = sort(allAreas, 'Descend');
% Get it's bounding box.
boundingBox = measurements(indexes(1)).BoundingBox;
% Crop the image
croppedImage = imcrop(rgbImage, boundingBox);

% Display the cropped color image.
subplot(2, 2, 4);
imshow(croppedImage);
title('Cropped Color Image', 'FontSize', 13);

end