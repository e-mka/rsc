function rsc2ascii(rscname, asciiname)
    [M, xmin, xmax, ymin, ymax] = rsc_file2mat(rscname);
    rsc_grd_write(M, xmin, xmax, ymin, ymax, asciiname);
end
