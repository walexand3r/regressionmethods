function [trainval_X,trainval_y,test_X,test_y] = generate_data
% Forms training and test data sets from imput data
load('boston_data.mat');
full = [CRIM ZN INDUS CHAS NOX RM AGE DIS RAD TAX PTRATIO B LSTAT MEDV];

% Randomising data order to make train/var split more representative
[m,n] = size(full);
idx = randperm(m);
full_random(idx,:) = full(:,:);

% Normalising 
full_rn = normalize(full_random,'range');

% Forming test and train data sets
trainval_X = full_rn(1:306,1:n-1);
test_X = full_rn(307:end,1:n-1);

trainval_y = full_rn(1:306,n);
test_y = full_rn(307:end,n);

