function rsc2ascii(rscname, asciiname)
    [M, xmin, xmax, ymin, ymax] = rsc_file2mat(rscname);
    M(M == Inf) = 1.70141e+038;
    rsc_grd_write(M, xmin, xmax, ymin, ymax, asciiname);
end
