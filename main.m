clear;
clc;
close all;

rng(42, 'twister');

numBits = 200000;
Eb = 1;
SNRdB = 0:2:20;

if mod(numBits, 4) ~= 0
    error('numBits must be a multiple of 4 for QPSK and 16-QAM.');
end

berBPSK = zeros(size(SNRdB));
berQPSK = zeros(size(SNRdB));
ber16QAM = zeros(size(SNRdB));

bitsBPSK = generate_bits(numBits);
bitsQPSK = generate_bits(numBits);
bits16QAM = generate_bits(numBits);

fprintf('Starting BER simulation...\n');

for snrIndex = 1:length(SNRdB)
    currentSNRdB = SNRdB(snrIndex);
    gammaB = 10^(currentSNRdB / 10);
    N0 = Eb / gammaB;

    symbolsBPSK = bpsk_modulation(bitsBPSK, Eb);
    channelBPSK = rayleigh_channel(length(symbolsBPSK));
    noiseBPSK = awgn_generator(length(symbolsBPSK), N0);
    receivedBPSK = transmit_channel(symbolsBPSK, channelBPSK, noiseBPSK);
    equalizedBPSK = channel_compensation(receivedBPSK, channelBPSK);
    detectedBPSK = bpsk_demodulation(equalizedBPSK);
    berBPSK(snrIndex) = calculate_ber(bitsBPSK, detectedBPSK);

    symbolsQPSK = qpsk_modulation(bitsQPSK, Eb);
    channelQPSK = rayleigh_channel(length(symbolsQPSK));
    noiseQPSK = awgn_generator(length(symbolsQPSK), N0);
    receivedQPSK = transmit_channel(symbolsQPSK, channelQPSK, noiseQPSK);
    equalizedQPSK = channel_compensation(receivedQPSK, channelQPSK);
    detectedQPSK = qpsk_demodulation(equalizedQPSK);
    berQPSK(snrIndex) = calculate_ber(bitsQPSK, detectedQPSK);

    symbols16QAM = qam16_modulation(bits16QAM, Eb);
    channel16QAM = rayleigh_channel(length(symbols16QAM));
    noise16QAM = awgn_generator(length(symbols16QAM), N0);
    received16QAM = transmit_channel(symbols16QAM, channel16QAM, noise16QAM);
    equalized16QAM = channel_compensation(received16QAM, channel16QAM);
    detected16QAM = qam16_demodulation(equalized16QAM, Eb);
    ber16QAM(snrIndex) = calculate_ber(bits16QAM, detected16QAM);

    fprintf('SNR = %2d dB | BPSK: %.6g | QPSK: %.6g | 16-QAM: %.6g\n', ...
        currentSNRdB, berBPSK(snrIndex), berQPSK(snrIndex), ber16QAM(snrIndex));
end

plot_results(SNRdB, berBPSK, berQPSK, ber16QAM);

results = table(SNRdB(:), berBPSK(:), berQPSK(:), ber16QAM(:), ...
    'VariableNames', {'SNR_dB', 'BER_BPSK', 'BER_QPSK', 'BER_16QAM'});
disp(results);
writetable(results, 'BER_results.csv');
save('BER_results.mat', 'SNRdB', 'berBPSK', 'berQPSK', 'ber16QAM', 'numBits', 'Eb');

fprintf('Simulation finished. Results saved to BER_results.csv and BER_results.mat.\n');
