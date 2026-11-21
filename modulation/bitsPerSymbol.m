function k = bitsPerSymbol(scheme)
switch scheme
    case 'BPSK',  k = 1;
    case 'QPSK',  k = 2;
    case '16QAM', k = 4;
    otherwise, error('Unknown scheme');
end
end
