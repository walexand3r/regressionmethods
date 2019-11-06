function w = ridge_regression(train_X,train_y,lambda)
    [n d] = size(train_X);
    A = (2*(train_X.' * (train_X)/n) + (lambda * eye(d)));
    b = (2*train_X.' * (train_y)/n);
    w = inv(A) * b;
