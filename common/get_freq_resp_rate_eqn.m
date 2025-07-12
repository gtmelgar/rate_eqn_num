function [transferFunction] = get_freq_resp_rate_eqn(param,freqX)

freqRespSingle = zeros(length(freqX),1);
numFreqRange = length(freqX);

options = odeset('RelTol',1e-10);

for p = 1:numFreqRange
    Fs = (freqX(p)*100); 
    t_span = 0:1/Fs:1/(freqX(p))*100;
    
    [~,Y45] = ode45(@(t,y) laser_eqn_sine(t,y,param,freqX(p)),t_span,[0 0],options); 
    
    signal = Y45(:,2);
    signal = signal(floor(end/2):end)-mean(signal(floor(end/2):end));
    L = length(signal);
    Y = fft(signal);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = Fs*(0:(L/2))/L;
    positions = (f<freqX(p)+0.05e9) & (f>freqX(p)-0.05e9);
    freqRespSingle(p) = max(P1(positions));
end

freqRespSingle = freqRespSingle./freqRespSingle(ones(numFreqRange,1),:);
transferFunction = 20*log10(abs(freqRespSingle)); 