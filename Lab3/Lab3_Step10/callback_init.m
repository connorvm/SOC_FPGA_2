[input_wav_signal,Fs_in] = audioread('acoustic.wav');

%% Set Aduio Data Sample Rate
mp.Fs = 48000;   % sample rate of 48 kHz
mp.Ts = 1/mp.Fs; % sample period

%% Put signal into a timeseries format
timevals = [0:length(input_wav_signal)-1]*mp.Ts;
input_signal = timeseries(input_wav_signal,timevals);

%% Set the data type for audio signal (left and right channels) indata plane
mp.W_bits = 32;  % Word length
mp.F_bits = 28; % Number of fractional bits in word

%% Create test signals for the left and right channels
stop_time = length(input_wav_signal) * mp.Ts;

%% Set the echo delay
delay = 3;  % delay in seconds