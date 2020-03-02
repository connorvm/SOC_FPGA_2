function [newton_fi] = newton_iteration(x_fi, y_fi, three_fi)
    %NEWTON_ITERATION
    % use the same steps from VHDL block for verification
    %#codegen
    % make the below into c
     square = y_fi * y_fi;
     xy_square = x_fi * square;
     minus = three_fi - xy_square;
     top = y_fi * minus;
     newton_fi = top /2;
end

