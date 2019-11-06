function w = smoothed_11_regression(train_X,train_y,lambda)   

% Defining parameters
    tau = 0.01;
    d = 10;
    n = length(train_y);
    w(:,1) = zeros(d,1);
    eta = 0.001;
    t = 1;
    changeF = 1;

% Iterates gradient descent until change in objective function less than
% specified value
while  abs(changeF) > 0.00001
    t = t + 1;
    for k = 1:d
        for i = 1:n
            a(i) = train_X(i,k)*(exp((2/tau)*(train_X(i,:)*w - ...
                train_y(i))) - 1)/(exp((2/tau)*(train_X(i,:)*w - ...
                train_y(i))) + 1);
            c(i) = log(exp((1/tau)*(train_X(i,:)*w - ...
                train_y(i))) + exp(-((1/tau)*(train_X(i,:)*w - ...
                train_y(i)))));
        end
        A = sum(a);
        C = (tau/n) * sum(c);
        
        % each dfdw is made up from this sum below and A
        dfdw(k) = (lambda/2)*(exp(2*w(k)/tau) - 1)/(exp(2*w(k)/tau) + 1)...
                   + A/n;
        
        b(k) = log(exp(w(k)/tau) + exp(-w(k)/tau));
        % Similarly objective function F is made up of B + C
        % (A, B and C define in handwritten notes)
        w(k) = w(k) - eta*dfdw(k);        
    end
    B = sum(b);
    F(t) = (lambda*tau/2)*B + C;
  
    changeF = F(t) - F(t-1);
end
     w ;
    % plot(F)