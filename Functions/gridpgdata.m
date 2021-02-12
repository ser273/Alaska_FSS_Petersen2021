function [x1 y1 V1] = gridpgdata(TData,spacing, i)
x = 1:spacing:max(TData(:,1))+1;
y = 1:-spacing:min(TData(:,2))+1;
[x1 y1] = meshgrid(x,y);
if i == 1;
    V1 = griddata(TData(:,1),TData(:,2),TData(:,3),x1,y1);
elseif i == 2;
    V1 = griddata(TData(:,1),TData(:,2),TData(:,3),x1,y1,'nearest');
end
