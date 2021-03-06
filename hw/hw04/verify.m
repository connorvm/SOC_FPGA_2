function [error] = verify(vhdl_out, matlab_out)
% verify Summary of this function goes here
%   computes a differance and outputs where and what it is 
results = matlab_out - vhdl_out; % difference
count = 0;
error = 0;
for i = 1:length(results)
    if results(1,i) ~= 0
        count = 1 + count;
        if count == 1
            error = zeros(1,4);
            error(count, 1) = vhdl_out(1,i);
            error(count, 2) = matlab_out(1,i);
            error(count, 3) = results(1,i);
            error(count, 4) = i;
        else
            error = [error; zeros(1,3)]; % add a row
            error(count, 1) = vhdl_out(1,i);
            error(count, 2) = matlab_out(1,i);
            error(count, 3) = results(1,i);
            error(count, 4) = i;
        end   

    end
end
end

