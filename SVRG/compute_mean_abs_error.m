function mae = compute_mean_abs_error(val_X,val_y,w)

mae = 1/length(val_y) * sum(abs((val_X * w - val_y)));