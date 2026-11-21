function bits = demodulate(r, scheme)
% equalised complex symbols -> bits (hard decision)
switch scheme
    case 'BPSK'
        bits = double(real(r) > 0);
    case 'QPSK'
        b = zeros(2, length(r));
        b(1,:) = real(r) > 0;
        b(2,:) = imag(r) > 0;
        bits = b(:).';
    case '16QAM'
        r = r * sqrt(2.5);                                % undo the scaling
        [i0, i1] = levelBits(real(r));
        [q0, q1] = levelBits(imag(r));
        b = zeros(4, length(r));
        b(1,:) = i0; b(2,:) = i1; b(3,:) = q0; b(4,:) = q1;
        bits = b(:).';
end
end

function [b0, b1] = levelBits(x)
% snap to nearest level in {-3,-1,1,3} then Gray bits: -3=00 -1=01 1=11 3=10
lv = 2*round((x-1)/2) + 1;
lv = max(min(lv, 3), -3);
b0 = lv > 0;            % sign bit
b1 = abs(lv) < 2;       % 1 for the inner levels (-1, +1)
end
