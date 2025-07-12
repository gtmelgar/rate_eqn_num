%% VCSEL parameters from PV Mena A Simple Rate-Equation-Based Thermal VCSEL Model

function dy = laser_eqn_sine(t,y,param,freq)

laser_current = param.I + param.const.freqAmp*sin(2*pi*freq.*t);

carrierNum = y(1);
photonNum = y(2);

dN = (param.etai.*(laser_current-param.Ioff))./param.const.q - carrierNum./param.taon - (param.gain.*(carrierNum-param.N0)*photonNum)./(1+param.eps.*photonNum);
dS = -(photonNum./param.taop) + ((param.beta.*carrierNum)./param.taon) +(param.gain.*(carrierNum-param.N0).*photonNum)./(1+param.eps.*photonNum);

dy = [dN; dS];