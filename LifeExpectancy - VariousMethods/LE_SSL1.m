%% %% Life expectancy dataset with Stochastic Smoothed L1 regression
clear all
runtime = zeros(1,50); 
for p = 1:50
    clearvars('-except','p','runtime')
   tic
[trainval_X,trainval_y,test_X,test_y] = generate_data;
[train_X,train_y,val_X,val_y] = split_data(trainval_X,trainval_y);

[n_trainval d] = size(trainval_X);
n_test = length(test_y);

%Testing values of lambda to give minimum mean absolute error
for i = 1:50
    lambda(i) = i/100;
    w = stochastic_smoothed_11_regression_while(train_X,train_y,lambda(i));
    % Testing w on validation data
    mae(i) = compute_mean_abs_error(val_X,val_y,w);
end
plot(lambda,mae)
hold on
% Optimum lambda is therefore:
l = find(mae == min(mae));
optlambda = lambda(l)

% %Previous section takes long time for my computer therefore optimal lambda
% %is printed here:
% optlambda = 0.04;

%Reestimating w using full data set
w = stochastic_smoothed_11_regression_while(trainval_X,trainval_y,optlambda);

% Testing w on test data set
optmae = compute_mean_abs_error(test_X,test_y,w)
%     
 
runtime(p) = toc
end
avRuntime = (1/50)*sum(runtime) 
