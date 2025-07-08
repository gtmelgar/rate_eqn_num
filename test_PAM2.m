% script creates a generic laser respose and uses the freq. resp. to blindly extract parameters

addpath('./common')

% create custom set of parameters for laser
laser_gen1 = getDefaultParameters();

laser_gen1.etai = 1; 
laser_gen1.taon = 2e-9;
laser_gen1.gain = 4e5;
laser_gen1.N0   = 4e5;
laser_gen1.eps  = 1e-6;
laser_gen1.taop = 2e-12;
laser_gen1.beta = 2e-6;
laser_gen1.omegaP = 20e9*2*pi;

laser_gen1.Ioff = 0.5e-3;

% drive current parameters
num_bits = 200;
bit_rate = 40e9;
samp_per_symbol = 16;
bias_current = 4e-3;
amplitude    = 5e-3;

% create filtered current
digital_pattern = randi(2,1,num_bits)-1;
digital_pattern_upsampled = digital_pattern(ones(samp_per_symbol,1),:);
digital_pattern_upsampled = digital_pattern_upsampled(:);

gaussfilter = gaussdesign(0.7,4,samp_per_symbol); 
drive_current = digital_pattern_upsampled.*amplitude + bias_current;
laser_gen1.I = conv(drive_current,gaussfilter,'same'); 

figure;
plot(drive_current);hold on
plot(laser_gen1.I(1:end))

dt = 1/(samp_per_symbol.*bit_rate);
t_span = 0:dt:(dt*((num_bits)*16)-dt);
[T45,Y45] = ode45(@(t,y) laser_eqn(t,y,laser_gen1,t_span),[t_span(1) t_span(end)],[0 0]);

% plot drive current vs laser output
figure;
yyaxis left
plot(T45/1e-9,Y45(:,2))
ylabel('photon number')
xlabel('time (ns)')
yyaxis right
plot(t_span/1e-9,laser_gen1.I(1:end))
ylabel('drive current (mA)')