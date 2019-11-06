%% Testing Ridge regression on Boston Housing Data
clear all
runtime = zeros(1,50); 
for p = 1:50
   tic
% Load and generate training and test data sets
%clear all
[trainval_X,trainval_y,test_X,test_y] = generate_data;
[train_X,train_y,val_X,val_y] = split_data(trainval_X,trainval_y);

[n_trainval d] = size(trainval_X);
n_test = length(test_y);

% Estimating w from train data for multiple values of lambda
for i = 1:50
    lambda(i) = i/100;
    w = ridge_regression(train_X,train_y,lambda(i));
% Testing w on validation data
    mse(i) = compute_mean_squared_error(val_X,val_y,w);
   
end
plot(lambda,mse)

% Finding value of lambda that minimises mean squared error
k = find(mse==min(mse));
optlambda = lambda(k)

% Reestimating w using full data set
w = ridge_regression(trainval_X,trainval_y,optlambda);

% Testing w on test data set
optmse = compute_mean_squared_error(test_X,test_y,w)
runtime(p) = optmse;
end
avRuntime = (1/50)*sum(runtime)

% This is more accurate than the least squares regression