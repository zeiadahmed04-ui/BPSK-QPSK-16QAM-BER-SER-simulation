function plotAwgnVsRayleigh(R, cfg)
% AWGN (solid) vs Rayleigh (dashed). Each scheme has its own marker shape so that
% BPSK is still visible when it lies exactly under QPSK (identical BER per bit).
% Note: AWGN curves stop where errors = 0 (zero cannot be drawn on a log axis).
mk = {'o','s','^'};          % BPSK, QPSK, 16QAM
ms = [11 6 8];
figure('Visible','off'); hold on;
for i = 1:length(cfg.schemes)
    s = cfg.schemes{i};
    semilogy(cfg.snrDB, R(i).berAwgn, ['-' mk{i}], 'Color', cfg.colors{i}, ...
        'MarkerSize', ms(i), 'LineWidth', 1.2, 'DisplayName', [s ' AWGN']);
    semilogy(cfg.snrDB, R(i).berRay, ['--' mk{i}], 'Color', cfg.colors{i}, ...
        'MarkerSize', ms(i), 'LineWidth', 1.2, 'DisplayName', [s ' Rayleigh']);
end
set(gca,'YScale','log'); grid on; ylim([1e-5 1]); legend('Location','southwest','FontSize',8);
xlabel('E_b/N_0 (dB)'); ylabel('BER'); title('AWGN vs Rayleigh fading');
saveFig('awgn_vs_rayleigh', cfg); close;
end
