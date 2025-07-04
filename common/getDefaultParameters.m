function param = getDefaultParameters()

% default parameters
param.etai = 1; 
param.taon = 5e-9;
param.gain = 2e5;
param.N0   = 5e5;
param.eps  = 1e-6;
param.taop = 4e-12;
param.beta = 1e-4;
param.omegaP = 20e9*2*pi;

% choose what parameters to optimize
param.opt.etai = 1; 
param.opt.taon = 1;
param.opt.gain = 1;
param.opt.N0   = 1;
param.opt.eps  = 1;
param.opt.taop = 1;
param.opt.beta = 1;
param.opt.omegaP = [];

% default current
param.I     = 10e-3;
param.Ioff  = 0.5e-3;

% default bounds for optimization
param.bounds.etai = [0.4 1]; 
param.bounds.taon = [1e-9 10e-9];
param.bounds.gain = [1e4 10e5];
param.bounds.N0   = [1e5 10e5];
param.bounds.eps  = [1e-6 1e-5];
param.bounds.taop = [1e-12 8e-12];
param.bounds.beta = [1e-6 1e-2];

% scaling for optimization
param.scaling.etai = 1; 
param.scaling.taon = 1e-9;
param.scaling.gain = 1e5;
param.scaling.N0   = 1e5;
param.scaling.eps  = 1e-6;
param.scaling.taop = 1e-12;
param.scaling.beta = 1e-3;
param.scaling.omegaP = 1e10;

% constant values
param.const.q           = 1.60217662e-19;
param.const.h           = 6.6261e-34;
param.const.lightSpeed  = 299792458;
param.const.lambda      = 850e-9;
param.const.freeSpaceFreq = param.const.lightSpeed/param.const.lambda;
