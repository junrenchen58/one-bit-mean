%% This generates Figure 2 in the paper: Corruption-free, multivariate, isotropic

seed = 500;
d = 30;
nlist = 30*(40:10:80);
len = length(nlist);
mu = 100*ones(d,1);
Sigma = eye(d);
repe = 100;
errl = zeros(size(nlist));
errlgau = zeros(size(nlist));
for i = 1:len
    n = nlist(i);
    [errl(i),errlgau(i)] = mul_nocorruption_repe(n,d,mu,Sigma,repe,seed);
end


figure; clf;

%  
plot(nlist, errl, '-o', 'LineWidth', 2, 'MarkerSize', 6); hold on;
plot(nlist, errlgau, '-s', 'LineWidth', 2, 'MarkerSize', 6);

%  
xlabel('Sample size $n$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$\ell_2$-Error', 'Interpreter', 'latex', 'FontSize', 14);

%  
legend({'1-bit mean $\hat{\mu}$','sample mean $\bar{\mu}$'}, ...
       'Interpreter', 'latex', ...
       'Location', 'northeast', ...
       'FontSize', 12, ...
       'Box', 'off');

%  
set(gca, 'FontSize', 12, ...
         'Box', 'on', ...
         'LineWidth', 1, ...
         'XMinorTick', 'on', ...
         'YMinorTick', 'on');

%  
axis tight;
grid on;
ylim([0.08,0.32])