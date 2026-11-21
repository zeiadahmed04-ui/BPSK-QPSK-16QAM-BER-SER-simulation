function detectedBits = bpsk_demodulation(equalizedSymbols)
detectedBits = real(equalizedSymbols) >= 0;
detectedBits = double(detectedBits);
end
