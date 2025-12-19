function error = mul_corruption_repe(n,d,eta,lambda,repe,seed)
% this function simulates multivariate case with corruption
% averages over independent trials 
errl = zeros(1,repe); 
for i = 1:repe
    rng(seed);
    errl(i)  = mul_corruption(n,d,eta,lambda);
    seed = seed + 1;
end
error = mean(errl); 
end

