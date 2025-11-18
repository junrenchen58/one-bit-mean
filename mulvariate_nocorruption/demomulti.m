d = 30;
n = 30*d;
mu = 10 + randn(d,1);
Sigma = eye(d);
oriX = mvnrnd(mu,Sigma,n); % n * d matrix: rows are samples

n0 = ceil(2*sqrt(n));
epi = sqrt(2/n);
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
norm(mu-hatmu)

%% gauss error
fullest = mean(oriX);
fullest = fullest';
norm(mu - fullest)