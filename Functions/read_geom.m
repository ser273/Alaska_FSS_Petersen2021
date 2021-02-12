function [Geom] = read_geom(file,layer)
fid = fopen(file);
fgetl(fid);
for layer = layer
  i = 1; txt = [1];
  while 1
    txt = fgetl(fid);
    if (size(txt) == 0); break; end
    if (strcmp(txt(1),'%') == 1); break; end
    if txt == -1; break;end
    pts(i,:) = str2num(txt);
    i = i + 1;
  end
  Geom.(char(layer)) = pts;
  clear pts
end
fclose(fid);