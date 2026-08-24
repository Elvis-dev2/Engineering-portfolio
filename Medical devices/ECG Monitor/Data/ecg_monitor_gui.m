
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