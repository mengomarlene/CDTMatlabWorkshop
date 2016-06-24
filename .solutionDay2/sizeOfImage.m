clc
clear all
close all

scaleFile = 'imageFiles_day2\microscopy\scale100microns.tif';
scale = imread(scaleFile);
%imageshow(scale)
%imagetool(scale)

n = 1;
for i=1:size(scale,1)
    for j=1:size(scale,2)
        red = scale(i,j,1);
        green = scale(i,j,2);
        if (red == 255) && (green == 0)
            pixel(n) = j;
            n = n+1;
        end
    end
end

nbPixels = max(pixel)-min(pixel);
lengthOf1Pixel = nbPixels/1000;


microFile = '..\imageFiles_day2\microscopy\S10_50_trans_0009.tif';
microImg = imread(microFile);
imageSize = [lengthOf1Pixel*size(microImg,1),lengthOf1Pixel*size(microImg,2)]

n = 1;
for i=1:size(microImg,1)
    for j=1:size(microImg,2)
        red = microImg(i,j,1);
        green = microImg(i,j,2);
        if (red < 10) && (green < 10)
            blackArea(n,:) = [i,j];
            n = n+1;
        end
    end
end