function h = rayleigh_channel(numSymbols)
if numSymbols <= 0 || floor(numSymbols) ~= numSymbols
    error('numSymbols must be a positive integer.');
end
hr = randn(1, numSymbols) / sqrt(2);
hi = randn(1, numSymbols) / sqrt(2);
h = hr + 1i * hi;
end
