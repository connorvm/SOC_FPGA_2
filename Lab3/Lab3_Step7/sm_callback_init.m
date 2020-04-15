%% Set Aduio Data Sample Rate
mp.Fs = 48000;   % sample rate frequency of AD1939 codec in Hz
mp.Ts = 1/mp.Fs; % sample period

%% Set the FPGA system clock frequency (frequency of the FPGA fabric)
% The system clock frequency should be an integer multiple of the Audio codec AD1939 Mclk frequency (12.288 MHz
mp.Fs_system = 98304000;        % System clock frequency in Hz of Avalon Interface Mclk*8 = 12.288Mhz*8=98304000
mp.Ts_system = 1/mp.Fs_system;  % System clock period

%% Set the data type for audio signal (left and right channels) indata plane
mp.W_bits = 32;  % Word length
mp.F_bits = 28; % Number of fractional bits in word

%% Creat test signals for the left and right channels
mp = sm_init_test_signals(mp);  % create the test signals that will go through the model

%% Put the test signals into the Avalon Streaming Bus format
mp = sm_init_avalon_signals(mp);  % creat the avalon streaming signals