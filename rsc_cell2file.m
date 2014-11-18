function rsc_cell2file(filename, C, level, w, h, xmin, xmax, ymin, ymax)
    fh = fopen(filename, 'w');
    fprintf(fh, '%i\n', level);
    fprintf(fh, '%i %i\n', [w h]);
    fprintf(fh, '%f %f\n', [xmin xmax]);
    fprintf(fh, '%f %f\n', [ymin ymax]);
    
    rsc_cell2file_rec(C, level, fh);
    
    fclose(fh);
end
