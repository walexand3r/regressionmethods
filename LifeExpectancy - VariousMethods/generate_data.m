function [trainval_X,trainval_y,test_X,test_y] = generate_data
% Forms training and test data sets from input data
load('data.mat');
full = [LEXP WTRA SANI CO2 CMORT EMPL INCM HDI GDP POP INTU];

% Randomising data order to make train/var split more representative
[m,n] = size(full);
idx = randperm(m);
full_random(idx,:) = full(:,:);

% Normalising 
full_rn = normalize(full_random,'range');

% Forming test and train data sets
trainval_X = full_rn(1:109,2:n);
test_X = full_rn(110:end,2:n);

trainval_y = full_rn(1:109,1);
test_y = full_rn(110:end,1);

