function dy = laser_eqn(t,y,param)
% laser rate equation from P. V. Mena "A simple rate-equation-based thermal VCSEL model," JLT doi: 10.1109/50.762905.
% TO DO: add thermal variation

carrierNum = y(1);
photonNum = y(2);

dN = (param.etai.*(param.I-param.Ioff))./param.const.q - carrierNum./param.taon - (param.gain.*(carrierNum-param.N0)*photonNum)./(1+param.eps.*photonNum);
dS = -(photonNum./param.taop) + ((param.beta.*carrierNum)./param.taon) +(param.gain.*(carrierNum-param.N0).*photonNum)./(1+param.eps.*photonNum);

dy = [dN; dS];