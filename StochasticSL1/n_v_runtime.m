%% Showing effect of n on average runtime of both stochastic and non-stochastic
%% smoothed l1 regression methods

% Results gathered from testing
Number_of_Training_Samples = [50 100 250 500 1000 5000].';
Stochastic_Runtime = [0.044 0.027 0.015 0.056 0.040 0.064].';
Smoothed_Runtime = [0.171 0.334 0.820 1.700 3.275 16.320 ].';

semilogx(n_trainval,stochastic,'g')
hold on
semilogx(n_trainval, smoothed,'r')

ylabel('Average Runtime')
xlabel('n - number of training samples')
legend('show')

% Runtime overall is overall much longer for smoothed gradient descent and 
% Increases exponentially with sample size
% Runtime does not show obvious trend but is one or two orders of magnitude
% smaller than that of non-stochastic

table(Number_of_Training_Samples,Smoothed_Runtime,Stochastic_Runtime)