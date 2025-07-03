close all

addpath('./common')

laser = getDefaultParameters();
laser.I = 1e-3;
laser.Ioff = .5e-3;

tSpan = [0 10e-9];

[T45,Y45] = ode45(@(t,y) laser_eqn(t,y,laser),tSpan,[0 0]);

[carrierNumApprox, photonNumApprox] = get_steady_state_approx(laser);
[carrierNum, photonNum] = get_steady_state(laser);

figure;
subplot(2,1,1);
plot(T45/1e-9,Y45(:,1));
hold on
plot([T45(1); T45(end)]/1e-9, [carrierNumApprox;carrierNumApprox])
plot([T45(1); T45(end)]/1e-9, [carrierNum;carrierNum],'--')
xlabel('time(ns)')
ylabel('carrier number')
legend({'ode45', 'approximation', 'exact'})
subplot(2,1,2); 
plot(T45/1e-9,Y45(:,2))
hold on
plot([T45(1); T45(end)]/1e-9, [photonNumApprox;photonNumApprox])
plot([T45(1); T45(end)]/1e-9, [photonNum;photonNum], '--')
xlabel('time(ns)')
ylabel('photon number')
legend({'ode45', 'approximation', 'exact'})
