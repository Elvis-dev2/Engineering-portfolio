function alarmSystem(FiO2,Pressure)

if min(FiO2) < 30
    warning('LOW OXYGEN ALARM')
end

if max(Pressure) > 30
    warning('HIGH AIRWAY PRESSURE')
end

disp('System Check Complete')

end