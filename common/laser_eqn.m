function dy = laser_eqn(t,y,param)

q = 1.60217662e-19;

N = y(1);
S = y(2);

dN = (param.etai.*(param.I-param.Ioff))./q - N./param.taon - (param.gain.*(N-param.N0)*S)./(1+param.eps.*S);
dS = -(S./param.taop) + ((param.beta.*N)./param.taon) +(param.gain.*(N-param.N0).*S)./(1+param.eps.*S);

dy = [dN; dS];