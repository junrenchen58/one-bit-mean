function [error,errorgau] = mul_nocorruption_repe(n,d,mu,Sigma,repe,seed)
% this function simulates multivariate case without corruption
% averages over independent trials
% errorgau: error of sample mean using unquantized data  
errl = zeros(1,repe);
errlgau = zeros(1,repe);
for i = 1:repe
    rng(seed);
    [errl(i),errlgau(i)] = mul_nocorruption(n,d,mu,Sigma);
    seed = seed + 1;
end
error = mean(errl);
errorgau = mean(errlgau);
end

