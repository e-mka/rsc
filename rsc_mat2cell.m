function C = rsc_mat2cell(M, err)
    s = size(M, 1);
    if (s == 1) || (rsc_error(M) <= err)
        C = {mean(M(:))};
    else
        C = {{}, {}; {}, {}};
        for i = 1:2
           for j = 1:2
               N = M((i-1)*s/2+1:i*s/2, (j-1)*s/2+1:j*s/2);
               C{i, j} = rsc_mat2cell(N, err);
           end
        end
    end
end
