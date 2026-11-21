% RUN THIS FILE.  All figures are saved in the results/ folder.
clear; clc; close all;
addpath(genpath(fileparts(mfilename('fullpath'))));   % make sub-folders visible
cfg = config();

for i = 1:length(cfg.schemes)
    s = cfg.schemes{i};
    fprintf('Simulating %s ...\n', s);
    [R(i).berRay,  R(i).serRay ] = sweep(s, true,  cfg);   % Rayleigh fading
    [R(i).berAwgn, R(i).serAwgn] = sweep(s, false, cfg);   % AWGN only (for comparison)
end

plotBerEach(R, cfg);
plotBerAll(R, cfg);
plotSerAll(R, cfg);
plotAwgnVsRayleigh(R, cfg);
plotRayleighCheck(cfg);
plotConstellations(cfg);
plotEyeDiagrams(cfg);
disp('Done. See the results/ folder.');
