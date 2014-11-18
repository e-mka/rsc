function [N, level, w, h] = rsc_prepare(M)
    [h, w] = size(M);
    s = max(2^nextpow2(h), 2^nextpow2(w));
    N = Inf * ones(s);
    N(1:h, 1:w) = M;
    level = nextpow2(size(N, 1));
    N(N >= 1.7014e+38) = Inf;
end
