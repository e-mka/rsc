function err = rsc_error(M)
    m = mean(M(:));
    if m == Inf
        if min(M(:)) == Inf
            err = 0;
        else
            err = Inf;
        end
    else
        err = max(abs(m - max(M(:))), abs(m - min(M(:))));
    end
end
