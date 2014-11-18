function [M, xmin, xmax, ymin, ymax] = rsc_file2mat(filename)
	fh = fopen(filename, 'r');
    max_level = str2num(fgetl(fh));
    aux = str2num(fgetl(fh)); w = aux(1); h = aux(2);
    aux = str2num(fgetl(fh)); xmin = aux(1); xmax = aux(2);
    aux = str2num(fgetl(fh)); ymin = aux(1); ymax = aux(2);
    
    V = {};
    len = 0;
    level = 0;
    
    while true
        line = fgetl(fh);
        if ~ischar(line)
            break
        end
        len = len + 1;
        aux = str2num(line); lev = aux(1); val = aux(2);
        V{len} = {lev, val*ones(2^lev)};
    end
    
    for level = 0:(max_level - 1)
        for i = 1:len
            if V{i}{1} == level
                V{i}{1} = level + 1;
                F = [];
                j = 1;
                while length(F) < 3
                    idx = i+j;
                    if V{idx}{1} >= 0
                       F = [F; idx]; 
                       V{idx}{1} = -1;
                    end
                    j = j + 1;
                end
                V{i}{2} = [V{i}{2}, V{F(2)}{2}; V{F(1)}{2}, V{F(3)}{2}];
            end
        end
    end
    
    M = V{1}{2};
    M = M(1:w, 1:h);
    M = M';
    
    fclose(fh);
end
