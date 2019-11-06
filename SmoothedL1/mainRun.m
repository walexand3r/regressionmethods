%% Using smoothed l1 regression

% runtime = zeros(1,100);
%  
% for p = 1:50
%    tic
% %clear all
n_trainval = 100;
n_test = 20;
% lambda = 0.65;

[trainval_X,trainval_y] = generate_train_data(n_trainval);
[train_X, train_y, val_X, val_y] = split_data(trainval_X, trainval_y);
[test_X, test_y] = generate_test_data(n_test);

% Testing values of lambda to give minimum mean absolute error
for i = 1:100
    lambda(i) = i/100;
    w = smoothed_11_regression_while(train_X,train_y,lambda(i));
% Testing w on validation data
    mae(i) = compute_mean_abs_error(val_X,val_y,w);
    
end
plot(lambda,mae)
xlabel('Lamda')
ylabel('mae')
% Optimum lambda is therefore:
l = find(mae == min(mae));
optlambda = lambda(l);

% Previous section takes long time for my computer therefore optimal lambda
% is printed here:
% optlambda = 0.03;

% Reestimating w using full data set
w = smoothed_11_regression_while(trainval_X,trainval_y,optlambda);

% Testing w on test data set
optmae = compute_mean_abs_error(test_X,test_y,w);
% runtime(p) = toc;
% 
% end
% 
% 
% avRuntime = (1/50)*sum(runtime)
