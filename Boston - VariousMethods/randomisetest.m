a= [1 2 4 6; 5 8 6 3;4 7 9 1] ;
[m,n] = size(a) ;
idx = randperm(m) ;
%b = a ;
b(idx,:) = a(:,:)  % first row arranged randomly