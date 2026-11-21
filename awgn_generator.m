function noise = awgn_generator(numSymbols, N0)
if numSymbols <= 0 || floor(numSymbols) ~= numSymbols
    error('numSymbols must be a positive integer.');
end
if N0 < 0
    error('N0 cannot be negative.');
end
noise = sqrt(N0 / 2) * (randn(1, numSymbols) + 1i * randn(1, numSymbols));
end
