close all

addpath('./common')

laser.etai = 1; 
laser.taon = 5e-9;
laser.gain = 2e5;
laser.N0   = 3e5;
laser.eps  = 1e-6;
laser.taop = 4e-12;
laser.beta = 1e-4;

laser.I = 10e-3;
laser.Ioff = 0.5e-3;

tSpan = [0 10e-9];

[T45,Y45] = ode45(@(t,y) laser_eqn(t,y,laser),tSpan,[0 0]); 

figure;
plot(T45/1e-9,Y45(:,1));
xlabel('time(ns)')
ylabel('carrier number')

figure;
hold on
plot(T45/1e-9,Y45(:,2))
xlabel('time(ns)')
ylabel('photon number')