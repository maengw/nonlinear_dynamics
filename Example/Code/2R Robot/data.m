clear all 
clc
close all

%% System Parameter
tic
Input_th = [pi/4; 0];
stoptime=10;
open('Two_r_rob')
sim('Two_r_rob')
toc

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