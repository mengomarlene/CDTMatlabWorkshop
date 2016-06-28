%Is this big enough?

% script analyze_loops.m

for idx = 1:3
    %Generate strings for file and image names
    file_name = sprintf('inflammation-%02d.csv', idx);
    img_name = sprintf('patient_data-%02d',idx);
    
    patient_data = csvread(file_name);
    disp(['Analysing ',file_name, ': '])

    disp(['Maximum inflammation: ', num2str(max(patient_data(:)))]);
    disp(['Minimum inflammation: ', num2str(min(patient_data(:)))]);
    disp(['Standard Deviation: ', num2str(std(patient_data(:)))]);

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
end
