function H = Himmel2(Bild,d,x_verschiebung,y_verschiebung)
% d = 400;
x = linspace(d,d,1000);
y = linspace(d,d,1000);

c = rgb(65,100,165);

[Kugel.Textur,map] = imread(Bild);
%Kugel.Textur = flipud(Kugel.Textur);
[Kugel.X,Kugel.Y,Kugel.Z] = sphere(500);
oberehaelfte = round(size(Kugel.Z,1)/2):size(Kugel.Z,1);
H = surface(Kugel.X(oberehaelfte,:)*x(end)+x_verschiebung,Kugel.Y(oberehaelfte,:)*y(end)+y_verschiebung,Kugel.Z(oberehaelfte,:)*x(end),Kugel.Textur,'FaceColor','texturemap','EdgeColor','none','CDataMapping','direct');

colormap(map)
end

