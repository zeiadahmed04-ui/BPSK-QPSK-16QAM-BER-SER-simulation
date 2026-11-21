function [y, h] = transmit(x, N0, fading)
% y = h*x + n.  fading=false -> h = 1 (plain AWGN)
if fading
    h = rayleighChannel(length(x));
else
    h = ones(1, length(x));
end
y = h .* x + awgnNoise(length(x), N0);
end
