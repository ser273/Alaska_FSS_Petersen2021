function [LName LNum ] = fill_array(x_t,y_t,layer,Geom,sp);
LName = cell(size(x_t));
LName(:) = {'Undefined'};
LName = string(LName);
LNum = NaN(size(x_t));
for i = 1:length(layer);
 name = char(layer(i));
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
    inds2 = find(y_t >= ( m.*x_t + b)+sp); 
    [vals,dum] = intersect(inds,inds2);
    LName(vals) = layer(i);
    LNum(vals) = i; 
   end
end