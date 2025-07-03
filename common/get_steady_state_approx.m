function [bN1, bS1] = get_steady_state_approx(param)
% in simple steady state solution assume N = Nth 
% assumes G = g0(N-N0)/(1+eps.*S)

bS1 = param.etai/param.const.q.*((param.I - param.Ioff)).*param.taop;
bN1 = (1/(param.taop.*param.gain)).*(1+param.eps.*bS1) + param.N0;
