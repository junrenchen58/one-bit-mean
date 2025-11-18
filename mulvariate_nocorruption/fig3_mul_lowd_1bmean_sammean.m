%% This generates Figure 3 in the paper: Corruption-free, multivariate, low Trace

seed = 500;
nlist = 200*(1:1:5);
dlist = 20*(1:1:5);
len = length(nlist);
repe = 100;
errl = zeros(size(nlist));
errlgau = zeros(size(nlist));

for i = 1:len
    n = nlist(i);
    d = dlist(i);
    [Sigma,tr] = lowtracecovariance(d,1);
    mu = 100 * ones(d,1);
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
ylim([0.02,0.16])