function n = awgnNoise(len, N0)
% n = nc + j*ns, nc and ns ~ N(0, N0/2)
n = sqrt(N0/2) * (randn(1,len) + 1j*randn(1,len));
end
