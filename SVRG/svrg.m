function w = svrg(train_X,train_y,lambda)   

% n_trainval = 100;
% n_test = 20;
% lambda = 0.4;
% 
% [trainval_X,trainval_y] = generate_train_data(n_trainval);
% [train_X, train_y, val_X, val_y] = split_data(trainval_X, trainval_y);
% [test_X, test_y] = generate_test_data(n_test);  

% Defining parameters
    tau = 0.1;
    d = 20;
    n = length(train_y);
    wHat(:,1) = zeros(d,1);
    t = 1;
    changeF = 1;
    m = 2*n;
    p = 5;  % Number of iterations
    eta = 0.001;
    
for s = 2:p
    for k = 1:d
        for i = 1:n
            a(i) = train_X(i,k)*(exp((2/tau)*(train_X(i,:)*wHat(:,s-1) - ...
                train_y(i))) - 1)/(exp((2/tau)*(train_X(i,:)*wHat(:,s-1)- ...
                train_y(i))) + 1);
        end
        A = sum(a);
        dfdw(k) = (lambda/2)*(exp(2*wHat(k,s-1)/tau) - 1)/(exp(2*wHat(k,s-1)/tau) + 1)...
                   + A/n;
    end
    gradF = sum(dfdw);
    mu = gradF/n;
    w(:,s-1) = wHat(:,s-1);
    for t = 2:m
        k = randi([1 n]);
          for i = 1:d
            a = train_X(k,i)*(exp((2/tau)*(train_X(k,:)*w(:,t-1) - ...
                train_y(k))) - 1)/(exp((2/tau)*(train_X(k,:)*w(:,t-1) - ...
                train_y(k))) + 1);
           dfdww(i) = (lambda/2)*(exp(2*w(i,t-1)/tau) - 1)/(exp(2*w(i,t-1)/tau) + 1)...
                   + a;
          %gradFw = sum(dfdw);
        
            b = train_X(k,i)*(exp((2/tau)*(train_X(k,:)*wHat(:,s-1) - ...
                train_y(k))) - 1)/(exp((2/tau)*(train_X(k,:)*wHat(:,s-1) - ...
                train_y(k))) + 1);
           dfdwwHat(i) = (lambda/2)*(exp(2*wHat(i,s-1)/tau) - 1)/(exp(2*w(i,s-1)/tau) + 1)...
                   + b;
               
               w(i,t) = w(i,t-1) - eta*(dfdww(i) - dfdwwHat(i) + mu);
          end
          %gradFwHat = sum(dfdw);
                   
    end
    wHat(:,s) = w(:,m);          
         
end
   
w = wHat(:,p);



%     F(t) = (lambda*tau/2)*b + tau*c;
% 
%     changeF = F(t) - F(t-1);
% end
%      w;
%     %plot(F)