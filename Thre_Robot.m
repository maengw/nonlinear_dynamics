clc
clear
syms x1 y1 x2 y2 x3 y3 L1 L2 L3 th1 th2 th3 th1d th2d th3d m1 m2 m3 I1 I2 I3 th2dd th1dd th3dd

% Position of Centre of mass of links: 
x1 = L1 * cos(th1);  
y1 = L1 * sin(th1);
x2 = L1 * cos(th1) + L2 * cos(th1 + th2) ;
y2 = (L1 * sin(th1) + L2 * sin(th1 + th2));
x3 = L1 * cos(th1) + L2 * cos(th1 + th2) + L3 * cos(th1 + th2 +th3);
y3 = (L1 * sin(th1) + L2 * sin(th1 + th2)) + L3 * sin(th1 + th2 +th3);

%x1_dot and y1_dot wrt theta1
x1d = diff(x1,th1) * th1d;
y1d = diff(y1,th1) * th1d;

%x2_dot and y2_dot wrt theta1
x2d1 = diff(x2,th1) * th1d;
y2d1 = diff(y2,th1) * th1d;

%x2_dot and y2_dot wrt theta2
x2d2 = diff(x2,th2) * th2d;
y2d2 = diff(y2,th2) * th2d;

%x3_dot and y3_dot wrt theta1:
x3d1 = diff(x3,th1) * th1d;
y3d1 = diff(y3,th1) * th1d;

%x3_dot and y3_dot wrt theta2
x3d2 = diff(x3,th2) * th2d;
y3d2 = diff(y3,th2) * th2d;

%x3_dot and y3_dot wrt theta3
x3d3 = diff(x3,th3) * th3d;
y3d3 = diff(y3,th3) * th3d;

%Total x2_dot and y2_dot
x2d = x2d1 + x2d2;
y2d = y2d1 + y2d2;

%Total x3_dot and y3_dot
x3d = x3d1 + x3d2 + x3d3;
y3d = y3d1 + y3d2 + y3d3;



% Kinetic Energy of Both links:
K1 = (0.5 * m1* (x1d ^2 + y1d^2)) + (0.5 * I1 * (th1d ^2));
K2 = 0.5 * m2 * (x2d ^2 + y2d^2) + (0.5 * I2 * (th1d +th2d)^2);
K3 =  0.5 * m3 * (x3d ^2 + y3d^2) + (0.5 * I3 * (th1d +th2d + th3d)^2);



% Derivative of Kinetic Energy 1 wrt theta1 and theta2:
dK1_dth1 = simplify(diff(K1, th1));
dK1_dth2 = simplify(diff(K1, th2));
dK1_dth3 = simplify(diff(K1, th3));
dK1_dthd1 = simplify(diff(K1, th1d));
dK1_dthd2 = simplify(diff(K1, th2d));
dK1_dthd3 = simplify(diff(K1, th3d));

% Derivative of Kinetic Energy 2 wrt dtheta1 and dtheta2:
dK2_dth1 = simplify(diff(K2, th1));
dK2_dth2 = simplify(diff(K2, th2));
dK2_dth3 = simplify(diff(K2, th3));
dK2_dthd1 = simplify(diff(K2, th1d));
dK2_dthd2 = simplify(diff(K2, th2d));
dK2_dthd3 = simplify(diff(K2, th3d));

% Derivative of Kinetic Energy 3 wrt dtheta1 and dtheta2:
dK3_dth1 = simplify(diff(K3, th1));
dK3_dth2 = simplify(diff(K3, th2));
dK3_dth3 = simplify(diff(K3, th3));
dK3_dthd1 = simplify(diff(K3, th1d));
dK3_dthd2 = simplify(diff(K3, th2d));
dK3_dthd3 = simplify(diff(K3, th3d));



% Derivative of Kinetic Energy wrt time:
L1_t = dK1_dthd1 + dK2_dthd1 + dK3_dthd1;
L1 = simplify((diff(L1_t, th1d)* th1dd) + (diff(L1_t, th2d)* th2dd) + (diff(L1_t, th3d)* th3dd)...
    + (diff(L1_t, th1)* th1d) + (diff(L1_t, th2)* th2d) + (diff(L1_t, th3)* th3d));

L2_t = dK1_dthd2 + dK2_dthd2 + dK3_dthd2;
L2 = simplify((diff(L2_t, th1d)* th1dd) + (diff(L2_t, th2d)* th2dd) + (diff(L2_t, th3d)* th3dd)...
    + (diff(L2_t, th1)* th1d) + (diff(L2_t, th2)* th2d) + (diff(L2_t, th3)* th3d));

L3_t = dK1_dthd3 + dK2_dthd3 + dK3_dthd3;
L3 = simplify((diff(L3_t, th1d)* th1dd) + (diff(L3_t, th2d)* th2dd) + (diff(L3_t, th3d)* th3dd)...
    + (diff(L3_t, th1)* th1d) + (diff(L3_t, th2)* th2d) + (diff(L3_t, th3)* th3d));

T1 = simplify(- dK1_dth1 - dK2_dth1 - dK3_dth1 + L1);
T2 = simplify(- dK1_dth2 - dK2_dth2 - dK3_dth2 + L2);
T3 = simplify(- dK1_dth3 - dK2_dth3 - dK3_dth3 + L3);

