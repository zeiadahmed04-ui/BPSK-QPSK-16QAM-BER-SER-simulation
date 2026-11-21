function symbols = bpsk_modulation(bits, Eb)
if any(bits ~= 0 & bits ~= 1)
    error('Input bits must contain only 0 and 1.');
end
if Eb <= 0
    error('Eb must be positive.');
end
symbols = (2 * bits - 1) * sqrt(Eb);
end
