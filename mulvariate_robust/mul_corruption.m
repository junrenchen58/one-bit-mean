function error = mul_corruption(n,d,eta,lambda)
% this function simulates multivariate case with corruption
% we consider gaussian vectors
% eta is the corruption level
% this function simulates multivariate case with corruption
% we consider *zero-mean* isotropic gaussian vector; 
% and consider full quantization 
% lambda is the tuning parameter of the dithering scale
orix = randn(n,d); 
numcorr = floor(eta*n);
indx = randperm(n,numcorr); %% randomly pick indices to corrupt
orix(indx,:) = 1+orix(indx,:); %% we shift the sample 

tau = (rand(n,d)-0.5) * 2 * lambda;
dotXq = sign(orix + tau);
hatmu = mean(lambda * dotXq);
error = norm(hatmu'); % recall that we use mu = 0
end



