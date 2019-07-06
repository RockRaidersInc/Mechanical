%% Rock Raiders - Motor Selection
%% Administrative
%A file to help estimate necessary torque requirements of a rover.
%Johnathan Corbin - 2018
clear, clc

%% Constants
%Declaration of several constants regarding the rover.
motor_voltage = 12; %Volts
mass = 50; %kg, slightly over for a better factor of safety.
gravity = 9.81; %m/s^2
weight = mass * gravity; %N
wheel_radius = .3048 / 2; %m
target_speed = 1; %m/s
motors = 4; %# of motors
gear_ratio = 81; %Gear Ratio

%% Rolling Resistance
%I'd like to point out that we could determine this resistance by pulling
%the rover across various conditions with the wheels assembled. Otherwise
%this is all just estimates.

%Coefficient of rolling resistance for a stage coach on dirt and snow.
Crr1 = .073;
%Addition to the coefficient of rolling resistance for drive train
%inefficiences.
Crr = Crr1 + .01;

%Calculating resistive force.
F_rolling = Crr * weight; %N

%Torque needed.
rolling_torque = F_rolling * wheel_radius;

%% Slope Climbing
%Moving up a slope affects affects the torque needed. Larger slope means
%more torque.

%Setting an array of slope degrees from 0 to 90.
degrees = (0:90);
%Converting to radians.
radians = degrees * pi / 180;

%Calculating slope force.
F_slope = weight * sin(radians);
%Note: I'm using the y-component of weight, not
%the x-component. This makes this estimate slightly larger, which gives us
%a larger margin of error.

%Torque needed.
slope_torque = F_slope * wheel_radius;

%% Air drag.
%Technically at large speeds, an analysis of air drag is required. I'm going to neglect
%this, since we shouldn't be operating at high enough speeds to encounter
%sufficient drag forces.

%% Total Torque.
%The total torque required to overcome rolling resistance and the slope.
total_torque = rolling_torque + slope_torque;

%Plotting the total torque vs. the degree of slope.
figure
subplot(5, 2, [1 2]);
plot(degrees, total_torque)
hold on
plot([0 90], [1 1]*rolling_torque, 'r') %Plot for rolling torque
grid on
xlabel('Degree of Slope')
ylabel('Torque needed in Nm')
title('Pre-Gear Ratio vs. Slope')
legend('Total Torque', 'Torque for flat travel')
hold off

torque_calculations(gear_ratio, total_torque, motors, degrees)

%% Motor Speed
%Motor speed calculated from our desired linear speed.
w = target_speed / wheel_radius; %rad/s
%Assumes no wheel slippage.

%Converting to RPM.
angular_velocity = w * 60 / ( 2 * pi);

%% Motor Power
%The total power that needs to be produced by all motors.
power_total = w * total_torque;

%The power needed to roll over flat ground.
power_rolling = w * rolling_torque;

%Plotting power vs. degree of slope
subplot(5, 2, [5 6]);
plot(degrees, power_total, 'r')
hold on
plot([1 90], [1 1]*power_rolling, 'g')
grid on
xlabel('Degree of Slope')
ylabel('Power needed in Watts')
title('Required Power vs. Slope')
legend('Total Power', 'Power for flat ground')
hold off

%% Creating Table for Values of Motor Requirements

slope = [0; 10; 20; 30; 40];
torque = [total_torque(1); total_torque(10); total_torque(20); total_torque(30); total_torque(40)];
wheel_torque = torque / motors;
motor_torque = wheel_torque / gear_ratio;
power = [power_total(1); power_total(10); power_total(20); power_total(30); power_total(40)];
motor_power = power / motors;
names = {'Degree'; 'Torque'; 'WheelTorque'; 'MotorTorque'; 'TotalPower'; 'MotorPower'};
disp('Table for necessary motor requirements.')
table = table(slope, torque, wheel_torque, motor_torque, power, motor_power, 'VariableNames', names);
disp(table)
disp('Torque (Nm)')
disp('Power (W)')
disp('WheelTorque is how much torque is required at the contact point of each individual wheel and the ground.')
disp('MotorTorque is how much torque each motor individually needs, after accounting for the indicated gear ratio.')


%% Motor Analysis - am-0912
%These are values for our old motors, designated as motor A.
no_load_speed_A = 16000; %rpm
stall_torque_A = .428; %Nm
no_load_current_A = 1.2; %A
stall_current_A = 63.745; %A
%{
%Reading in the motor curves for the motor.
old_motor_curve = imread('am0912_Curves.jpg');
figure
%subplot(4, 4, [1, 2, 5, 6])
imshow(old_motor_curve)
title('Old Motor Curves (am-0912)')
%}

%% Motor analysis - am-3775
%These are values for our redline motors, designated as motor B.
no_load_speed_B = 19649; %rpm
stall_torque_B = .6273; %Nm
no_load_current_B = 3.162; %A
stall_current_B = 106.918; %A

%{
%Reading in the motor curves for the motor.
redline_curve = imread('Redline_Curves.jpg');
%subplot(4, 4, [11, 12, 15, 16])
figure
imshow(redline_curve)
title('Redline Motor Curves (am-3775)')
%}

%% Functions
function torque_calculations(gear_ratio, total_torque, motors, degrees)
individual_torques_wheel = total_torque / motors;
individual_torques_motors = individual_torques_wheel / gear_ratio;
subplot(5, 2, [9 10])
plot(degrees, individual_torques_motors)
xlabel('Degree of Slope')
ylabel('Torque needed in Nm')
title('Post - Gear Ratio for Each Motor vs. Slope')
grid on
end
%% Junk Code
%{
models = {'am-0912'; 'am-3775'};

no_load_speed_all = [no_load_speed_A; no_load_speed_B];
stall_torque_all = [stall_torque_A; stall_torque_B];
no_load_current_all = [no_load_current_A; no_load_current_B];
stall_current_all = [stall_current_A; stall_current_B];

no_load_speed_all = [1; 2];
stall_torque_all = [1; 2];
no_load_current_all = [1; 2];
stall_current_all = [1; 2];
columns = {'NoLoadSpeed'; 'StallTorque'; 'NoLoadCurrent'; 'StallCurrent'};
disp('Table with motor specifications.')
motor_table = table2(no_load_speed_all, stall_torque_all);
disp(motor_table)
disp('NoLoadSpeed (RPM)')
disp('StallTorque (Nm)')
disp('NoLoadCurrent (A)')
disp('StallCurrent (A)')


% %Motor performance curves
% speed_A = no_load_speed_A * (1 - torques / stall_torque_A); 
% current_A = no_load_current_A + (stall_current_A - no_load_current_A) * (1 - w / no_load_speed_A);
% power_A = no_load_speed_A * torques - (no_load_speed_A / stall_torque_A) * torques.^2;
% efficiency_A = power_A / (current_A * motor_voltage);
% 
% %Plotting the curves
% figure
% subplot(2, 2, 1);
% plot(torques, speed_A, 'r')
% title('Speed vs. Torque')
% xlabel('Torque')
% ylabel('Speed (RPM)')
% grid on
% 
% subplot(2, 2, 2);
% plot(torques, current_A)
% title('Current vs. Torque')
% xlabel('Torque')
% ylabel('Current (A)')
% grid on
% 
% subplot(2, 2, 3);
% plot(torques, power_A);
% title('Power vs. Torque')
% xlabel('Torque')
% ylabel('Power (W)')
% grid on
% 
% subplot(2, 2, 4);
% plot(torques, efficiency_A);
% title('Efficiency vs. Torque')
% xlabel('Torque')
% ylabel('Efficiency')
% grid on
%}