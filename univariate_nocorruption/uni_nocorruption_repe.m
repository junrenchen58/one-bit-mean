function [error,errorgau,errl] = uni_nocorruption_repe(n,mu,repe,seed)
% this function simulates univariate case without corruption
% we consider gaussian variable with *unit* covariance
% this function averages over independent trials
% errorgau: error of sample mean using unquantized data ((sum_i X_i)/n - mu)
errl = zeros(1,repe);
for i = 1:repe
    rng(seed);
    [errl(i),~] = uni_nocorruption(n,mu);
    seed = seed + 1;
end
error = mean(errl);

% simulate errorgau
% observe: (sum_i X_i)/n - mu follows N(0,1)/sqrt(n)
errorgaul = randn(repe,1)/sqrt(n);
errorgau = mean(abs(errorgaul));
end

