function [F] = readpdensity(file)
fid = fopen(file);
for i = 1:13;
    fgetl(fid);
end
while 1
    txt = fgetl(fid);
    if (size(txt) == 0); break; end
    if (strcmp(txt(1),'%') == 1); break; end
    if txt == -1; break;end
    Data(i,:) = str2num(txt);
    i = i + 1;
end
fclose(fid);
T = (Data(:,1));
P = (Data(:,2));
p = (Data(:,3));
i = find(isnan(p) == 1);
T(i) = []; P(i) = []; p(i) = [];
[T1 P1] = meshgrid(unique(T),unique(P));
p1 = griddata(T,P,p,T1,P1);
F = griddedInterpolant(T1',P1',p1');