%% Using ridge regression 
% and computing average lambda over 5 different splits of data
n_trainval = 100;
n_test = 20;
mse = zeros(1,500);

[trainval_X,trainval_y] = generate_train_data(n_trainval);
[train_X, train_y, val_X, val_y, trainSize, valSize] = split_opt(trainval_X, trainval_y);
[test_X, test_y] = generate_test_data(n_test);

% Estimating w from train data for multiple values of lambda
for j = 0:4;
    for i = 1:500
        lambda(i) = i/100;
        w = ridge_regression(train_X((trainSize*j)+1:trainSize*(j+1),:)...
            ,train_y((trainSize*j)+1:trainSize*(j+1)),lambda(i));
    % Testing w on validation data
        mse(i) = mse(i)+...
            compute_mean_squared_error(val_X((valSize*j)+1:valSize*(j+1),:)...
            ,val_y((valSize*j)+1:valSize*(j+1)),w);
    end
end
% Finding average mse for each lambda value
mse = mse/5;

% Finding optimum lambda
k = find(mse==min(mse));
optlambda = lambda(k)

plot(lambda,mse)

% Reestimating w using full data set
w = ridge_regression(trainval_X,trainval_y,optlambda);

% Testing w on test data set
optmse = compute_mean_squared_error(test_X,test_y,w)

% This is more accurate than the least squares regression