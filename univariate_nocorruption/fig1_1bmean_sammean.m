%% This generates Figure 1 in the paper: Corruption-free, univariate

seed = 500;
nlist = 100:100:500;
nlist = [50,nlist];
len = length(nlist);
mu = 100;
repe = 100;
errl = zeros(size(nlist));
errlgau = zeros(size(nlist));
for i=1:len
    n = nlist(i);
    [errl(i),errlgau(i),~] = uni_nocorruption_repe(n,mu,repe,seed);
end
 

figure; clf;

%  
plot(nlist, errl, '-o', 'LineWidth', 2, 'MarkerSize', 6); hold on;
plot(nlist, errlgau, '-s', 'LineWidth', 2, 'MarkerSize', 6);

%  
xlabel('Sample size $n$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Error', 'Interpreter', 'latex', 'FontSize', 14);

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
ylim([0.02,0.18])