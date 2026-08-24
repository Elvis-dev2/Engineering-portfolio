function displayPanel(t,Flow,Pressure,FiO2,Agent)

figure('Name','Virtual Anesthesia Machine')

subplot(2,2,1)
plot(t,Flow,'b','LineWidth',2)
grid on
title('Fresh Gas Flow')
ylabel('L/min')

subplot(2,2,2)
plot(t,Pressure,'r','LineWidth',2)
grid on
title('Airway Pressure')
ylabel('cmH2O')

subplot(2,2,3)
plot(t,FiO2,'g','LineWidth',2)
grid on
title('Oxygen Concentration')
ylabel('%')

subplot(2,2,4)
plot(t,Agent,'m','LineWidth',2)
grid on
title('Anesthetic Agent')
ylabel('%')
xlabel('Time (s)')

end
