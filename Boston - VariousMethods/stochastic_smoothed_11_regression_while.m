function w = stochastic_smoothed_11_regression(train_X,train_y,lambda)   

% Defining parameters
    tau = 0.1;
    d = 13;
    n = length(train_y);
    w(:,1) = zeros(d,1);
    t = 1;
    changeF = 1;
% n_trainval = 100;
% n_test = 20;
% lambda = 0.65;
% 
% [trainval_X,trainval_y] = generate_train_data(n_trainval);
% [train_X, train_y, val_X, val_y] = split_data(trainval_X, trainval_y);
% [test_X, test_y] = generate_test_data(n_test);  

% Iterates gradient descent until change in objective function less than
% specified value
while  abs(changeF) > 0.00001
    eta = 0.1/t;
    t = t + 1;
    k = randi([1 n]);
    for i = 1:d
            a = train_X(k,i)*(exp((2/tau)*(train_X(k,:)*w - ...
                train_y(k))) - 1)/(exp((2/tau)*(train_X(k,:)*w - ...
                train_y(k))) + 1);
            c = log(exp((1/tau)*(train_X(k,:)*w - ...
                train_y(k))) + exp(-((1/tau)*(train_X(k,:)*w - ...
                train_y(k)))));
            
                
        % each dfdw is made up from this sum below and a
        dfdw(i) = (lambda/2)*(exp(2*w(i)/tau) - 1)/(exp(2*w(i)/tau) + 1)...
                   + a;
        
        b = log(exp(w(i)/tau) + exp(-w(i)/tau));
        % Similarly objective function F is made up of B + C
        % (A, B and C) in handwritten notes
        w(i) = w(i) - eta*dfdw(i);
    end
    F(t) = (lambda*tau/2)*b + tau*c;

    changeF = F(t) - F(t-1);
end
     w;
    %plot(F)