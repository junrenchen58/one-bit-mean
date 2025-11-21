function [error,trimerror] = corruni_corruption(n,mu,eta)
% this function simulates univariate case with corruption
% we consider gaussian variable with *unit* covariance
% trimerror: the error of the trimmed-mean estimator (Lugosi & Mendelson) 
orix = randn(n,1)+mu;
numcorr = floor(eta*n);
[~,indx] = maxk(orix,numcorr);
orix(indx) = 2*mu - orix(indx); % corrupt the largest eta*n entries  

n0 = ceil(sqrt(n)); % to be chosen
epi = eta+1/sqrt(n); % to be chosen
samp = randperm(n, n0);
others = setdiff(1:n, samp);
Xf = orix(samp);
Xq = orix(others);

alpha = quantile(Xf,epi);
beta = quantile(Xf,1-epi);

mu1 = (alpha+beta)/2;
Delta = (beta-alpha)/2;

tau = (rand(n-n0,1)-0.5) * 2 * Delta;
dotXq = sign(Xq - mu1 + tau);
hatmu = mean(Delta * dotXq) + mu1;
error = abs(hatmu - mu);

%% use the same parameter as ours
xil = [0.1,0.2,0.3,0.4,0.5];
ll = length(xil);
trimerrorl = zeros(size(xil));
for i = 1:ll
    xi = xil(i);
    trimn0 = floor(xi*n); 
    trimXf = orix(1:trimn0); % for compute quantiles
    trimXe =  orix(trimn0+1:end); % for estimation
    alpha2 = quantile(trimXf,epi); 
    beta2 = quantile(trimXf,1-epi);
    trimXe(trimXe>beta2) = beta2; 
    trimXe(trimXe<alpha2) = alpha2; % trim the data for estimation
    trimmean = mean(trimXe); 
    trimerrorl(i) = abs(trimmean - mu);
end
trimerror = min(trimerrorl);
end

