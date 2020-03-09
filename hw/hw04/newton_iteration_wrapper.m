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
vhdl_fi = import_file(vhdl_out, width, frac, F);
input_fi = import_file(vhdl_in, width, frac, F);

% newton iteration block
x_fi = input_fi;
y_fi = fi(1, 0, width, frac, F); % y input
three_fi = fi(3, 0, width, frac, F); % in the fixed point
y_out = newton_iteration(x_fi, y_fi, three_fi); % do one iter of newtons
y_out_fi = fi(y_out, 0, width, frac, F); % resize


% verify block
[error_32_16] = verify(vhdl_fi, y_out_fi); 


%%
clc

% files
vhdl_out = 'output_28_20.txt';
vhdl_in = 'input_28_20.txt';

% fixed point properties
width = 28; % full bit width
frac = 20; % fractional bit width
F = fimath('RoundingMethod','floor');

% file handling
vhdl_fi = import_file(vhdl_out, width, frac, F);
input_fi = import_file(vhdl_in, width, frac, F);

% newton iteration block
x_fi = input_fi;
y_fi = fi(1, 0, width, frac, F); % y input
three_fi = fi(3, 0, width, frac, F); % in the fixed point
y_out = newton_iteration(x_fi, y_fi, three_fi); % do one iter of newtons
y_out_fi = fi(y_out, 0, width, frac, F); % resize


% verify block
[error_28_20] = verify(vhdl_fi, y_out_fi); 