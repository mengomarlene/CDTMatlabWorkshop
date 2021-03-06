% script analyze.m

displSwitch = 10;

patient_data = csvread('inflammation-01.csv');

if displSwitch == 1
    disp('Analyzing "inflammation-01.csv": ')
    disp(['Maximum inflammation: ', num2str(max(patient_data(:)))])
    disp(['Minimum inflammation: ', num2str(min(patient_data(:)))])
    disp(['Standard deviation: ', num2str(std(patient_data(:)))])
end
ave_inflammation = mean(patient_data,1);

if displSwitch ==0
    figure('visible','off')
else
    figure('visible','on')
end
subplot(1,3,1);
plot(ave_inflammation);
ylabel('average')

subplot(1,3,2);
plot(max(patient_data, [], 1));
ylabel('max')

subplot(1,3,3);
plot(min(patient_data, [], 1));
ylabel('min');

% save plot to disk as png image
print('patient_data-01','-dpng')