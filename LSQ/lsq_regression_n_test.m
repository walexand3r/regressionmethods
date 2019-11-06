%% Various tests on different parameters
%Testing effect of n_train on runtime 
% %A = X^TX  b = X^Ty
for k = 1:500
    n_train = k;
    [train_X,train_y] = generate_train_data(n_train);
    tic
    A = train_X.' * train_X;
    b = train_X.' * train_y;
    w = inv(A) * b;
    time(k) = toc;
end

plot(time(1:end))
xlabel('Number of training samples')
ylabel('Runtime')

% Longer runtime around n_train = 10 due to dimensionality but drops soon
% after
% Runtime increases with increasing n_train

% Varying dimensionality of dataset
for k = [1:200]
    d = 10*k;
    n_train = 100;
    [train_X,train_y] = generate_train_data(n_train,d);
    tic
    A = train_X.' * train_X;
    b = train_X.' * train_y;
    w = inv(A) * b;
    time(k) = toc;
end
plot(time)
xlabel('Dimensionality')
ylabel('Runtime')

%Varying d shows no correlation, seems to vary almost randomly, not what I
%expected

