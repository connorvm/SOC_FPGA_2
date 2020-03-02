% this file will do fixed point calculations to match our vhdl


%--------------------------------------------------------------------------
% Description:  Matlab script to create the lookup table used in creating
% the initial guess y0 to start Newtons Method for y = 1/sqrt(x);
%--------------------------------------------------------------------------
% Author:       Ross K. Snider
% Company:      Montana State University
% Create Date:  March 20, 2014
% Script Name:  rsqrt.m
% Tool Version: MATLAB: 8.2.0.701 (R2013b)
% Revision:     1.0
%--------------------------------------------------------------------------
% Copyright (c) 2013 Ross K. Snider.
% All rights reserved. Redistribution and use in source and binary forms 
% are permitted provided that the above copyright notice and this paragraph 
% are duplicated in all such forms and that any documentation, advertising 
% materials, and other materials related to such distribution and use 
% acknowledge that the software was developed by Montana State University 
% (MSU).  The name of MSU may not be used to endorse or promote products 
% derived from this software without specific prior written permission.
% THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
% IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
% WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. 
%--------------------------------------------------------------------------

clear all
close all
%-----------------------------------------------

%-----------------------------------------
% Create input and otput table for (x_beta)^(-3/2)
%-----------------------------------------
w_bits = 8; % word size
f_bits = 4; % fractional bits
Nwords = 2^w_bits;
x = 5;
y = 0.5;
tic
for i=0:10
    1 / sqrt(x)
    fy = newton_iteration(w_bits, f_bits, y, x)
end
toc

tic
for i=0:(Nwords-1)  % Need to compute each memory entry (i.e. memory size)
    x_beta_table{i+1}.address = newton_iteration(w_bits, f_bits, y, x);  % Memory Address
    fa = fi(i,0,w_bits,0);
    fa_bits = fa.bin;               % Memory Address in binary
    fb = fi(0, 0, w_bits+1, w_bits);  % Set number of bits for result
    fb.bin = ['1' fa_bits]; % set the value using the binary representation. The address is our input value 1 <= x_beta < 2  where the leading 1 has been added.
    x_beta_table{i+1}.input_value = double(fb);  % convert this binary input to it's double representation
    x_beta_table{i+1}.input_bits = fa.bin;  % keep track of the input bits

end
toc


%----------------------------------------------------
% Create the Altera .mif file for the lookup table
%----------------------------------------------------
fid = fopen('output_vectors.txt','w');

%------------------------------------
% Write Memory Data
%------------------------------------
tic
for data_index = 1:Nwords
    line = [x_beta_table{data_index}.input_bits];
    fprintf(fid,'%s\n',line);
end
toc
%------------------------------------
% Close File
%------------------------------------
fclose(fid);

%%
clear all
close all
clc

width = 128; % full bit width
frac = width - 2; % fractional bit width
y_fi = fi(1, 0, width, frac); % y input
three_fi = fi(3, 0, width, frac); % three in the fixed point
top = 2^(width-frac); % the top limit
range = 0:top/(width^2):top*(1 - 1/(width^2)); % every posiblilty
x_fi = fi(range, 0, width, frac); % convert to fixed point
x_fi.bin; % show the binary
y_out = newton_iteration(x_fi, y_fi, three_fi); % do one iter of newtons
y_out_fi = fi(y_out, 0, width, frac); % resize

%% for kicks and giggles
for i = 1:10
y_out = newton_iteration(y_out_fi, y_fi, three_fi);
y_out_fi = fi(y_out, 0, width, frac);
end



    