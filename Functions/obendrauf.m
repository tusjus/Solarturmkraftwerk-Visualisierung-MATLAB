function obendrauf(xvschieb,yvschieb,alpha,beta)


%% Ebene: 

C = rgb(223,223,225);
b = 11; %Breite
h = 11; %Höhe
r = .5; %Rohr Radius
abst = 0.9+r; %Abstand

x = [-b/2 b/2 b/2 -b/2];
y = [-h/2 -h/2 h/2 h/2];
z = [abst abst abst abst];


% yrot

xr = x*cosd(beta) + z*sind(beta);
yr = y;
zr = z*cosd(beta) - x*sind(beta);


% zrot

xrr = xr*cosd(alpha) - yr*sind(alpha);
yrr = xr*sind(alpha) + yr*cosd(alpha);
zrr = zr;


% verschiebung auf richtige Höhe
h = 7;
zh = zrr+ones(size(zrr)).*h;

fill3(verschieb(xrr,xvschieb),verschieb(yrr,yvschieb),zh,C)

end