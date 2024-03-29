function [train_X, train_y, val_X, val_y] = split_data(trainval_X, trainval_y)
[n, d]=size(trainval_X);

a = floor(n/4);            % how many people are in each grade section
b = floor(floor(n/4)*0.8); % 80 percent of this number will have to go 
                           % in train_, the rest in val_

train_X = [trainval_X((1:b),:) ; trainval_X((a+1:a+b),:); ...
          trainval_X((2*a+1:2*a+b),:);...
          trainval_X((3*a+1:3*a+floor((n-3*a)*0.8)),:)];
      
val_X = [trainval_X((b+1:a),:);trainval_X((a+b+1:2*a),:);...
        trainval_X((2*a+b+1:3*a),:);...
        trainval_X((3*a+floor((n-3*a)*0.8)+1:n),:)];

train_y = [trainval_y((1:b),1);trainval_y((a+1:a+b),1);...
          trainval_y((2*a+1:2*a+b),1);...
          trainval_y((3*a+1:3*a+floor((n-3*a)*0.8)),1)];
      
val_y = [trainval_y((b+1:a),1);trainval_y((a+b+1:2*a),1);...
        trainval_y((2*a+b+1:3*a),1);...
        trainval_y((3*a+floor((n-3*a)*0.8)+1:n),1)];
end
