% Using ridge regression and assessing runtime
runtime = zeros(1,100);
 
for p = 1:50
   tic
n_trainval = 100;
n_test = 20;

[trainval_X,trainval_y] = generate_train_data(n_trainval);
[train_X, train_y, val_X, val_y] = split_data(trainval_X, trainval_y);
[test_X, test_y] = generate_test_data(n_test);

% Estimating w from train data for multiple values of lambda
for i = 1:100
    lambda(i) = i/100;
    w = ridge_regression(train_X,train_y,lambda(i));
% Testing w on validation data
    mse(i) = compute_mean_squared_error(val_X,val_y,w);
    
end
plot(lambda,mse)
xlabel('lambda')
ylabel('Mean Squared Error')
% Finding value of lambda that minimises mean squared error
k = find(mse==min(mse));
optlambda = lambda(k)

% Reestimating w using full data set
w = ridge_regression(trainval_X,trainval_y,optlambda);

% Testing w on test data set
optmse = compute_mean_squared_error(test_X,test_y,w);

% This is more accurate than the least squares regression
runtime(p) = toc;

end


avRuntime = (1/50)*sum(runtime)