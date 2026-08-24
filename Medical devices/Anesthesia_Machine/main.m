clear
clc
close all

Ts = 0.01;
T = 60;

t = 0:Ts:T;

%% Gas flow rates (L/min)

O2 = 2 + 0.2*sin(0.2*t);

Air = 3 + 0.1*sin(0.3*t);

N2O = 1 + 0.15*sin(0.5*t);

%% Total flow

Flow = O2 + Air + N2O;

%% Oxygen concentration

FiO2 = (O2 ./ Flow)*100;

%% Vaporizer

Agent = 2*ones(size(t));

%% Pressure

Pressure = 15 + 3*sin(2*pi*0.25*t);

%% Display

displayPanel(t,Flow,Pressure,FiO2,Agent);

%% Alarm

alarmSystem(FiO2,Pressure);