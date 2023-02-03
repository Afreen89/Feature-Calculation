% TASK 1: Read the im
% age ('imgPIA.jpeg') and select the features for both
% radius and direction as described in the Spectral Approach session of the
% Feature Extraction lecture. For additional marks you can change the
% values of radius and angle, and present those values in a plot or table. 

% Clear screen and workspace
clf; close all;

% Read the image
Image = imread('ImgPIA.jpg');
%% Subimages

[Image_Height,Image_Width,Number_Of_Colour_Channels] = size(Image);

Block_Size = 500;
Number_Of_Blocks_Vertically = ceil(Image_Height/Block_Size);
Number_Of_Blocks_Horizontally = ceil(Image_Width/Block_Size);
Image_Blocks = struct('Blocks',[]);

Index = 1;
for Row = 1: +Block_Size: Number_Of_Blocks_Vertically*Block_Size
    for Column = 1: +Block_Size: Number_Of_Blocks_Horizontally*Block_Size
        
    Row_End = Row + Block_Size - 1;
    Column_End = Column + Block_Size - 1;
        
    if Row_End > Image_Height
       Row_End = Image_Height;
    end
    
    if Column_End > Image_Width
       Column_End = Image_Width;
    end
    
    Temporary_Tile = Image(Row:Row_End,Column:Column_End,:);
    
    %Storing blocks/tiles in structure for later use%
    Image_Blocks(Index).Blocks = Temporary_Tile;
    subplot(Number_Of_Blocks_Vertically,Number_Of_Blocks_Horizontally,Index); imshow(Temporary_Tile);
    Index = Index + 1;
    
    end  
end

for Block_Index = 1: length(Image_Blocks)
    imwrite(Image_Blocks(Block_Index).Blocks,"Block" + num2str(Block_Index) + ".jpg"); 
end
%%  Compute Fourier Transform

F = fft2(f,256,256);
figure;
% imshow(F); title ('Figure 1');
F = fftshift(F); % Center FFT
figure;
imshow(F);
%% Polar Coordinates
radius = 100;
angle = 360;

img = double(F);
[rows, cols] = size(img);
cy = round(rows/2);
cx = round(cols/2);

if exist ('radius', 'var') == 0
    angle = 360;
end

polarcord_img = [];
i = 1;

for r=1:100
    j=1;
    for a=0:2*pi/angle:2*pi-2*pi/angle
        polarcord_img(i, j) = img(cy+round(r*sin(a)), cx+round(r*cos(a)));
        j = j + 1;
    end
    i = i + 1;
end
%% Spectral feature Calculation
S_r_theta = (polarcord_img);
%  imshow(S_r_theta);
%% plot for r = 1: 100
for r = 1:99
    S_r(r) = sum((abs(S_r_theta(r+1, :))));
end
figure(1)
bar(S_r)
xlabel('radius'); ylabel('feature value');

% plot for theta = 1:360
for theta = 1:250
    S_theta(theta) = sum((abs(S_r_theta(:,theta))));
end
figure(2)
bar(S_theta)
xlabel('theta'); ylabel('feature value')