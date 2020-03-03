%% use for newton iteration
clear all
close all
clc

% files
vhdl_out = 'output_32_16.txt';
vhdl_in = 'input_32_16.txt';

% fixed point properties
width = 32; % full bit width
frac = 16; % fractional bit width
F = fimath('RoundingMethod','floor', 'CastBeforeSum', 0, 'OverflowAction', 'saturate');

% file handling
vhdl = readmatrix(vhdl_out,'OutputType','char'); % read in vhdl output
vhdl = bin2dec(vhdl); % convert to decimal value
vhdl_fi = fi(vhdl, 0, width, 0, F); % make fixed point
T = numerictype(0, width, frac);
vhdl_fi = reinterpretcast(vhdl_fi, T);% needed to convert it to the right W.f
vhdl_fi = vhdl_fi';

input = readmatrix(vhdl_in,'OutputType','char');
input = bin2dec(input); % convert to decimal value
input_fi = fi(input, 0, width, 0, F); % make fixed point
T = numerictype(0, width, frac);
input_fi = reinterpretcast(input_fi, T);% needed to convert it to the right W.f
input_fi = input_fi';

% to check every possible
% stop = 2^width -1;
% top = 2^(width-frac); % the top limit
% range = 0:top/(2^width):top*( 1 - 1/(2^width)); % every posiblilty
% x_fi = fi(range, 0, width, frac); % convert to fixed point
% compare = vhdl_fi(1: size(vhdl) - stop: size(vhdl)); % grab the right amount

% newton iteration block
x_fi = input_fi;
y_fi = fi(1, 0, width, frac, F); % y input
three_fi = fi(3, 0, width, frac, F); % in the fixed point
y_out = newton_iteration(x_fi, y_fi, three_fi); % do one iter of newtons
y_out_fi = fi(y_out, 0, width, frac); % resize


% verify block
[error_32_16] = verify(vhdl_fi, y_out_fi); 


%%
clear all
close all
clc

% files
vhdl_out = 'output_28_20.txt';
vhdl_in = 'input_28_20.txt';

% fixed point properties
width = 28; % full bit width
frac = 20; % fractional bit width
F = fimath('RoundingMethod','floor', 'CastBeforeSum', 0, 'OverflowAction', 'saturate');

% file handling
vhdl = readmatrix(vhdl_out,'OutputType','char'); % read in vhdl output
vhdl = bin2dec(vhdl); % convert to decimal value
vhdl_fi = fi(vhdl, 0, width, 0, F); % make fixed point
T = numerictype(0, width, frac);
vhdl_fi = reinterpretcast(vhdl_fi, T);% needed to convert it to the right W.f
vhdl_fi = vhdl_fi';

input = readmatrix(vhdl_in,'OutputType','char');
input = bin2dec(input); % convert to decimal value
input_fi = fi(input, 0, width, 0, F); % make fixed point
T = numerictype(0, width, frac);
input_fi = reinterpretcast(input_fi, T); % needed to convert it to the right W.f
input_fi = input_fi';

% newton iteration block
x_fi = input_fi;
y_fi = fi(1, 0, width, frac, F); % y input
three_fi = fi(3, 0, width, frac, F); % in the fixed point
y_out = newton_iteration(x_fi, y_fi, three_fi); % do one iter of newtons
y_out_fi = fi(y_out, 0, width, frac); % resize


% verify block
[error_28_20] = verify(vhdl_fi, y_out_fi); 