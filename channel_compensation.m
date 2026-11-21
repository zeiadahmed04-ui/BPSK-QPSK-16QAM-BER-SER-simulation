function equalized = channel_compensation(received, channel)
if length(received) ~= length(channel)
    error('Received signal and channel must have the same length.');
end
if any(abs(channel) < eps)
    error('A channel coefficient is numerically zero; division is unsafe.');
end
equalized = received ./ channel;
end
