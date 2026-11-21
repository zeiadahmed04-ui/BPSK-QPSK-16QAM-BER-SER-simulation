function symbols = qam16_modulation(bits, Eb)
if any(bits ~= 0 & bits ~= 1)
    error('Input bits must contain only 0 and 1.');
end
if mod(length(bits), 4) ~= 0
    error('16-QAM requires the number of input bits to be a multiple of 4.');
end
if Eb <= 0
    error('Eb must be positive.');
end

bitGroups = reshape(bits, 4, []).';
I = gray_pair_to_level(bitGroups(:, 1:2));
Q = gray_pair_to_level(bitGroups(:, 3:4));
scale = sqrt(Eb / 2.5);
symbols = ((I + 1i * Q) * scale).';
end

function levels = gray_pair_to_level(bitPairs)
levels = zeros(size(bitPairs, 1), 1);
levels(bitPairs(:,1) == 0 & bitPairs(:,2) == 0) = -3;
levels(bitPairs(:,1) == 0 & bitPairs(:,2) == 1) = -1;
levels(bitPairs(:,1) == 1 & bitPairs(:,2) == 1) = 1;
levels(bitPairs(:,1) == 1 & bitPairs(:,2) == 0) = 3;
end
