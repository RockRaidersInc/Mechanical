%% Rock Raiders
% Gearbox and Motor Analysis
clear, clc

disp('Use metric units.')

%%
%Taking user inputs
mass = input('Rover mass? '); %kilogram
max_velocity = input('What is the max speed? '); %meters/second^2
angle = input('What is the max incline in degrees? '); %degrees 
time = input('How many seconds do you want to take to reach max speed? '); %seconds
gearbox = input('What is the gear ratio going to be? ');
number_motors = input('How many motors? ');

%%
%Setting constants
radius = 0.1524; %meters60

gravity = 9.841; %meters/second^2
incline = angle * pi / 180; %Converting incline angle to radians
initial_velocity = 0; %Start from rest. meters/second
voltage = 12; %Volts

%%
%Calculations
acceleration = (2 * (max_velocity - initial_velocity)) / time; %meters/second^2
max_torque = mass * (acceleration + gravity * sin(incline)) * radius; %Total torque required. Newton*meter
individual_torques = max_torque / number_motors; %Torque required from each individual motor. Newton*meter
individual_torques_adjusted = individual_torques / gearbox; %Torque required from each motor before gearbox reduction. Newton*meter
motor_speed = max_velocity * 2 * pi * radius; %Motor speed in rev/s.
rpm = motor_speed * 60; %Motor speed in rev/minute
angular_velocity = motor_speed * 2 * pi; %rad/second
power = individual_torques * angular_velocity; %Power for each motor. Watts
current = power / voltage; %Current for each motor. A
total_current = current * number_motors; %Total current draw by motors. A

%%
%Displaying outputs
clc

disp('Maximum torque all motors need to supply:');
disp(max_torque);
disp('Torque each individual motor must produce:');
disp(individual_torques_adjusted);
disp('Total current draw by all motors:');
disp(total_current);
disp('Current each individual motor draws:');
disp(current);