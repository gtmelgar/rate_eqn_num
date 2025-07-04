function param = set_params(x0,param,opt_param)

for ii = 1:length(opt_param.x0_name)
    param.(opt_param.x0_name{ii}) = x0(ii).*param.scaling.(opt_param.x0_name{ii});
end
