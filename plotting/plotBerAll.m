function plotBerAll(R, cfg)
% BER of all schemes on one plot.
% Simulation = markers only, Theory = solid thin line (so the two never hide each other).
% Different marker shapes/sizes keep BPSK and QPSK visible even though their curves coincide.
mk = {'o','s','^'};          % BPSK, QPSK, 16QAM
ms = [11 6 8];               % marker sizes (BPSK biggest so QPSK sits inside it)
figure('Visible','off'); hold on;
for i = 1:length(cfg.schemes)
    s = cfg.schemes{i};
    semilogy(cfg.snrDB, berTheory(s, cfg.snrDB, 'rayleigh'), '-', ...
        'Color', cfg.colors{i}, 'LineWidth', 1, 'DisplayName', [s ' theory']);
    semilogy(cfg.snrDB, R(i).berRay, mk{i}, 'Color', cfg.colors{i}, ...
        'MarkerSize', ms(i), 'LineWidth', 1.5, 'DisplayName', [s ' sim']);
end
set(gca,'YScale','log'); grid on; ylim([1e-5 1]); legend('Location','southwest');
xlabel('E_b/N_0 (dB)'); ylabel('BER'); title('BER comparison over Rayleigh fading');
saveFig('ber_all_rayleigh', cfg); close;
end
