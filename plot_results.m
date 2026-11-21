function plot_results(SNRdB, berBPSK, berQPSK, ber16QAM)
figure;
semilogy(SNRdB, berBPSK, 'o-', 'LineWidth', 1.5, 'MarkerSize', 7);
hold on;
semilogy(SNRdB, berQPSK, 's-', 'LineWidth', 1.5, 'MarkerSize', 7);
semilogy(SNRdB, ber16QAM, 'd-', 'LineWidth', 1.5, 'MarkerSize', 7);
grid on;
xlabel('E_b/N_0 (dB)');
ylabel('Bit Error Rate (BER)');
title('BER Performance over Rayleigh Flat Fading Channel');
legend('BPSK', 'QPSK', '16-QAM', 'Location', 'southwest');
xlim([min(SNRdB), max(SNRdB)]);
end
