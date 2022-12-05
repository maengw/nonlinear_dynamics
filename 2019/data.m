clear all 
clc
close all

%% System Parameter
A=[0 1;-5 -6];
b=[0;1];
c=[1 0]; 
x0=[0.1;0]; 
ct=[10 1];
stoptime=10;

% Gain Calculation
p=[-0.1 -0.5];
K=place(A,b,p);
open('example2019')
sim('example2019')

%% Figures 
figure(1)
plot(x1)
grid on
hold on
xlabel('Time (sec)')
ylabel('$$x_1(k)$$','Interpreter', 'Latex')
title('Response of state $$x_1(k)$$', 'Interpreter', 'Latex')
movegui('northwest')

figure(2)
plot(x2)
grid on
hold on
xlabel('Time (sec)')
ylabel('$$x_2(k)$$','Interpreter', 'Latex')
title('Response of state $$x_2(k)$$', 'Interpreter', 'Latex')
movegui('center')