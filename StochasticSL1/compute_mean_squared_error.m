function mse = compute_mean_squared_error(test_X,test_y,w)

mse = 1/length(test_y) * sum((test_X * w - test_y).^2);