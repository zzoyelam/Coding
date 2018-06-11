%% Problem 3c
A = [0 1 0
    0 0 1
    -8 -14 -7];
B = [0
    0
    1];
C = [ 9 2 0];
D = 0;

[b,a] =ss2tf(A,B,C,D);
tf_3c = tf(b,a)

%% Problem 4b
A = [0 1 0
    0 0 1
    0 0  -1];
B = [0
    0
    1];
C = [ 1 0 0];
D = 0;
[b2,a2] =ss2tf(A,B,C,D);
tf_4b = tf(b2,a2)
pole(tf_4b)
%% Problem 5
len = 1; 
Jt = 0.1;
mg = 10;
gamma = 0.1;
theta0 = 0.1;
omega0 = 0;
sim('Controls_HW3_P5.slx')
plot(time,output);
xlabel('Time (s)');
ylabel('Output');
title('Simulink Model of Inverted Pendulum');
%% Part A & B & C
% 
%  The state variables are the the inputs of the integrator blocks while
%  the initial conditions are also an input (as a constant block) into the integrator block.
%  
%   Yes, this is expected as the system is not disturbed, so it does not
%   lead to an output.
%%-------------------------------------------------------------------------
len = 1; 
Jt = 0.1;
mg = 10;
gamma = 0;
theta0 = 0.0001;
omega0 = 0;
sim('Controls_HW3_P5.slx')
plot(time,output);
xlabel('Time (s)');
ylabel('Output');
title('Simulink Model of Inverted Pendulum');
%% Part D
% 
% Yes, it would be expected that the system is non-linear as it doesn't
% have linear features, especially as it is oscillating.
% 
 
%%-------------------------------------------------------------------------
len = 1; 
Jt = 0.1;
mg = 10;
gamma = 0;
theta0 = 0.0001;
omega0 = 1;
sim('Controls_HW3_P5.slx')
plot(time,output);
xlabel('Time (s)');
ylabel('Output');
title('Simulink Model of Inverted Pendulum');
%% Part E
% 
% The plot is demonstrating the pendulum is infinitely increasing in speed.
% 
%%
len = 1; 
Jt = 0.1;
mg = 10;
gamma = 0.1;
theta0 = 0.0001;
omega0 = 1;
sim('Controls_HW3_P5.slx')
plot(time,output);
xlabel('Time (s)');
ylabel('Output');
title('Simulink Model of Inverted Pendulum');
%% Part F
% 
% The pendulum is slowing down.

%% Problem 5
mg = 10;
Jt = 0.1;
gamma = 0.1;
len = 1;
theta0 = 0.1;
omega0 = 0;
A = [0,1; (mg*len)/Jt, -gamma/Jt];
B = [0; len/Jt];
C = [0 0];
D = 0;
[b3,a3] =ss2tf(A,B,C,D);
sys = tf(b3,a3)
pole(sys)