clc
clear
close all

% Setting Initial locations and velocities
pos = 0;
Vel = 0;
avgV = 0;
sumV = 0; % Holding the sum of Velocities to find the average

stepTime = 1e-12; % setting steptime to 1ps
n = 200; % number of steps
t = stepTime;

pScatter = 1-exp(-stepTime/1e-11); % probability of scattering
F = 10e-31; % setting an arbitrary value for the force.. 10m
m = 9.11e-31; % electron mass
a = F/m; % Acceleration

for i = 1:n
    figure(1)
    subplot(2,1,1)
    plot(t, pos,'b.')
    xlabel('Time')
    ylabel('Displacement')
    title('Position/Xdisplacement Vs Time')
    hold on
    
    subplot(2,1,2)
    plot(t, Vel, 'b.')
    xlabel('Time')
    ylabel('Velocity')  
    title('Velocity Vs Time')
    hold on
    
    t = t + stepTime;
    if(rand(1,1) > pScatter)
        Vel = Vel + a*t;
    else
        Vel = 0;
    end
    sumV = sumV + Vel;
    avgV = sumV/i;
    pos = pos + Vel*t;
    if (i == n)
        subplot(2,1,1)
        plot(t, pos,'b.')
        xlabel('Time')
        ylabel('Displacement')
        hold off
        
        subplot(2,1,2)
        plot(t, Vel,'b.')
        xlabel('Time')
        ylabel('Velocity')
        hold off
    end
    pause(0.001)
end
% the scattering is evident in the velocity plot as the velocity resets to
% zero when the electron scatters, and then starts increasing steadily
% again until the next scatter