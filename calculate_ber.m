function ber = calculate_ber(transmittedBits, detectedBits)
transmittedBits = transmittedBits(:);
detectedBits = detectedBits(:);
if length(transmittedBits) ~= length(detectedBits)
    error('Transmitted and detected bit vectors must have the same length.');
end
if isempty(transmittedBits)
    error('Bit vectors cannot be empty.');
end
ber = sum(transmittedBits ~= detectedBits) / length(transmittedBits);
end
