function [newton_fi] = newton_iteration(x_fi, y_fi, three_fi)
    %NEWTON_ITERATION
    % use the same steps from VHDL block for verification
     square = y_fi * y_fi; % square y
     xy_square = x_fi .* square; % dot multiply (element wise)
     minus = three_fi - xy_square; % then subtract that from three
     top = y_fi * minus; % the top of the function
     newton_fi = (top /2); % shift to the right one
end

