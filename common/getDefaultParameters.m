function param = getDefaultParameters()

param.etai = 1; 
param.taon = 5e-9;
param.gain = 2e5;
param.N0   = 5e5;
param.eps  = 1e-6;
param.taop = 4e-12;
param.beta = 1e-6;

param.I     = 10e-3;
param.Ioff  = 0.5e-3;

param.etaiBound = [0 1]; 
param.taonBound = [1e-9 10e-9];
param.gainBound = [1e5 10e5];
param.N0Bound   = [1e5 10e5];
param.epsBound  = [1e-9 1e-5];
param.taopBound = [1 8e-12];
param.betaBound = [1e-6 1e-2];

param.const.q = 1.60217662e-19;