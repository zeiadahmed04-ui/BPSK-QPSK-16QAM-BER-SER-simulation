function plotEyeDiagrams(cfg)
% Eye (I branch) with raised-cosine pulse: noiseless vs Rayleigh + channel inversion
rng(cfg.seed); sps = cfg.sps; nSym = 600; t = (0:2*sps-1)/sps;
figure('Visible','off','Position',[100 100 1000 950]);
for i = 1:length(cfg.schemes)
    s = cfg.schemes{i};
    x = modulate(randi([0 1],1,nSym*bitsPerSymbol(s)), s);
    N0 = cfg.Eb / 10^(cfg.eyeSnrDB/10);
    [y,h] = transmit(x, N0, true);
    d = {x, equalize(y,h)};
    names = {'noiseless', sprintf('Rayleigh + eq., Eb/N0 = %d dB', cfg.eyeSnrDB)};
    for j = 1:2
        w = shapePulse(real(d{j}), sps);
        w = w(3*sps+1 : end-3*sps);
        nTr = floor(length(w)/(2*sps));
        w = reshape(w(1:nTr*2*sps), 2*sps, nTr);      % each column = 2-symbol trace
        subplot(3,2,(i-1)*2+j);
        plot(t, w, 'Color', [cfg.colors{i} 0.25]); grid on;
        title([s ' eye (I) - ' names{j}]); xlabel('time (symbols)');
        if j == 2, ylim([-4 4]); end
    end
end
saveFig('eye_diagrams', cfg); close;
end

function w = shapePulse(sym, sps)
% upsample and filter with a raised-cosine pulse (roll-off 0.5, span 6 symbols)
beta = 0.5; span = 6;
tt = (-span*sps/2 : span*sps/2) / sps;
p  = mySinc(tt) .* cos(pi*beta*tt) ./ (1 - (2*beta*tt).^2);
sing = abs(abs(2*beta*tt) - 1) < 1e-8;
p(sing) = pi/4 * mySinc(1/(2*beta));
up = zeros(1, length(sym)*sps);  up(1:sps:end) = sym;
w  = conv(up, p, 'same');
end

function y = mySinc(x)     % own sinc, so no Signal Processing Toolbox is needed
y = ones(size(x));
nz = x ~= 0;
y(nz) = sin(pi*x(nz)) ./ (pi*x(nz));
end
