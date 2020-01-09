close all

%{
Bruno E. Gracia Villalobos
EE 4643
Final Project
Professor Zhang
%}

% -----------------------Setup filters and file paths----------------------%

%Store filepath of each signal
signal0Path = "df3_n0H.wav";
signal1Path = "df3_n1H.wav";
signal2Path = "df3_n2H.wav";

%Build custom filters for df3_n0H
FIR_BS0 = FIR_bandstop0();
IIR_BS0 = IIR_bandstop0();

%Build custom filters for df3_n1H
FIR_BS1 = FIR_bandstop1();
IIR_BS1 = IIR_bandstop1();

%Build custom filters for df3_n2H
FIR_BP2 = FIR_bandpass2();
IIR_BP2 = IIR_bandpass2();

% ------------------------------Filtering section ------------------------%

%{
    ----------------------Testing Instructions-----------------------------

    To change the signal and filter, change the arguments of
    filterPlotSignal:

            filterPlotSignal(signalPath, filterToUse)

    For testing df3_n0H:
    signalPath --> signal0Path
    filterToUse --> FIR_BS0 or IIR_BS0

    For testing df3_n1H:
    signalPath --> signal1Path
    filterToUse --> FIR_BS1 or IIR_BS1

    For testing df3_n2H:
    signalPath --> signal2Path
    filterToUse --> FIR_BP2 or IIR_BP2
%} 

%This three line code block filters and plays the specified signal in path
[signal, signalFiltered, signalFS] = filterPlotSignal(signal2Path, IIR_BP2);
playSignal(signal, signalFS);
playSignal(signalFiltered, signalFS);

%Write results to a WAV file!
%audiowrite(strcat(signal2Path, 'IIR.wav'), signalFiltered, signalFS);

%-----Filter generator functions exported from MATLAB filterDesigner-%
function Hd = FIR_bandstop0
%FIR_BS_EQUIRIPPLE_38 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.5 and DSP System Toolbox 9.7.
% Generated on: 11-Dec-2019 12:22:48

% Equiripple Bandstop filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 8000;  % Sampling Frequency

Fpass1 = 2000;            % First Passband Frequency
Fstop1 = 2500;            % First Stopband Frequency
Fstop2 = 3000;            % Second Stopband Frequency
Fpass2 = 3500;            % Second Passband Frequency
Dpass1 = 0.028774368332;  % First Passband Ripple
Dstop  = 0.001;           % Stopband Attenuation
Dpass2 = 0.057501127785;  % Second Passband Ripple
dens   = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass1 Fstop1 Fstop2 Fpass2]/(Fs/2), [1 0 ...
                          1], [Dpass1 Dstop Dpass2]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
end

function Hd = IIR_bandstop0
%IIR_26_BS_BUTTERWORTH Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.5 and DSP System Toolbox 9.7.
% Generated on: 11-Dec-2019 11:08:08

% Butterworth Bandstop filter designed using FDESIGN.BANDSTOP.

% All frequency values are in Hz.
Fs = 8000;  % Sampling Frequency

Fpass1 = 2000;        % First Passband Frequency
Fstop1 = 2500;        % First Stopband Frequency
Fstop2 = 3000;        % Second Stopband Frequency
Fpass2 = 3500;        % Second Passband Frequency
Apass1 = 1;           % First Passband Ripple (dB)
Astop  = 80;          % Stopband Attenuation (dB)
Apass2 = 1;           % Second Passband Ripple (dB)
match  = 'passband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandstop(Fpass1, Fstop1, Fstop2, Fpass2, Apass1, Astop, ...
                      Apass2, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);

% [EOF]
end

function Hd = FIR_bandstop1
%FIR_BS_BUTTERWORTH_440_N1H Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.5 and DSP System Toolbox 9.7.
% Generated on: 11-Dec-2019 14:17:24

% Equiripple Bandstop filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 8000;  % Sampling Frequency

Fpass1 = 150;             % First Passband Frequency
Fstop1 = 200;             % First Stopband Frequency
Fstop2 = 600;             % Second Stopband Frequency
Fpass2 = 650;             % Second Passband Frequency
Dpass1 = 0.057501127785;  % First Passband Ripple
Dstop  = 0.0001;          % Stopband Attenuation
Dpass2 = 0.057501127785;  % Second Passband Ripple
dens   = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass1 Fstop1 Fstop2 Fpass2]/(Fs/2), [1 0 ...
                          1], [Dpass1 Dstop Dpass2]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
end

function Hd = IIR_bandstop1
%IIR_BS_BUTTERWORTH_144_N1H Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.5 and DSP System Toolbox 9.7.
% Generated on: 11-Dec-2019 14:28:59

% Butterworth Bandstop filter designed using FDESIGN.BANDSTOP.

% All frequency values are in Hz.
Fs = 8000;  % Sampling Frequency

Fpass1 = 150;         % First Passband Frequency
Fstop1 = 200;         % First Stopband Frequency
Fstop2 = 600;         % Second Stopband Frequency
Fpass2 = 650;         % Second Passband Frequency
Apass1 = 1;           % First Passband Ripple (dB)
Astop  = 80;          % Stopband Attenuation (dB)
Apass2 = 1;           % Second Passband Ripple (dB)
match  = 'passband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandstop(Fpass1, Fstop1, Fstop2, Fpass2, Apass1, Astop, ...
                      Apass2, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);

% [EOF]
end

function Hd = FIR_bandpass2
%FIR_BP_EQUIRIPPLE_101_N2H Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.5 and DSP System Toolbox 9.7.
% Generated on: 11-Dec-2019 14:53:41

% Equiripple Bandpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 8000;  % Sampling Frequency

Fstop1 = 200;             % First Stopband Frequency
Fpass1 = 400;             % First Passband Frequency
Fpass2 = 2500;            % Second Passband Frequency
Fstop2 = 2700;            % Second Stopband Frequency
Dstop1 = 0.0001;          % First Stopband Attenuation
Dpass  = 0.057501127785;  % Passband Ripple
Dstop2 = 0.0001;          % Second Stopband Attenuation
dens   = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
                          0], [Dstop1 Dpass Dstop2]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
end

function Hd = IIR_bandpass2
%IIR_BP_BUTTERWORTH_26_N2H Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.5 and DSP System Toolbox 9.7.
% Generated on: 11-Dec-2019 14:55:28

% Butterworth Bandpass filter designed using FDESIGN.BANDPASS.

% All frequency values are in Hz.
Fs = 8000;  % Sampling Frequency

Fstop1 = 200;         % First Stopband Frequency
Fpass1 = 400;         % First Passband Frequency
Fpass2 = 2500;        % Second Passband Frequency
Fstop2 = 4000;        % Second Stopband Frequency
Astop1 = 80;          % First Stopband Attenuation (dB)
Apass  = 1;           % Passband Ripple (dB)
Astop2 = 80;          % Second Stopband Attenuation (dB)
match  = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass(Fstop1, Fpass1, Fpass2, Fstop2, Astop1, Apass, ...
                      Astop2, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);

% [EOF]
end

%------------------------Custom functions------------------------------%
function [signal, signalFiltered, fs] = filterPlotSignal(filePath, filterObject)
%Let's read in the samples of the WAV and store sample rates
[signal, fs] = audioread(filePath);

%Find the FFT of the signals 
signalFFT = fft(signal);

%Plot the signals' frequency spectrums
plotFreqSignal(signalFFT, fs, 1, filePath, 'g');

%Filter the signal
signalFiltered = filter(filterObject, signal);

%Plot filtered signal frequency spectrum
signalFilteredFFT = fft(signalFiltered);
plotFreqSignal(signalFilteredFFT, fs, 1, strcat(filePath, ' filtered'), 'b');
end

function playSignal(signal, fs)
    %Play the original signal
    signalPlayer = audioplayer(signal, fs);
    playblocking(signalPlayer); 
end

function plotFreqSignal(signal, fs, type, name, color)
    half = floor(length(signal)/2);
    
    %type ==1 means the signal is a pure FFT output
    if(type ==1)

        %remove data above nyquist limit = fs/2
        %freqAxis = linspace(0, fs/2, length(signal)/2);
        freqResolution = fs/length(signal);
        freqAxis = 0 : freqResolution : fs/2-freqResolution; %cut away nyquist limit

        %disp(half);
        figure;
        grid on;
        
        subplot(2,1,1);
        %plot(freqAxis, abs(signal(1:half))/ length(signal), 'b'); %plot mag and normalized
        plot(freqAxis, abs(signal(1:half)), color);
        %cut away nyquist limit @ end/2 + 1    

        
        legend(name,'location','northoutside')
        
        titleGraph = strcat('Frequency Response in Magnitude','');
        title(titleGraph);
        
        xlabel('Frequency (Hz)');
        ylabel('Magnitude');
        
        subplot(2,1,2);
        plot(freqAxis, 10*log10(abs(signal(1:half))), color);
        
        titleGraph = strcat('Frequency Response in dB','');
        title(titleGraph);
        
        xlabel('Frequency (Hz)');
        ylabel('dB');           
        
    elseif(type == 0) %means signal is from DC to NYQUIST
        figure;

        plot(linspace(0, (fs/2), length(signal)), 20*log10(signal));
        
        title('Mel Spectrum'), xlabel('Frequency (Hz)');
    end
end