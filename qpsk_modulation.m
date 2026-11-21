function symbols = qpsk_modulation(bits, Eb)
if any(bits ~= 0 & bits ~= 1)
    error('Input bits must contain only 0 and 1.');
end
if mod(length(bits), 2) ~= 0
    error('QPSK requires an even number of input bits.');
end
if Eb <= 0
    error('Eb must be positive.');
end

bitPairs = reshape(bits, 2, []).';
I = 2 * bitPairs(:, 1) - 1;
Q = 2 * bitPairs(:, 2) - 1;
symbols = (I + 1i * Q).' * sqrt(Eb / 2);
end
