function detectedBits = qam16_demodulation(equalizedSymbols, Eb)
if nargin < 2
    Eb = 1;
end
if Eb <= 0
    error('Eb must be positive.');
end
scale = sqrt(Eb / 2.5);
I = real(equalizedSymbols) / scale;
Q = imag(equalizedSymbols) / scale;
Ilevels = quantize_16qam_axis(I);
Qlevels = quantize_16qam_axis(Q);
Ibits = level_to_gray_pair(Ilevels);
Qbits = level_to_gray_pair(Qlevels);
bitMatrix = [Ibits, Qbits];
detectedBits = reshape(bitMatrix.', 1, []);
detectedBits = double(detectedBits);
end

function levels = quantize_16qam_axis(values)
levels = -3 * ones(size(values));
levels(values >= -2) = -1;
levels(values >= 0) = 1;
levels(values >= 2) = 3;
end

function bitPairs = level_to_gray_pair(levels)
bitPairs = zeros(length(levels), 2);
bitPairs(levels == -3, :) = repmat([0 0], sum(levels == -3), 1);
bitPairs(levels == -1, :) = repmat([0 1], sum(levels == -1), 1);
bitPairs(levels == 1, :) = repmat([1 1], sum(levels == 1), 1);
bitPairs(levels == 3, :) = repmat([1 0], sum(levels == 3), 1);
end
