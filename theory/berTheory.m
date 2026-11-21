function ber = berTheory(scheme, snrDB, channel)
% Theoretical BER. channel = 'awgn' or 'rayleigh'
% Rayleigh BER = AWGN BER averaged over the exponential pdf of |h|^2.
ber = zeros(size(snrDB));
for i = 1:length(snrDB)
    g = 10^(snrDB(i)/10);
    if strcmp(channel, 'awgn')
        ber(i) = awgnBer(scheme, g);
    else
        f = @(x) awgnBer(scheme, x) .* exp(-x/g) / g;
        ber(i) = integral(f, 0, Inf);
    end
end
end

function p = awgnBer(scheme, g)
switch scheme
    case {'BPSK','QPSK'}
        p = 0.5 * erfc(sqrt(g));
    case '16QAM'          % Gray-coded approximation
        a = sqrt(0.4*g);
        p = 3/8*erfc(a) + 1/4*erfc(3*a) - 1/8*erfc(5*a);
end
end
