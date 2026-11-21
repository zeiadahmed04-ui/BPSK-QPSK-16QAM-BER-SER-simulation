function [ber, ser] = runOne(scheme, snrDB, fading, cfg)
% One Monte-Carlo run = steps a to f of the project
k     = bitsPerSymbol(scheme);
nBits = cfg.nBits - mod(cfg.nBits, k);
bits  = randi([0 1], 1, nBits);                 % a. random bits
x     = modulate(bits, scheme);                 % b. symbols
N0    = cfg.Eb / 10^(snrDB/10);                 %    SNR = Eb/N0
[y,h] = transmit(x, N0, fading);                % c,d. channel + noise
r     = equalize(y, h);                         % e. channel inversion
bitsH = demodulate(r, scheme);                  %    hard decision
errs  = bits ~= bitsH;
ber   = mean(errs);                             % f. BER
ser   = mean(any(reshape(errs, k, []), 1));     %    SER (symbol wrong if any bit wrong)
end
