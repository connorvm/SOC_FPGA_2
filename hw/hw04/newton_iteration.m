function [newton_fi] = newton_iteration(x_in, y_in, width, frac)
    %NEWTON_ITEATIONR Summary of this function goes here
    % make the below into c
     x_fi = fi(x_in, 0, width, frac);
     y_fi = fi(y_in, 0, width, frac);
     three_fi = fi(3, 0, width, frac);
     square = y_fi * y_fi;
     xy_square = x_fi * square;
     minus = three_fi - xy_square;
     top = y_fi * minus;
     out = top /2;
     newton_fi = fi(out, 0, width, frac);
end

