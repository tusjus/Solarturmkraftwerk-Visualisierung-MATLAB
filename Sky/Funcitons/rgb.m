function [rgb] = rgb(r,g,b)


faktor = 1/256;

rgb = [r,g,b].*faktor;


end