% script creates a generic laser respose and uses the freq. resp. to blindly extract parameters

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

laser_gen1.I = 10e-3;
laser_gen1.Ioff = 0.5e-3;

% create sample frequency response data for laser_gen1
freqX = (0.5:0.25:40).*1e9;
freqY = get_freq_resp(laser_gen1,freqX);

% extract parameters from freq response 
laserOpt = getDefaultParameters();
laserOpt.opt.etai = 0; % disable optimization of etai
opt_param = scale_params(laserOpt);

% set up optimization problem
options = optimset('MaxIter', 10000, 'TolFun', 1e-20);
fun = @(x0) bw_error(x0,laserOpt,opt_param,freqX,freqY);
[x,fval] = fmincon(fun,opt_param.x0_scaled,[],[],[],[],opt_param.lb, opt_param.ub,[],options);

% calculate frequency response using extracted parameters
laserOptNew = set_params(x,laserOpt,opt_param);
freqYOpt = get_freq_resp(laserOptNew,freqX);

% plot original vs extracted freq. resp.
figure;
plot(freqX/1e9,freqY,'-','LineWidth',3);hold on;
plot(freqX/1e9,freqYOpt,'--','LineWidth',3)
legend({'Original', 'Extracted'})
xlabel('Frequency (GHz)')
ylabel('Mag (dB)')
grid on
