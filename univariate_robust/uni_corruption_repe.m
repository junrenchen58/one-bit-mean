function [error,errtrim,errl,errltrim] = uni_corruption_repe(n,mu,eta,repe,seed)
% this function simulates univariate case with corruption
% we consider gaussian variable with *unit* covariance
% this function averages over independent trials
% errtrim: the mean error of the trimmed-mean estimator
errl = zeros(1,repe);
errltrim = zeros(1,repe); 
for i = 1:repe
    rng(seed);
    [errl(i),errltrim(i)] = corruni_corruption(n,mu,eta);
    seed = seed + 1;
end
error = mean(errl);
errtrim = mean(errltrim); 
end

