function plotConstellations(cfg)
% Rows = schemes. Columns = transmitted | received | after channel inversion
rng(cfg.seed);
figure('Visible','off','Position',[100 100 1100 950]);
titles = {'Transmitted','Received (before eq.)','After channel inversion'};
for i = 1:length(cfg.schemes)
    s = cfg.schemes{i};  k = bitsPerSymbol(s);
    x = modulate(randi([0 1],1,3000*k), s);
    N0 = cfg.Eb / 10^(cfg.eyeSnrDB/10);
    [y,h] = transmit(x, N0, true);
    d = {x, y, equalize(y,h)};
    for j = 1:3
        subplot(3,3,(i-1)*3+j);
        plot(real(d{j}), imag(d{j}), '.', 'Color', cfg.colors{i}, 'MarkerSize', 4); grid on;
        title([s ' - ' titles{j}]); xlabel('I'); ylabel('Q');
        if j ~= 2, axis([-4 4 -4 4]); end
    end
end
saveFig('constellations', cfg); close;
end
