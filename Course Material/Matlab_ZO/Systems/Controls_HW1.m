%% ESE 441: HW 1
%% Part A
I = 0.1;
P = 0.5;
sim('cruise.slx')
plot(Time,Vel);
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velocity as a Function of Time');
%% Part B
I = 0.01;%Increase in I causes large overshoot & instability, Decrease -- opposite
P = 0.8; %Decrease in P causes large overshoot & instability, Increase -- opposite
sim('cruise.slx')
plot(Time,Vel);
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velocity as a Function of Time');

