function plotSerAll(R, cfg)
figure('Visible','off'); hold on;
for i = 1:length(cfg.schemes)
    semilogy(cfg.snrDB, R(i).serRay, 'o-', 'Color', cfg.colors{i}, 'LineWidth', 1.5, 'DisplayName', cfg.schemes{i});
end
set(gca,'YScale','log'); grid on; ylim([1e-5 1]); legend('Location','southwest');
xlabel('E_b/N_0 (dB)'); ylabel('SER'); title('SER comparison over Rayleigh fading');
saveFig('ser_all_rayleigh', cfg); close;
end
