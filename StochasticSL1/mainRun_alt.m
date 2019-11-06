%% Stochastic smoothed l1 regression
% Evaluating effect of lambda
runtime = zeros(1,50);
 
for p = 1:50
   tic
%clear all
n_trainval = 100;
n_test = 20;
mae = zeros(1,50);

[trainval_X,trainval_y] = generate_train_data(n_trainval);
[train_X, train_y, val_X, val_y, trainSize, valSize] = split_opt(trainval_X, trainval_y);
[test_X, test_y] = generate_test_data(n_test);

% Estimating w from train data for multiple values of lambda
for j = 0:4;

    for i = 1:50
        lambda(i) = i/10;
        w = stochastic_smoothed_11_regression_while...
            (train_X((trainSize*j)+1:trainSize*(j+1),:)...
            ,train_y((trainSize*j)+1:trainSize*(j+1)),lambda(i));
    % Testing w on validation data
        mae(i) = mae(i)+...
            compute_mean_abs_error(val_X((valSize*j)+1:valSize*(j+1),:)...
            ,val_y((valSize*j)+1:valSize*(j+1)),w);
    end
end
% Finding average mse for each lambda value
mae = mae/5;

% Finding optimum lambda
k = find(mae==min(mae));
optlambda = lambda(k)

plot(lambda,mae)

% %Previous section takes long time for my computer therefore optimal lambda
% %is printed here:
% optlambda = 0.04;

%Reestimating w using full data set
w = stochastic_smoothed_11_regression_while(trainval_X,trainval_y,optlambda);

% Testing w on test data set
optmae = compute_mean_abs_error(test_X,test_y,w)
%     
runtime(p) = toc;

end


avRuntime = (1/50)*sum(runtime)
%  
