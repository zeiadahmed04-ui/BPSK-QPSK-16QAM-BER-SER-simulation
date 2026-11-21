function detectedBits = qpsk_demodulation(equalizedSymbols)
Ibits = real(equalizedSymbols) >= 0;
Qbits = imag(equalizedSymbols) >= 0;
bitMatrix = [Ibits(:), Qbits(:)];
detectedBits = reshape(bitMatrix.', 1, []);
detectedBits = double(detectedBits);
end
