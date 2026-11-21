function cfg = config()
% ALL SETTINGS IN ONE PLACE - edit here, nothing else needs to change.
cfg.nBits      = 1e6;            % bits per SNR point (more = smoother, slower)
cfg.snrDB      = 0:2:30;         % Eb/N0 values in dB
cfg.Eb         = 1;              % energy per bit (normalised to 1)
cfg.schemes    = {'BPSK','QPSK','16QAM'};
cfg.colors     = {[0 0.45 0.74],[0.85 0.1 0.1],[0.1 0.6 0.2]};
cfg.seed       = 1;              % same seed -> same results every run
cfg.sps        = 8;              % samples per symbol (eye diagrams only)
cfg.eyeSnrDB   = 15;             % SNR for eye diagrams / noisy constellations
cfg.resultsDir = 'results';
end
