function w = lsq_regression(train_X,train_y);

% A = X^TX  b = X^Ty

A = train_X.' * train_X;
b = train_X.' * train_y;
w = inv(A) * b;

