function [Sigma,tr] = lowtracecovariance(d,seed)
rng(seed);
Sigma = diag(zeros(d,1));
tr = 0;
for i=1:d
    Sigma(i,i) = 1/(i^2);
    tr = tr + 1/(i^2);
end

% get an orthogonal matrix following Haar
A = randn(d);
[Q, R] = qr(A);
Q = Q * diag(sign(diag(R))); 

Sigma = Q' * Sigma * Q; 
end

