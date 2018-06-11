%% Problem 1
A = [2 5; 0 -1];
B = [1 ; 1];
p = [-2+3j -2-3j];
K = place(A,B,p)

%% Problem 2

%% Problem 3

%% Problem 4

%% Problem 5
len = 1; 
Jt = 0.1;
mg = 10;
gamma = 0.1;
theta0 = 0.0001;
omega0 = 0;
%% Problem 5new
A = [0,1; (mg*len)/Jt, -gamma/Jt];
B = [0; len/Jt];
p2 = [-10.5125 9.5125]
K2 = place(A,B,p2);