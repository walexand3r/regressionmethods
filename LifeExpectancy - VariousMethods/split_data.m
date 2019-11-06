function [train_X, train_y, val_X, val_y] = split_data(trainval_X, trainval_y)
[n_trainval, d]=size(trainval_X);

n_train = floor(n_trainval * 0.8);

train_X = trainval_X(1:n_train,:);
train_y = trainval_y(1:n_train);
val_X = trainval_X(n_train+1:end,:);
val_y = trainval_y(n_train+1:end);
