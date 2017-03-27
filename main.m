clear all
close all
clc

global GRAVITY BALLRADIUS INERTIA MASS DELTA_TIME PLOT_TIME STATIC_FRICTION KINETIC_FRICTION

% Kinetic friction is less thann static friction
KINETIC_FRICTION = 0.1;
STATIC_FRICTION = 0.1;

GRAVITY = -9.81;
BALLRADIUS = 1;
MASS = 1;
INERTIA = (2/5)*MASS*BALLRADIUS^2; 


DELTA_TIME = 0.001; % Smaller DELTA time increases precision of slope calculation
PLOT_TIME = 0.05; % Plot every ___ Seconds

velocity = [0.01, -0.01];
time = 0;
position = [0, 0];
omega = 0;
slope_angle = pi/6;
final_slope_position = [3, 3];

addpath './curves'
addpath './objects'

[x_positions, y_positions, velocities, accelerations, time, finalPosition] = brachistochrone(velocity, 2, position, time, omega);

% slope down 3 to the right and 4 units down
[x_positions2, y_positions2, velocities2, accelerations2, time, finalPosition, omega, alpha] = slope(getOldVelocity(0), finalPosition, time, [finalPosition(1) + 3, finalPosition(2) + 5], omega);


% append the vectors returned by second function to the vec
x_positions = [x_positions x_positions2]
y_positions = [y_positions y_positions2]
velocities = [velocities velocities2]
accelerations = [accelerations accelerations2]

plotFunction(x_positions, y_positions, velocities, accelerations, time, [36, -36]);


Time_taken = time;


disp('Final Velocity (m/s)')
disp('   V_x      V_y')
disp(getOldVelocity(0))
