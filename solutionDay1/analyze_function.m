function [maxVal,minVal,stdVal] = analyze_function(file_name,img_name)

% function taht gives max and min + std of patient data
%  [maxVal,minVal,stdVal] = analyze_function(file_name,img_name)
% file_name is the name of the patient file
%img_name is the name of the saved image
% version menmmen - 23.06.2016
    patient_data = csvread(file_name);
    disp(['Analysing ',file_name, ': '])

    maxVal = num2str(max(patient_data(:)));
    minVal = num2str(min(patient_data(:)));
    stdVal = num2str(std(patient_data(:)));

    ave_inflammation = mean(patient_data, 1);
    figure('visible','off')
    
    subplot(1, 3, 1);
    plot(ave_inflammation);
    ylabel('average')

    subplot(1, 3, 2);
    plot(max(patient_data, [], 1));
    ylabel('max')

    subplot(1, 3, 3);
    plot(min(patient_data, [], 1));
    ylabel('min');

    % save plot to disk as png image:
    print('-dpng', img_name)
    close();
