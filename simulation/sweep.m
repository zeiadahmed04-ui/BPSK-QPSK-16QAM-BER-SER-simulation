function [ber, ser] = sweep(scheme, fading, cfg)
% g. repeat for every SNR value
rng(cfg.seed);
ber = zeros(size(cfg.snrDB));  ser = ber;
for i = 1:length(cfg.snrDB)
    [ber(i), ser(i)] = runOne(scheme, cfg.snrDB(i), fading, cfg);
end
end
