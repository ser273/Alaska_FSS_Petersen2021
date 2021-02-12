function [LName LNum layer] = add_gabbro(x_t,y_t,layer,Geom,sp,LName,LNum,dhc,name);
    ind = strmatch(name,LName);
    nnum = size(layer,2) + 1;
    nname = append(name,"_Gabbro");
    layer = [layer nname];
    pts = Geom.(name);  
    for j = 1:(size(pts)-1)
         %% Define Lines %%%
        xl = [pts(j,2) pts(j+1,2)];
        yl = [pts(j,3) pts(j+1,3)];
        c = [[1; 1]  xl(:)]\yl(:); % Calculate Parameter Vector
        m = c(2);
        b = c(1);
        %% find x values in range%%%
        inds = find(x_t >= pts(j,2) & x_t <= pts(j+1,2)+sp);
        x1 = min(x_t(inds));
        x2 = max(x_t(inds));
        xx = linspace(x1,x2,10000);
        yy = (m.*xx + b); 
        [idx d] = rangesearch([x_t y_t],[xx' yy'],dhc);
        idx = unique(cell2mat(idx'));
        [id] = intersect(ind,idx);
        LNum(id) = nnum;
        LName(id) = nname;
    end
    