function R = roty(ang)

R = [cosd(ang) 0 sind(ang)
     0 1 0
     -sind(ang) 0 cosd(ang)];
end