function w = lp_11_regression(train_X, train_y, lambda);

%warning('off','last')
%% Initialising variables

clear [f A b]
d = 10;
n = length(train_y);
A = zeros(2*d + 2*n, 2*d + n);
b = zeros(2*d + 2*n,1);

%% Constructing objective matrix f
f(1:d) = 0;
f(d+1:2*d) = lambda/2;
f(2*d+1 : (2*d + n)) = 1/n;


%% Using constraints to form A and b matrices

% v >= w 
for i = 1:d
    A(i,i) = 1;
    A(i,i+d) = -1;
    b(i) = 0;
end

% v >= -w
for i = 1:d
    A(i+d,i) = -1;
    A(i+d,i+d) = -1;
    b(i+d) = 0;
end

% xi(i) >= wx(i) - y(i)
for i = 1:n
    A(i+2*d,i+2*d) = -1;
    for j = 1:d
        A(i+2*d,j) = train_X(i,j);
    end
    b(i+2*d) = train_y(i);
end

% xi(i) >= y(i) - wx(i)
for i = 1:n
    A(i+2*d+n,i+2*d) = -1;
    for j = 1:d
        A(i+2*d+n,j) = -train_X(i,j);
    end
    b(i+2*d+n) = -train_y(i);
end

%% Using linprog function to minimise for w

x = linprog(f,A,b);

% We are only interested in w therefore:

w = x(1:d);
