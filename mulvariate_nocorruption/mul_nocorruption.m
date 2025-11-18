function [error,gausserr] = mul_nocorruption(n,d,mu,Sigma)
% this function simulates multivariate case without orruption
% we cibsuder gaussian vectors
oriX = mvnrnd(mu,Sigma,n);

n0 = ceil(2*sqrt(n));
epi = sqrt(9/n);
Xf = oriX(1:n0,:); % n0 * d full samples for estimating quantiles
Xq = oriX(n0+1:end,:); % (n-n0) * d 1bit samples for estimating quantiles

alpha = quantile(Xf,epi,1); alpha = alpha';
beta = quantile(Xf,1-epi,1); beta = beta';
mu1 = (alpha+beta)/2;
Delta = (beta-alpha)/2;

tau = 2*(rand(n-n0,d) - 1/2);
matmu1 = ones(n-n0,1)*mu1';
dotXq = sign(Xq - matmu1 + tau*diag(Delta));

hatmu = (mean(dotXq)*diag(Delta))'+mu1;
error = norm(mu-hatmu);

fullest = mean(oriX);
fullest = fullest';
gausserr = norm(mu - fullest);
end

