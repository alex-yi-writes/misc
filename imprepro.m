clc; clear

path_par    = '/Users/yeojin/Desktop/Wed_Jan_30_17-53-16_CET_2019/'; % modify here to your own paths
path_save   = '/Users/yeojin/Desktop/Wed_Jan_30_17-53-16_CET_2019/'; % where it is going to be saved

cd(path_par)
k = dir('*.jpg');

for i = 1:length(k)
    dat = imread(k(i).name); % read in the image file
    
    R = im2double(squeeze(dat(:,:,1)))+.000001;% red, prevent values from getting zero
    G = im2double(squeeze(dat(:,:,2)))+.000001;% green
    B = im2double(squeeze(dat(:,:,3)))+.000001;% blue
    
    rfact = 0.2126;gfact = 0.7152;bfact = 0.0722;
    Y(i,1) = rfact*geomean(R(:)) + gfact*geomean(G(:)) + bfact*geomean(B(:));
    cutval = .5;
    ratios = mean(log(R(:))) + mean(log(G(:))) + mean(log(B(:)));
    
    offset = .4;
    
    % adjust individual colors
    diff = mean(log(R(:)+offset))- log(cutval);
    newvals = exp(log(R(:)+offset)-diff);
    Rn = reshape(newvals,size(R));clear diff newvals
    diff = mean(log(G(:)+offset))- log(cutval);
    newvals = exp(log(G(:)+offset)-diff);
    Gn = reshape(newvals,size(G));clear diff newvals
    diff = mean(log(B(:)+offset))- log(cutval);
    newvals = exp(log(B(:)+offset)-diff);
    Bn = reshape(newvals,size(B));clear diff newvals
    
    Y(i,2) = rfact*geomean(Rn(:)) + gfact*geomean(Gn(:)) + bfact*geomean(Bn(:));
    dat2 = zeros(size(dat));
    dat2(:,:,1) = Rn;dat2(:,:,2) = Gn;dat2(:,:,3) = Bn;
    %         dat2 = uint8(dat2);
    close all
    dat3= imresize(dat2,2);
    imshow(dat3);
    F = gcf;
    set(F,'Position', [100 100 600*2 500*2]);
    set(gca, 'position', [0 0 1 1], 'visible', 'off');
    G=getframe(gcf);
    imwrite(G.cdata, [path_save 'original/' k(i).name(1:end-4) '_ag.bmp']); % directly with number
%     imwrite(G.cdata, [path_save 'original/' k(i).name(1:end-4) '_ag.bmp']); % directly with number
    
    folder = [path_save 'original/'];
    baseFileName = [k(i).name(1:end-4) '_ag.bmp'];
    % Get the full filename, with path prepended.
    fullFileName = fullfile(folder, baseFileName)
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
    title('Original Color Image', 'FontSize', 12);
    % Enlarge figure to full screen.
    set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
    
    % Extract the individual red, green, and blue color channels.
    redChannel = rgbImage(:, :, 1);
    greenChannel = rgbImage(:, :, 2);
    blueChannel = rgbImage(:, :, 3);
    
    % Get binary image of the green rectangle
    binaryImage = redChannel < 240 & greenChannel < 240 & blueChannel < 240;
    % Display the image.
    subplot(2, 2, 2);
    imshow(binaryImage);
    title('Binary Image', 'FontSize', 12);
    
    % Fill the rectangle
    binaryImage = imfill(binaryImage, 'holes');
    % Get rid of small things
    % binaryImage = bwareaopen(binaryImage, 1000);
    % Get the convex hull
    binaryImage = bwconvhull(binaryImage, 'objects');
    % Display the image.
    subplot(2, 2, 3);
    imshow(binaryImage);
    title('Binary Image', 'FontSize', 12);
    
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
    title('Cropped Color Image', 'FontSize', 12);
    
    % now resize
    rI_IO = imresize(croppedImage,[354 283]);
    imwrite(rI_IO, fullfile(path_save, [k(i).name(1:end-4) '.bmp']));
    close all
end