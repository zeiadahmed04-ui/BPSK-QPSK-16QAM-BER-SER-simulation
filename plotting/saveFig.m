function saveFig(name, cfg)
if ~exist(cfg.resultsDir, 'dir'), mkdir(cfg.resultsDir); end
print(gcf, fullfile(cfg.resultsDir, [name '.png']), '-dpng', '-r130');
end
