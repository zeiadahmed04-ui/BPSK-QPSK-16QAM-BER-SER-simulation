function s = modulate(bits, scheme)
% bits (row vector of 0/1) -> complex symbols, scaled so that Eb = 1.
% QPSK : b0 on I, b1 on Q, bit 0 -> -1, bit 1 -> +1
% 16QAM: b0b1 on I and b2b3 on Q, Gray: 00->-3, 01->-1, 11->+1, 10->+3
switch scheme
    case 'BPSK'
        s = 2*bits - 1;                                   % 0->-1, 1->+1
    case 'QPSK'
        b = reshape(bits, 2, []);
        s = (2*b(1,:)-1) + 1j*(2*b(2,:)-1);               % Es = 2 = 2*Eb  (already Eb=1)
    case '16QAM'
        b   = reshape(bits, 4, []);
        lut = [-3 -1 3 1];                                % index = 2*b0 + b1 + 1
        s   = (lut(2*b(1,:)+b(2,:)+1) + 1j*lut(2*b(3,:)+b(4,:)+1)) / sqrt(2.5);  % Es=10 -> Eb=2.5 -> scale
end
end
