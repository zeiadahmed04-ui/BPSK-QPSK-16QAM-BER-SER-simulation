function bits = generate_bits(numBits)
if numBits <= 0 || floor(numBits) ~= numBits
    error('numBits must be a positive integer.');
end
bits = randi([0 1], 1, numBits);
end
