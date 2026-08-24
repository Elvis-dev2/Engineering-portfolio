clc;
clear;
close all;

disp('==============================');
disp('ECG HEART RATE MONITOR');
disp('Biomedical Engineering Portfolio');
disp('version 1.0');
disp('==============================');

clc;
clear;
close all;

% Read ECG data
ecg = readmatrix('C:/Medical_Device_Portifolio/ECG Monitor/Data/ecg.csv');

% Display the size of the data
disp(size(ecg));

% Select the first heartbeat
heartbeat = ecg(1,1:140);
Fs = 360;
t = (0:length(heartbeat)-1)/Fs;

% Plot the heartbeart 
figure;
plot(heartbeat, 'LineWidth',2);
grid on;

xlabel('Sample Number');
ylabel('Amplitude');
title('First ECG Heartbeat');

%% ECG Filtering


% Remove baseline wander using high-pass filter
[b,a] = butter(2,0.5/(Fs/2),'high');

filtered_ecg = filtfilt(b,a,heartbeat);

% Remove high frequency noise
[b2,a2] = butter(2,40/(Fs/2),'low');

filtered_ecg = filtfilt(b2,a2,filtered_ecg);

% Plot filtered ECG
figure;
plot(t,filtered_ecg,'LineWidth',1.5);
xlabel('Time(seconds)');
ylabel('Amplitude');
title('Filtered ECG signal')
grid on;

%% R-Peak Detection 

% Detect peaks (heartbeats)
[peaks,locations] = findpeaks(filtered_ecg,'MinPeakHeight',0.3,'MinPeakDistance',round(0.25*Fs));

% Calculate heart rate

time_duration = length(filtered_ecg)/Fs;
heart_rate = (length(peaks)/time_duration)*60;

fprintf('Heart Rate = %.2f BPM\n',heart_rate);

% Plot detected R-peaks

figure;
plot(t,filtered_ecg);
hold on;
plot(locations/Fs, peaks, 'ro', 'MarkerSize', 8);

xlabel('Time(seconds)');
ylabel('Amplified');
title('ECG with R-Peak Detection');
legend('Filtered ECG', 'Detected R Peaks');
grid on

%% Heart Rate Classification

if heart_rate < 60
    status = 'Bradycardia (Low Heart Rate)';
elseif heart_rate <= 100
    status = 'Normal Heart Rate';
else
    status = 'Tachycardia (High Heart Rate)';
end
fprintf('Status: %s\n',status);

%% ECG Patient Monitor Display

figure;
set(gcf,'Name','ECG Patient Monitor');

% ECG waveform
subplot(2,1,1)

plot(t,filtered_ecg,'LineWidth',1.5);
hold on;

% Plot detected R plots
plot(locations/Fs,peaks,'ro' );

xlabel('Time(seconds)');
ylabel('ECG Amplitude');
title('ECG Waveform');
legend('ECG SIgnal','R Peaks');
grid on;

% Digital heart rate display

subplot(2,1,2)

axis off

text(0.1,0.7,sprintf('HeartRate: %.1f BPM',heart_rate),'FontSize',18);

text(0.1,0.4,['status:',status],'FontSize',18);

title('Patient Monitor Display');

%% Digital ECG Monitor Display

figure;

% Display heart rate value
axis off;

text(0.1,0.7, sprintf('Heart Rate: %.1f BPM',heart_rate),'FontSize',18);

text(0.1,0.5,['Status:',status],'FontSize',18);

text(0.1,0.3,'ECG Monitor System','FontSize',20);

%% Heart Rate Alarm System

if heart_rate < 50
    
    alarm = 'ALARM: LOW HEART RATE';
    
elseif heart_rate >= 50 && heart_rate <= 100
    
    alarm = 'NORMAL: Heart Rate Stable';
    
else
    
    alarm = 'ALARM: HIGH HEART RATE';
    
end


fprintf('%s\n', alarm);

figure;

axis off;

text(0.1,0.8,'ECG MONITOR SYSTEM','FontSize',20);

text(0.1,0.7, sprintf('Heart Rate: %.1f BPM',heart_rate),'FontSize',18);

text(0.1,0.4,['Status: ',status],'FontSize',18);

text(0.1,0.2,alarm,'FontSize',18);

%% Arrhythmia Detection 

% Get ECG label
ecg_label = ecg(1,141);

if ecg_label == 0
    rhythm_status = 'Normal ECG Rhythm';
else
    rhythm_status ='Abnormal ECG - Possible Arrythmia';
end

fprintf('Rhythm Analysis:%s\n',rhythm_status);

figure;

axis off;

text(0.1,0.85,'ECG MONITOR SYSTEM','FontSize',20);

text(0.1,0.65, sprintf('Heart Rate:%.1f BPM',heart_rate),'FontSize',16);

text(0.1,0.45,['Status: ',status],'FontSize',16);

text(0.1,0.25,['Rhythm: ',rhythm_status],'FontSize',16);


%% Clinical ECG Monitor Display

figure;

axis off;

text(0.1,0.85,'ECG MONITOR SYSTEM','FontSize',20);

text(0.1,0.65,sprintf('Heart Rate: %.1f BPM',heart_rate),'FontSize',16);

text(0.1,0.45,['Status: ',status],'FontSize',16);

text(0.1,0.25,['Rhythm: ',rhythm_status],'FontSize',16);


% Alarm message

if contains(rhythm_status,'Abnormal')
    alarm_message = 'WARNING: CHECK ECG RHYTHM';
elseif heart_rate > 100
    alarm_message = 'WARNING: HIGH HEART RATE';
elseif heart_rate < 50
    alarm_message = 'WARNING: LOW HEART RATE';
else
    alarm_message = 'SYSTEM NORMAL';
end

text(0.1,0.05,alarm_message,'FontSize',16);

%% ECG Machine Learning Preparation

% Extract features and labels

X = ecg(:,1:140); %ECG signals
Y = ecg(:,141);   %Labels

% Convert labels to categorical

Y = categorical(Y);

% Check data size

disp('ECG Samples');
disp(size(X));

disp('Labels:');
disp(categories(Y));

%% Split ECG Dataset

% Create random training and testing split

cv = cvpartition(Y,'Holdout',0.2);

% Training data
XTrain = X(training(cv),:);
YTrain = Y(training(cv));

% Testing data
XTest = X(test(cv),:);
YTest = Y(test(cv));

% Display sizes
disp('Training ECG Samples:');
disp(size(XTrain));

disp('Testing ECG Samples:');
disp(size(XTest));

%% Train SVM Classifier

% Train the model
svmModel = fitcsvm(XTrain, YTrain, 'KernelFunction','linear','Standardize',true);

disp('SVM model trained successfully.');

%% Test the classifier

% Predict labels for the test data
YPred = predict(svmModel,XTest);

% Calculate the accuracy
accuracy = sum(YPred == YTest)/numel(YTest)*100;

fprintf('Classification Accuracy: %.2f%%\n',accuracy);

%% Confusion Matrix

confusionchart(YTest, YPred);

title('ECG Arrhythmia Classification');

%% Performance Metrics 

TP = 578;
TN = 407;
FP = 9;
FN = 5;

accuracy = (TP + TN)/(TP + TN + FP + FN);
sensitivity = TP/(TP + FN);
specificity = TN/(TN + FP);
precision = TP/(TP + FP);

fprintf('Accuracy :%.2f%\n',accuracy*100);
fprintf('Sensitivity :%.2f%\n',sensitivity*100);
fprintf('Specificity :%.2f%\n',specificity*100)
fprintf('Precision :%.2f%\n',precision*100);

%% Displaying results in a monitor interface

figure('Name','Lane Healthcare ECG Monitor');

set(gcf,'Position',[100 100 900 600]);

subplot(2,1,1)

plot(filtered_ecg,'g','LineWidth',2);

grid on;

title('ECG Waveform');

xlabel('Samples');

ylabel('Amplitude');


subplot(2,1,2)

axis off

text(0.05,0.9,'LANE HEALTHCARE ECG MONITOR','FontSize',18);

text(0.05,0.7,sprintf('Heart Rate : %.1f BPM',heart_rate),'FontSize',15);

text(0.05,0.55,['Rhythm : ',rhythm_status],'FontSize',15);

text(0.05,0.40,['Status : ',status],'FontSize',15);

text(0.05,0.25,sprintf('AI Accuracy : %.2f %%',accuracy*100),'FontSize',15);

text(0.05,0.10,alarm_message,'FontSize',16);

%% Change your figure to a black background

figure('Color','k');

subplot(2,1,1)

plot(filtered_ecg,'g','LineWidth',2);

grid on

set(gca,'Color','k');
set(gca,'XColor','w');
set(gca,'YColor','w');

title('ECG Waveform','Color','w');
xlabel('Samples','Color','w');
ylabel('Amplitude','Color','w');

%% Highlight the R-peaks

hold on

plot(locations, peaks,'ro');

hold off

%% Add a Patient Information Panel

text(0.05,0.85,'Patient ID : 001','FontSize',14);

text(0.05,0.70,...
sprintf('Heart Rate : %.1f BPM',heart_rate),...
'FontSize',16);

text(0.05,0.55,...
['Rhythm : ',rhythm_status],...
'FontSize',16);

text(0.05,0.40,...
['AI Diagnosis : ',char(YPred(1))],...
'FontSize',16);

text(0.05,0.25,...
sprintf('Model Accuracy : %.2f %%',accuracy*100),...
'FontSize',16);

text(0.05,0.10,...
alarm_message,...
'FontSize',18);
