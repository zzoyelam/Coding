M1 = 1;
M2 = 2;
B1 = 0.5;
B2 = 1;
K1 = 3;
K2 = 2;
a= K1/M1;
b =(B1/M1);
c = K1/M2;
d = (B1/M2);
e = (-K1 - K2)/M2;
g = (-B1 - B2)/M2;
syms s s2
AA = [s, -1, 0, 0; -a, s-b, a, b; 0,0, s,-1; -c, -d, -e, (s-g)];
f = [0; (1/M1); 0 ;0];
%y = [1 0 0 0];
%y1 = [0]
linsolve(AA,f)

%[out,in] = ss2tf(AA,f,y,y1)