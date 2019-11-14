clear;clc
path = '/Users/yeojin/Desktop/B_scripts/tasks/memorability_stim/lamem/images/';
cd(path)
dirData = dir; %('*.jpg')
fileNames = {dirData.name};
fileNames(ismember(fileNames,{'.','..','._.DS_Store','.DS_Store','all','Old','Adjusted'})) = [];

% remove hidden ones
% ind = NaN;
% for fh = 1:length(fileNames)
%     if strmatch('._',fileNames{fh})
%         ind(fh) = fh;
%     end
% end
% fileNames(ind) = [];
 

for i = 1:length(fileNames)
    dat = imread([path fileNames{i}]);
     
    R = im2double(squeeze(dat(:,:,1)))+.000001;% red, prevent values from getting zero
    G = im2double(squeeze(dat(:,:,2)))+.000001;% green
    B = im2double(squeeze(dat(:,:,3)))+.000001;% blue
     
    rfact = 0.2126;gfact = 0.7152;bfact = 0.0722;
    Y(i,1) = rfact*geomean(R(:)) + gfact*geomean(G(:)) + bfact*geomean(B(:))
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
    F = gcf;
    set(F,'Position', [100 300 768 576]);
    set(gca, 'position', [0 0 1 1], 'visible', 'off');
    imshow(dat2);pause (.5)
    G=getframe(gcf);
    imwrite(G.cdata, [path fileNames{i}(1:end-4) '_ag.bmp']);% directly with number
end

figure,plot(Y);