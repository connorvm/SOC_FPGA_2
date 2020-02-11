function [output] = newton_iteration(w_bits,f_bits, y, x)
%NEWTON_ITERATION_0 Summary of this function goes here
%   Detailed explanation goes here
    fy = fi(y, 1, w_bits, f_bits);
    fx = fi(x, 1, w_bits, f_bits);
    output = fy * (3 - fx * fy^2) / 2;
end