n = 50;
mu = 18;
orix = randn(n,1)+mu;

n0 = ceil(sqrt(n));
epi = 1/sqrt(n);
Xf = orix(1:n0);
Xq = orix(n0+1:end);

alpha = quantile(Xf,epi);
beta = quantile(Xf,1-epi);

mu1 = (alpha+beta)/2;
Delta = (beta-alpha)/2;

tau = (rand(n-n0,1)-0.5) * 2 * Delta;
dotXq = sign(Xq - mu1 + tau);
hatmu = mean(Delta * dotXq) + mu1;

abs(hatmu - mu)