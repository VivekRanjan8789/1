Fs = 1000;        % Sampling frequency in Hz
N = 1024;         % Number of samples
t = (0:N-1)/Fs;   % Time vector

% Generate Additive White Gaussian Noise (AWGN)
noise = randn(1, N);

% Plot Time-Domain Signal
figure;
plot(t, noise);
title('Additive White Gaussian Noise (Time Domain)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Compute and plot Power Spectral Density (PSD)
figure;
[psd, f] = pwelch(noise, [], [], [], Fs); % Welch's method for PSD estimation
plot(f, 10*log10(psd));
title('Power Spectral Density of AWGN');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
grid on;

% Compute and plot Autocorrelation in Frequency Domain
noise_fft = fft(noise);
auto_corr_freq = abs(noise_fft).^2;
figure;
plot(linspace(-Fs/2, Fs/2, N), fftshift(auto_corr_freq));
title('Autocorrelation in Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

