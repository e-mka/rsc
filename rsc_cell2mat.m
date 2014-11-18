function M = rsc_cell2mat(C, level)
    s = 2^level;
    
    if (level == 0) || (size(C, 1) == 1)
        M = C{1, 1} * ones(s); 
    else
        M = zeros(s);
        for i = 1:2
           for j = 1:2
               M((i-1)*s/2+1:i*s/2, (j-1)*s/2+1:j*s/2) = rsc_cell2mat(C{i, j}, level - 1);
           end
        end
    end
end
