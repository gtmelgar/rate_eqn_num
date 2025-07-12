function freqRespdB = get_freq_resp(param,freqX)
% TO DO: add parasitics to freqResp: 1./(1+1i*omegaBW./param.omegaP);

[carrierNum, photonNum] = get_steady_state(param);

A = param.gain./(1+param.eps.*photonNum);
Ap = param.gain*(carrierNum-param.N0).*param.eps ./ (1+param.eps.*photonNum).^2;

WrSquared = photonNum.*A./param.taop  + param.beta./(param.taop.*param.taon) + (photonNum.*Ap./param.taon + param.beta.*carrierNum./(param.taon.^2.*photonNum)).*(1-param.beta);
FrSquared = WrSquared/(4*pi^2);
Gamma = 4.*pi.^2.*param.taop.*(1+Ap./A).*FrSquared+1./param.taon+param.beta.*carrierNum./(param.taon.*photonNum);

omegaBW = 2*pi*freqX(:)';

freqRespLin = (WrSquared./(WrSquared - omegaBW.^2 + 1i.*omegaBW.*Gamma)); 

freqRespdB = 20*log10(abs(freqRespLin'));