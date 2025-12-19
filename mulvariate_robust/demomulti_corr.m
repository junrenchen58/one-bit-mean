%% This shows that the original 1-bit mean exhibits corruption level
%% term increasing with $d$
dlist = 10:10:100;
nlist = 100 * dlist; % therefore, d/n remains constant
l = length(dlist);
eta1 = 0.05; % therefore, this also keeps as a constant
eta2 = 0.1;
errlist = zeros(1,l);
errlist1 = zeros(1,l);
seed = 400;
repe = 100;
lambda = 2;
for i = 1:l
    errlist(i) = mul_corruption_repe(nlist(i),dlist(i),eta1,lambda,repe,seed);
    errlist1(i) = mul_corruption_repe(nlist(i),dlist(i),eta2,lambda,repe,seed) ;
end

figure; clf;

% Two curves: error vs dimension
plot(dlist, errlist, '-o', 'LineWidth', 2, 'MarkerSize', 6); hold on;
plot(dlist, errlist1, '-s', 'LineWidth', 2, 'MarkerSize', 6);

% Labels
xlabel('Dimension $d$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$\ell_2$ Error', 'Interpreter', 'latex', 'FontSize', 14);

% Legend
legend({'$\eta = 0.05$', '$\eta = 0.10$'}, ...
       'Interpreter', 'latex', ...
       'Location', 'northeast', ...
       'FontSize', 12, ...
       'Box', 'off');

% Axis formatting
set(gca, 'FontSize', 12, ...
         'Box', 'on', ...
         'LineWidth', 1, ...
         'XMinorTick', 'on', ...
         'YMinorTick', 'on');

% Window formatting
axis tight;
grid on; 