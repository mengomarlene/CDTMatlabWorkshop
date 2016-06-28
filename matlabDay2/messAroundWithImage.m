imgName = 'microscopy\S10_50_trans_0009.tif';
myImage = imread(imgName);

nbPixels = [size(myImage,1),size(myImage,2)];

darkArea = zeros(nbPixels);
threshold = 15;
for i = 1:nbPixels(1)
    for j = 1:nbPixels(2)
        r = myImage(i,j,1);
        g = myImage(i,j,2);
        b = myImage(i,j,3);
        if r<threshold && g<threshold && b<threshold
            darkArea(i,j) = 1;
        end
    end
end