% Task 2: Read the image (ImgPIA.jpeg), and select features from the image histogram (i.e. 1st
% order), at least six (6) features from the co-occurance matrix (the original paper by Haralick has
% also made available to you), and at least five (5) features from the Gray Level Run Length (GLRL)
% matrix. Please note that both the co-occurance and GLRL based features can be directional and
% as a function of distance between pixel co-ordinates. For additional marks you can change the
% bit-depth of the image (i.e. 8, 6, 4 bit), and recalculate the features presenting them as a plot or
% table

% Read the image, change it to gray and show
clf, clear all, close all,
I = imread('ImgPIA.jpg');
I = rgb2gray(I);
% imshow(I);

% Image Histogram
figure; imhist(I); title('Image Histogram of Original Image'); xlabel('Pixel Intensity Levels'); ylabel('Frequencies')
%% % Use a built in function for calculating the histogram features 
% (histogram_features)
stats = chip_histogram_features( I,'NumLevels',9,'G',[] );
figure, bar(stats, 'm');
xlabel('Mean @ x=1, Variance @ x=2, Skewness @ x=3, Kurtosis @ x=4, Energy @ x=5,  Entropy @ x=6'); 
title('Histogram Features values of the Image with NumLevel 9 and bit depth 24')
%% NumLevels changed
stats = chip_histogram_features(I,'NumLevels',20,'G',[] );
figure, bar(stats, 'm');
xlabel('Mean @ x=1, Variance @ x=2, Skewness @ x=3, Kurtosis @ x=4, Energy @ x=5,  Entropy @ x=6'); 
title('Histogram Features values of the Image with NumLevel 20 and bit depth 24')
%%  Used a built in function for calculating the features from the co-occurance matrix
% (GLCM_Features1)
GLCM2 = graycomatrix(I,'Offset',[0 1; 3 0; -2 2]);
stats = GLCM_Features1(GLCM2,0);
%% 
glcm_0_s = graycomatrix(I, 'offset', [0 1],'NumLevels', 256, 'Symmetric', false);
figure, imshow(glcm_0_s); title('offset is [0 1]');
glcm_0_s = graycomatrix(I, 'offset', [3 0],'NumLevels', 256, 'Symmetric', true);
figure, imshow(glcm_0_s); title('offset is [0 3]');
glcm_0_s = graycomatrix(I, 'offset', [-2 2],'NumLevels', 256, 'Symmetric', false);
figure, imshow(glcm_0_s); title('offset is [-2 2]');
%% 
figure, 
bar(stats.contr); title('Contrast'); xlabel('Offset = 0 1; 3 0; -2 2'); 
figure, 
bar(stats.corrm); title('Correlation'); xlabel('Offset = 0 1; 3 0; -2 2'); 
figure, 
bar(stats.energ); title('Energy'); xlabel('Offset = 0 1; 3 0; -2 2'); 
figure, 
bar(stats.entro); title('Entropy'); xlabel('Offset = 0 1; 3 0; -2 2'); 
figure, 
bar(stats.homom); title('Homogeneity'); xlabel('Offset = 0 1; 3 0; -2 2'); 
figure, 
bar(stats.maxpr); title('Maximum probability'); xlabel('Offset = 0 1; 3 0; -2 2'); 
%% Used a built in function for calculating the features from the cGray Level Run Length (GLRL) matrix
% (glrlm)
mask = ones(size(I(:,:,1)));
quantize = 16;
[SRE,LRE,GLN,RP,RLN,LGRE,HGRE]  = glrlm(I,quantize,mask)

% Table
T = table({'SHORT RUN EMPHASIS (SRE)';'LONG RUN EMPHASIS(LRE)';'GRAY LEVEL NON-UNIFORMITY (GLN)';'RUN PERCENTAGE (RP)'; ...
    'RUN LENGTH NON-UNIFORMITY (RLN)';'LOW GRAY LEVEL RUN EMPHASIS (LGRE)';'HIGH GRAY LEVEL RUN EMPHASIS (HGRE)'}, ...
    [SRE;LRE;GLN;RP;RLN;LGRE;HGRE] );
T.Properties.VariableNames = {'Features of Gray Level Run Length Matrix','Values with quantization of 16 and bit depth 24'}
%% 
mask = ones(size(I(:,:,1)));
quantize = 32;
[SRE,LRE,GLN,RP,RLN,LGRE,HGRE]  = glrlm(I,quantize,mask)

% Table
T = table({'SHORT RUN EMPHASIS (SRE)';'LONG RUN EMPHASIS(LRE)';'GRAY LEVEL NON-UNIFORMITY (GLN)';'RUN PERCENTAGE (RP)'; ...
    'RUN LENGTH NON-UNIFORMITY (RLN)';'LOW GRAY LEVEL RUN EMPHASIS (LGRE)';'HIGH GRAY LEVEL RUN EMPHASIS (HGRE)'}, ...
    [SRE;LRE;GLN;RP;RLN;LGRE;HGRE] );
T.Properties.VariableNames = {'Features of Gray Level Run Length Matrix','Values with quantization of 32 and bit depth 24'}
%% Bar graph

figure, subplot(1, 5, 1); bar(SRE); title('SHORT RUN EMPHASIS (SRE)');
hold;
subplot(1, 5, 2); bar(LRE); title('LONG RUN EMPHASIS(LRE)');
subplot(1, 5, 3); bar(GLN);title('GRAY LEVEL NON-UNIFORMITY (GLN)');
subplot(1, 5, 4); bar(RP);title('RUN PERCENTAGE (RP)');
subplot(1, 5, 5); bar(RLN);title('RUN LENGTH NON-UNIFORMITY (RLN)');
%% Convert image bit depth 
K = im2uint16(I);

%% Used a built in function for calculating the histogram features 
% (histogram_features)
stats = chip_histogram_features( K,'NumLevels',9,'G',[] );
figure, bar(stats, 'm');
xlabel('Mean @ x=1, Variance @ x=2, Skewness @ x=3, Kurtosis @ x=4, Energy @ x=5,  Entropy @ x=6'); 
    title('Histogram Features values of the Image with NumLevel 9 and bit depth 8')
%% Used a built in function for calculating the features from the cGray Level Run Length (GLRL) matrix
% (glrlm)
mask = ones(size(K(:,:,1)));
quantize = 16;
[SRE,LRE,GLN,RP,RLN,LGRE,HGRE]  = glrlm(K,quantize,mask)
S = table({'SHORT RUN EMPHASIS (SRE)';'LONG RUN EMPHASIS(LRE)';'GRAY LEVEL NON-UNIFORMITY (GLN)';'RUN PERCENTAGE (RP)'; ...
    'RUN LENGTH NON-UNIFORMITY (RLN)';'LOW GRAY LEVEL RUN EMPHASIS (LGRE)';'HIGH GRAY LEVEL RUN EMPHASIS (HGRE)'}, ...
    [SRE;LRE;GLN;RP;RLN;LGRE;HGRE] );
S.Properties.VariableNames = {'Features of Gray Level Run Length Matrix','Values of 8 bit image'}
%% Bar graph

figure, subplot(1, 5, 1); bar(SRE); title('SHORT RUN EMPHASIS (SRE)');
hold;
subplot(1, 5, 2); bar(LRE); title('LONG RUN EMPHASIS(LRE)');
subplot(1, 5, 3); bar(GLN);title('GRAY LEVEL NON-UNIFORMITY (GLN)');
subplot(1, 5, 4); bar(RP);title('RUN PERCENTAGE (RP)');
subplot(1, 5, 5); bar(RLN);title('RUN LENGTH NON-UNIFORMITY (RLN)');

