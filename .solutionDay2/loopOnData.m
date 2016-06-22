close all
clc

files = dir('..\dataFiles_day2\*.raw');
color = jet(length(files));

extBreak = zeros(length(files),1);
forceBreak = zeros(length(files),1);

for fileNo = 1:length(files)
    fileName = files(fileNo).name;
    filePath = strcat('..\dataFiles_day2\',fileName);
    [Extension,Load] = importfile(filePath);
    Force = zeros(length(Load),1);
    for idx = 1:length(Load)
        Force(idx)=str2double(Load{idx});
    end
    idxBreak = getIdxBreak(Extension,Force,true,color(fileNo,:));
    extBreak(fileNo) = Extension(idxBreak);
    forceBreak(fileNo) = Force(idxBreak);
end

% mean(extBreak)
% std(extBreak)
% mean(forceBreak)
% std(forceBreak)

[extBreak,idx] = sort(extBreak);

figure
subplot(2,1,1)
bar(extBreak)
ylabel('extension at first failure (mm)')
subplot(2,1,2)
bar(forceBreak(idx))
ylabel('force at first failure (N)')

disp (sprintf('first failure point at %0.2g (+/- %0.2g) mm at a force of %0.2g (+/- %0.2g) N',[mean(extBreak(2:end)),std(extBreak(2:end)),mean(forceBreak(2:end)),std(forceBreak(2:end))]))
