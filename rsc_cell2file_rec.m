function rsc_cell2file_rec(C, level, fh)
    if (level == 0) || (size(C, 1) == 1)
        val = C{1, 1};
        fprintf(fh, '%i %f\n', [level val]);
    else
        for i = 1:2
           for j = 1:2
               rsc_cell2file_rec(C{i, j}, level - 1, fh);
           end
        end
    end
end
