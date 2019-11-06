%% Effect of varying variance of dataset

n_train = 100;
for i = 1:100
    n_test = 20;
    sigma = i/100;
    [train_X,train_y] = generate_train_data(n_train,sigma);
    [test_X,test_y] = generate_test_data(n_test);
    w = lsq_regression(train_X,train_y);
    
    mse(i) = compute_mean_squared_error(test_X,test_y,w);
    
end

plot(mse)
xlabel('S.D. of training data')
legend('Mean Squared Error')

% Increasing variance of training data decreases mse on test data set with
% standard variance (0.2) The reverse happens when variance of test data
% set is used, with error increasing when variance increases and standard
% variance training data is used