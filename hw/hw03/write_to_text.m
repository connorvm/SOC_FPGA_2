clear all
close all
clc

w_bits = 32;
f_bits = 16; 
test = rand(10000,1);
test_fi = (2^(w_bits - f_bits) - 1) .* test;
test_fi = fi(test_fi, 0, w_bits, f_bits);
test_bin = test_fi.bin;
test_cell = cellstr(test_bin);
fileID = fopen('input_32_16.txt','w');
fprintf(fileID,'%s \r \n', test_cell{:});
fclose(fileID);

w_bits = 28;
f_bits = 20; 
test = rand(10000,1);
test_fi = (2^(w_bits - f_bits) - 1) .* test;
test_fi = fi(test_fi, 0, w_bits, f_bits);
test_bin = test_fi.bin;
test_cell = cellstr(test_bin);
fileID = fopen('input_28_20.txt','w');
fprintf(fileID,'%s \r \n', test_cell{:});
fclose(fileID);