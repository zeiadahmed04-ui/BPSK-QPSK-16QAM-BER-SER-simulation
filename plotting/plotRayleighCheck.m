function plotRayleighCheck(cfg)
% check that the generated channel really is Rayleigh with uniform phase
rng(cfg.seed); h = rayleighChannel(2e5); x = linspace(0, 4, 300);
figure('Visible','off','Position',[100 100 900 380]);
subplot(1,2,1); histogram(abs(h), 100, 'Normalization','pdf'); hold on;
plot(x, 2*x.*exp(-x.^2), 'r', 'LineWidth', 1.5); title('|h| vs Rayleigh pdf'); legend('generated','theory');
subplot(1,2,2); histogram(angle(h), 60, 'Normalization','pdf'); hold on;
plot([-pi pi], [1 1]/(2*pi), 'r', 'LineWidth', 1.5); title('phase of h (uniform)');
saveFig('rayleigh_check', cfg); close;
end
