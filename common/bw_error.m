function error = bw_error(x0,param,opt_param,freqX,freqY)

param = set_params(x0,param,opt_param);

linFreqResp = get_freq_resp(param,freqX);

error = sum((linFreqResp - freqY).^2,'all');