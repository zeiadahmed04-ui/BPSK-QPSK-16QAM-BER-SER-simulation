function h = rayleighChannel(n)
% h = hr + j*hi, hr and hi ~ N(0, 1/2)  ->  |h| is Rayleigh, E|h|^2 = 1
h = sqrt(0.5) * (randn(1,n) + 1j*randn(1,n));
end
