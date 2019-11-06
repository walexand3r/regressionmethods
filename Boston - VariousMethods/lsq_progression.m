function w = lsq_progression(train_X,train_y);

%[train_X,train_y] = generate_train_data(n_train);
% A = X^TX  b = X^Ty

A = train_X.' * train_X;
b = train_X.' * train_y;
w = inv(A) * b;

%testing    
%[train_X * w  train_y]