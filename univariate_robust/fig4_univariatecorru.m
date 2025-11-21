%% this generates Fig 4 of the paper

etalist = 0.005:0.005:0.2;
n = 1000;
mu = 100;
ll = length(etalist);
repe = 100;
seed = 500;

err1blist = zeros(1,ll);
errtrimlist = zeros(1,ll);

for i=1:ll
    eta = etalist(i);
    [err1blist(i),errtrimlist(i)] = uni_corruption_repe(n,mu,eta,repe,seed);
end


figure; clf;

%  
plot(etalist, err1blist, '-o', 'LineWidth', 2, 'MarkerSize', 6); hold on;
plot(etalist, errtrimlist, '-s', 'LineWidth', 2, 'MarkerSize', 6);

%  
xlabel('Corruption level $\eta$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Error', 'Interpreter', 'latex', 'FontSize', 14);

%  
legend({'1-bit mean $\hat{\mu}$','trimmed mean $\bar{\mu}_{\rm trim}$'}, ...
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
ylim([0.0,0.6])