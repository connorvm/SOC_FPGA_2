function [data_fi] = import_file(file_in, width, frac, F)
% import_file Summary of this function goes here
%   imports a binary char array as a fi array
data_in = readmatrix(file_in,'OutputType','char'); % read in vhdl output
data_in = bin2dec(data_in); % convert to decimal value
data_fi = fi(data_in, 0, width, 0, F); % make fixed point
T = numerictype(0, width, frac);
data_fi = reinterpretcast(data_fi, T);% needed to convert it to the right W.f
data_fi = data_fi'; % transpose
end

