clear all
close all
clc

global GRAVITY BALLRADIUS INERTIA MASS DELTA_TIME PLOT_TIME K_COEF
K_COEF = 0.25
GRAVITY = -9.81;
BALLRADIUS = 1;
MASS = 1;
INERTIA = (2/5)*MASS*BALLRADIUS^2; 


DELTA_TIME = 0.01; % Smaller DELTA time increases precision of slope calculation
PLOT_TIME = 0.01; % Plot every ___ Seconds

velocity = [0.01, -0.01];
time = 0;
position = [0, 0];

addpath './curves'
addpath './objects'


initial_omega = 0;
%[final_position, velocities, accelerations, time] = brachistochrone(velocity, 14, position, time);

%[positions, velocities, accelerations, final_time] = slope(initial_velocity, slope_theta, initial_position, initial_time, final_position)
[positions, velocities, accelerations, final_time, omega, alpha] = slope(velocity, pi/4, position , time, -0.916);

elaspedTime = final_time;



[x_positions, y_positions, velocities, accelerations, time, finalPosition, omega, alpha] = brachistochrone(velocity, 14, position, elaspedTime, omega(length(omega)));

%[x_positions, y_positions, velocities, accelerations, time, finalPosition] = slope(velocity, pi/4, position, time, [0.916, -0.916])
%plotFunction(x_positions, y_positions, velocities, accelerations, time, finalPosition)

Time_taken = time;


disp('Final Velocity (m/s)')
disp('   V_x      V_y')
disp(getOldVelocity(0))
