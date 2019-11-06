function w = stochastic_smoothed_11_regression_while(train_X,train_y,lambda)   

% Defining parameters
    tau = 1;
    d = 20;
    n = length(train_y);
    w(1:d,1) = 0;
    t = 1;
    changeF = 1;

% Iterates gradient descent until change in objective function less than
% specified value
while  abs(changeF) > 0.00001
    eta = 0.1/t;
    t = t + 1;
    k = randi([1 n]);
    for i = 1:d
            a = train_X(k,i)*(exp((2/tau)*(train_X(k,:)*w(:,t-1) - ...
                train_y(k))) - 1)/(exp((2/tau)*(train_X(k,:)*w(:,t-1) - ...
                train_y(k))) + 1);
            c = log(exp((1/tau)*(train_X(k,:)*w(:,t-1) - ...
                train_y(k))) + exp(-((1/tau)*(train_X(k,:)*w(:,t-1) - ...
                train_y(k)))));
            
                
        % each dfdw is made up from this sum below and a
        dfdw(i) = (lambda/2)*(exp(2*w(i,t-1)/tau) - 1)/(exp(2*w(i,t-1)/tau) + 1)...
                   + a;
        
        b = log(exp(w(i,t-1)/tau) + exp(-w(i,t-1)/tau));
        % Similarly objective function F is made up of B + C
        % (A, B and C) in handwritten notes
        w(i,t) = w(i,t-1) - eta*dfdw(i);
    end
    F(t) = (lambda*tau/2)*b + tau*c;

    changeF = F(t) - F(t-1);
end
    %surfc(w)
    w = w(:,t);
    %plot(F)