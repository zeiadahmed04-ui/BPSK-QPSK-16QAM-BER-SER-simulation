function plotBerEach(R, cfg)
% BER of every scheme: simulation (markers) vs theory (line)
for i = 1:length(cfg.schemes)
    s = cfg.schemes{i};
    figure('Visible','off');
    semilogy(cfg.snrDB, R(i).berRay, 'o', 'Color', cfg.colors{i}, 'LineWidth', 1.5); hold on;
    semilogy(cfg.snrDB, berTheory(s, cfg.snrDB, 'rayleigh'), '-', 'Color', cfg.colors{i}, 'LineWidth', 1.5);
    grid on; ylim([1e-5 1]); xlabel('E_b/N_0 (dB)'); ylabel('BER');
    title([s ' BER over Rayleigh flat fading']); legend('Simulation','Theory');
    saveFig(['ber_' s '_rayleigh'], cfg); close;
end
end
