%% Main script for testing simple least squares regression and evaluating 
% effect of number of training samples

clear all
for k = [50:5000]
    n_train = k;
    n_test = 20;
    d = 20;
    [train_X,train_y] = generate_train_data(n_train);
    [test_X,test_y] = generate_test_data(n_test);
    w = lsq_regression(train_X,train_y);
    
    mse(k) = compute_mean_squared_error(test_X,test_y,w);

end

plot(mse)
xlabel('Number of training samples')
ylabel('Mean Squared Error')

% Increasing n_train decreases mse, however around n_train = 10 
% there is a large spike due to dimensions of the matrix
% This is what I expect in theory as larger training sample means 
% more accurate w