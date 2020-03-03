%% use for newton iteration
clear all
close all
clc
width = 16; % full bit width
frac = 8; % fractional bit width
stop = 2^width -1;
F = fimath('RoundingMethod','floor', 'CastBeforeSum', 0, 'OverflowAction', 'saturate');
vhdl = readmatrix('outputs_16.txt','OutputType','char'); % read in vhdl output
vhdl = bin2dec(vhdl); % convert to decimal value
vhdl_fi = fi(vhdl, 0, width, frac, F); % make fixed point
vhdl_fi = vhdl_fi';
y_fi = fi(1, 0, width, frac, F); % y input
three_fi = fi(3, 0, width, frac, F); % in the fixed point
top = 2^(width-frac); % the top limit
range = 0:top/(2^width):top*( 1 - 1/(2^width)); % every posiblilty
x_fi = fi(range, 0, width, frac); % convert to fixed point
y_out = newton_iteration(x_fi, y_fi, three_fi); % do one iter of newtons
y_out_fi = fi(y_out, 0, width, frac); % resize
compare = vhdl_fi(1: size(vhdl) - stop: size(vhdl));
results = y_out_fi - compare;
count = 0;
error = 0;
for i = 1:length(results)
    if results(1,i) ~= 0
        count = 1 + count;
        if count == 1
            error = zeros(1,3);
            error(count, 1) = vhdl_fi(1,i);
            error(count, 2) = y_out_fi(1,i);
            error(count, 3) =compare(1,i);
        else
            error = [error; zeros(1,3)];
            error(count, 1) = vhdl_fi(1,i);
            error(count, 2) = y_out_fi(1,i);
            error(count, 3) =compare(1,i);
        end   

    end
end