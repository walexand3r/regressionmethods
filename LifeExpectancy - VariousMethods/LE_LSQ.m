%% Life expectancy dataset with least squares regression
clear all
runtime = zeros(1,50); 
for p = 1:50
   clearvars('-except','p','runtime')
tic
[trainval_X,trainval_y,test_X,test_y] = generate_data;
[train_X,train_y,val_X,val_y] = split_data(trainval_X,trainval_y);

[n_trainval d] = size(trainval_X);
n_test = length(test_y);

w = lsq_progression(train_X,train_y);
    
mse = compute_mean_squared_error(test_X,test_y,w)
   

runtime(p) = toc
end
avRuntime = (1/50)*sum(runtime)