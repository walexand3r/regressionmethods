function w = svrg(train_X,train_y,lambda)   
% clear all
% n_trainval = 100;
% n_test = 20;
% lambda = 0.4;
% 
% [trainval_X,trainval_y] = generate_train_data(n_trainval);
% [train_X, train_y, val_X, val_y] = split_data(trainval_X, trainval_y);
% [test_X, test_y] = generate_test_data(n_test);  

% Defining parameters
    tau = 0.01;
    d = 20;
    n = length(train_y);
    wHat(:,1) = zeros(d,1);
    %t = 1;
    changeF = 1;
    m = 2*n;
    p = 5;  % Number of iterations
    eta = 0.001;
    
for s = 2:p
    for k = 1:d
        for i = 1:n
            a(i) = train_X(i,k)*(exp((2/tau)*(train_X(i,:)*wHat - ...
                train_y(i))) - 1)/(exp((2/tau)*(train_X(i,:)*wHat - ...
                train_y(i))) + 1);
        end
        A = sum(a);
        dfdw(k) = (lambda/2)*(exp(2*wHat(k)/tau) - 1)/(exp(2*wHat(k)/tau) + 1)...
                   + A/n;
    end
    gradF = sum(dfdw);
    mu = gradF/n;
    w = wHat;
    for t = 2:m
        k = randi([1 n]);
          for i = 1:d
            a = train_X(k,i)*(exp((2/tau)*(train_X(k,:)*w - ...
                train_y(k))) - 1)/(exp((2/tau)*(train_X(k,:)*w - ...
                train_y(k))) + 1);
           dfdww = (lambda/2)*(exp(2*w(i)/tau) - 1)/(exp(2*w(i)/tau) + 1)...
                   + a;
          %gradFw = sum(dfdw);
        
            b = train_X(k,i)*(exp((2/tau)*(train_X(k,:)*wHat - ...
                train_y(k))) - 1)/(exp((2/tau)*(train_X(k,:)*wHat - ...
                train_y(k))) + 1);
           dfdwwHat = (lambda/2)*(exp(2*wHat(i)/tau) - 1)/(exp(2*wHat(i)/tau) + 1)...
                   + b;
               
           w(i) = w(i) - eta*(dfdww - dfdwwHat + mu);
          end
          % gradFwHat = sum(dfdw);
                   
    end
    wHat = w;
         
end
   
w = wHat;



%     F(t) = (lambda*tau/2)*b + tau*c;
% 
%     changeF = F(t) - F(t-1);
% end
%      w;
%     %plot(F)