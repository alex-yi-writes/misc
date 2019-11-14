clear;clc


                                                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

path = '/Users/yeojin/Desktop/B_scripts/tasks/memorability_stim/lamem/images/batch_3/';

                                                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



load('/Users/yeojin/Desktop/B_scripts/tasks/memorability_stim/lamem/filenames.mat');


filenum_vec = [1 3000; 3001 6000; 6001 9000; 9001 12000; 12001 15000; 15001 18000; ...
    18001 21000; 21001 24000; 24001 27000; 27001 30000; 30001 33000; 33001 36000; ...
    36001 39000; 39001 42000; 42001 45000; 45001 48000; 48001 51000; 51001 54000; ...
    54001 57000; 57001 size(names,1)];



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            part = 3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


keepornot = []; 
takepics = [];ii = 0;Ys = [];

%%

for i = filenum_vec(part,1):filenum_vec(part,2)
    try
    
        dat = imread([path names{i}]);

        R = im2double(squeeze(dat(:,:,1)))+.000001;% red, prevent values from getting zero
        G = im2double(squeeze(dat(:,:,2)))+.000001;% green
        B = im2double(squeeze(dat(:,:,3)))+.000001;% blue

        rfact = 0.2126;gfact = 0.7152;bfact = 0.0722;
        Y(i-filenum_vec(part-1,1),1) = rfact*geomean(R(:)) + gfact*geomean(G(:)) + bfact*geomean(B(:));
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

        Y(i-filenum_vec(part-1,1),2) = rfact*geomean(Rn(:)) + gfact*geomean(Gn(:)) + bfact*geomean(Bn(:));
        dat2 = zeros(size(dat));
        dat2(:,:,1) = Rn;dat2(:,:,2) = Gn;dat2(:,:,3) = Bn;
        %         dat2 = uint8(dat2);
        close all
        dat3= imresize(dat2,2);
        imshow(dat3);
        F = gcf;
        set(F,'Position', [100 100 600*2 500*2]);
        set(gca, 'position', [0 0 1 1], 'visible', 'off');
        
        fprintf('\n picture %d \n',i)

        keepornot(i-filenum_vec(part-1,1)) = input(' 1 for keep, 2 for omit : ');
        

        if keepornot(i-filenum_vec(part-1,1)) == 1
            ii = ii+1;
            inorout(i-filenum_vec(part-1,1)) = input(' 1 for indoors, 2 for outdoors : ');
            takepics{1,ii} = names{i};
            takepics{2,ii} = inorout(i-filenum_vec(part-1,1));
            dum = size(dat);
            sizepics(ii,:) = dum(1:2);clear dum
            Ys(ii,:) = Y(i-filenum_vec(part-1,1),:);

            pause (.5)
            G=getframe(gcf);
            imwrite(G.cdata, [fullfile('/Users/yeojin/Desktop/B_scripts/tasks/memorability_stim/lamem/images','stim_sorted/') names{i}(1:end-4) '_ag.bmp']); % directly with number

           end

        save([path 'SelectedStim_part' num2str(part) '_mod.mat'],'takepics','sizepics','Ys')
    
    catch 
        warning(['problem with' names{i}])
        errorlist{i-filenum_vec(part-1,1)} = names{i};
    end
    
end

% figure,plot(storesize(:,1))
% figure,plot(s);