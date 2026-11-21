function r = equalize(y, h)
% channel is KNOWN at the receiver -> channel inversion
r = y ./ h;
end
