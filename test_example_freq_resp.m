close all

addpath('./common')

laser = getDefaultParameters();
laser.I = 10e-3;
laser.Ioff = 0.5e-3;

tSpan = [0 10e-9];

param.const.freqAmp = 1e-9;
freqX = (0.5:0.25:40).*1e9;
freqY = get_freq_resp(laser,freqX);
[transferFunction] = get_freq_resp_rate_eqn(laser,freqX);

figure;
plot(freqX/1e9, freqY); hold on
plot(freqX/1e9, transferFunction, '--');
xlabel('freq (GHz)')
ylabel('Magnitude (dB)')
legend({'calculated', 'ode45'})
