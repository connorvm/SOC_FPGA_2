%% Set the fastsim flag
% Value Meaning
% 0     Full Simulation. Target (Fast) System Clock.Entire audio signal. Caution! You are likely to run out of memory and the simulation time will take forever
% 1     Developer's Mode*. Slow System Clock. Entire audio signal. Typical setting for development. Typical system clock is 2x or 4x of the audio signal sample rate.
% 2     Fast Developer's Mode. SLow System Clock. Truncated audio signal. This is to further reduce the simulation time. THe aduio signal is truncated, but can be longer than what is set for the HDL Coder Mode.
% 3     HDL Coder Mode*. Target (Fast) system Clock. Truncated audio signal. HSL Coder will run a simulation, which needs to be at the Target System Clock. The aduio signal needs to be truncated for a reasonable fast simulation time. The simulation is assumed to be correct at this point.
mp.fastsim_flag = 3;

%% Set Aduio Data Sample Rate
mp.Fs = 48000;   % sample rate frequency of AD1939 codec in Hz
mp.Ts = 1/mp.Fs; % sample period

%% Set the FPGA system clock frequency (frequency of the FPGA fabric)
% The system clock frequency should be an integer multiple of the Audio codec AD1939 Mclk frequency (12.288 MHz)
switch mp.fastsim_flag  % set system clock and audio length based on simulation mode
    case 0
        mp.Fs_system = 98304000;        % System clock frequency in Hz of Avalon Interface Mclk*8 = 12.288Mhz*8=98304000
        mp.Naudio_samples = -1;         % -1 = no truncation
    case 1
        mp.Fs_system = mp.Fs * 2;       % slow system clock
        mp.Naudio_samples = -1;         % -1 = no truncation
    case 2
        mp.Fs_system = mp.Fs * 2;       % slow system clock
        mp.Naudio_samples = mp.Fs;      % audio truncated to 1 second
    case 3
        mp.Fs_system = 98304000;        % System clock frequency in Hz of Avalon Interface Mclk*8 = 12.288Mhz*8=98304000
        mp.Naudio_samples = mp.Fs/10;   % audio truncated to 100 milliseconds
end
mp.Ts_system = 1/mp.Fs_system;          % System clock period

%% Set the data type for audio signal (left and right channels) indata plane
mp.W_bits = 32;  % Word length
mp.F_bits = 28; % Number of fractional bits in word

%% Create test signals for the left and right channels
mp = sm_init_test_signals(mp);  % create the test signals that will go through the model
stop_time = mp.test_signal.duration;

%% Put the test signals into the Avalon Streaming Bus format
% i.e put the test signals into the data_channel_valid protocal
mp = sm_init_avalon_signals(mp);  % create the avalon streaming signals

%% Create the control signals before the simulation starts
mp = sm_init_control_signals(mp);

%% Set the echo delay
delay = 3;  % delay in seconds


