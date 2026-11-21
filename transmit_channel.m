function received = transmit_channel(symbols, channel, noise)
if length(symbols) ~= length(channel) || length(symbols) ~= length(noise)
    error('Symbols, channel, and noise must have the same length.');
end
received = channel .* symbols + noise;
end
