DIGITAL COMMUNICATIONS - PROJECT PART 2
BER of BPSK, QPSK and 16-QAM over a Rayleigh flat-fading channel

FILES
-----
main.m                    Runs the complete simulation.
generate_bits.m           Generates random binary data.
bpsk_modulation.m          Maps bits to BPSK symbols.
qpsk_modulation.m          Maps bit pairs to the PDF's QPSK constellation.
qam16_modulation.m         Maps groups of four bits to the PDF's 16-QAM constellation.
rayleigh_channel.m        Generates complex Rayleigh fading coefficients.
awgn_generator.m          Generates complex AWGN.
transmit_channel.m        Applies y = h*x + n.
channel_compensation.m    Performs perfect-CSI zero-forcing equalization y/h.
bpsk_demodulation.m        Detects BPSK bits.
qpsk_demodulation.m        Detects QPSK bit pairs.
qam16_demodulation.m       Detects 16-QAM bit groups.
calculate_ber.m           Calculates bit error rate.
plot_results.m             Plots the three BER curves.

HOW TO RUN
----------
1. Extract the project ZIP file.
2. Open MATLAB.
3. Set the Current Folder to the extracted Project_Part_2_MATLAB folder.
4. Run main.m.
5. The command window prints BER values for every SNR.
6. The BER plot appears, and results are saved as BER_results.csv and BER_results.mat.

SIMULATION SETTINGS IN main.m
-----------------------------
numBits = 200000;   Number of transmitted bits for each modulation scheme.
Eb = 1;             Average energy per bit is normalized to one.
SNRdB = 0:2:20;     Simulated Eb/N0 values in dB.

MODEL AND NORMALIZATION
-----------------------
The channel is h = hr + j*hi, where hr and hi are independent Gaussian
random variables with mean zero and variance 1/2. Thus E{|h|^2} = 1 and
the channel magnitude has a Rayleigh distribution.

The complex noise is n = nc + j*ns. Each component has variance N0/2,
where N0 = Eb / 10^(SNRdB/10).

The transmitted signal is y = h*x + n. The receiver is assumed to know h
perfectly and uses equalization x_est = y/h, as required by the assignment.

All three constellations are normalized to average Eb = 1 for a fair
comparison at the same Eb/N0:
- BPSK: +sqrt(Eb) for bit 1 and -sqrt(Eb) for bit 0.
- QPSK: the PDF's mapping, with coordinates +/-sqrt(Eb/2) on I and Q.
- 16-QAM: the PDF's Gray mapping on each axis, levels -3,-1,+1,+3,
  scaled by sqrt(Eb/2.5). The unscaled average symbol energy is 10,
  and there are four bits per symbol, so average Eb is 10/4 = 2.5.

CONSTELLATION BIT MAPPING FROM THE PDF
--------------------------------------
QPSK:
00 -> (-I,-Q), 01 -> (-I,+Q), 11 -> (+I,+Q), 10 -> (+I,-Q).

16-QAM:
The first pair b0b1 selects I and the second pair b2b3 selects Q.
For either axis: 00 -> -3, 01 -> -1, 11 -> +1, 10 -> +3.

IMPORTANT NOTES
---------------
- The channel coefficient is independently generated for every symbol,
  matching the symbol-by-symbol channel vector in the assignment.
- QPSK and 16-QAM bit counts must be divisible by 2 and 4 respectively.
  main.m uses a bit count divisible by 4. The same original bit stream
  for each modulation is reused across SNR points for consistent comparisons.
- At high SNR, a finite simulation can occasionally produce zero observed
  errors. A zero measured BER means no errors occurred in this finite run;
  it does not mean the theoretical BER is exactly zero.
- The code uses basic MATLAB functions and does not require the
  Communications Toolbox.
- If your MATLAB release does not support the table function, remove the
  table display and writetable lines in main.m; the plot and MAT-file save
  will still work.
