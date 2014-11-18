function ascii2rsc(asciiname, rscname, error)
    [M, xmin, xmax, ymin, ymax] = rsc_grd_read(asciiname);
    [M, level, w, h] = rsc_prepare(M);
    C = rsc_mat2cell(M, error);
    rsc_cell2file(rscname, C, level, w, h, xmin, xmax, ymin, ymax);
end
