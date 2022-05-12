n = 64;
r = 0.19;

alpha = linspace(0,360-360/n,n);
sinu = sind(alpha);
cosi = cosd(alpha);

c12 = [0.9 0.9 0.9];

%% Formteil Unten

runten = r-0.03*r; % kleinerer Radius, damit alle Teile im Großen verschwinden
xu = cosi *runten;
yu = sinu *runten;
zu = onsz(yu,-.4);

xo = xu;
yo = yu;
zo = -sqrt(runten.^2 - yo.^2); % aus Kreisformel r^2 = z^2 + y^2

ftu_.x = [];
ftu_.y = [];
ftu_.z = [];
[ftu_.x,ftu_.y,ftu_.z] = prisma([xu' yu' zu'],[xo' yo' zo'],c12);


%% Rohr Außen

xr = onsz(xu,0.3);
yr = sinu *r;
zr = cosi *r;

xl = -xr;
yl = yr;
zl = zr;

ra_.x = [];
ra_.y = [];
ra_.z = [];
[ra_.x,ra_.y,ra_.z] = prisma([xr' yr' zr'],[xl' yl' zl'],c12);


%% Endcap 
n2 = 8;
rinnen = 0.11;
rring = 0.12; % dünner schwarzer Ring 
rrundung = r-rring;

% 2d: (zweites Koordinatensystem)
Axabrund = rring;
Bxabrund = r;
Ayabrund = 0.3 +rrundung; % = Byabrundung +rrundung
Byabrund = 0.3;

Exabrund = Bxabrund;
Eyabrund = Ayabrund;

test = abrundung90([Exabrund,Eyabrund],[Axabrund,Ayabrund],[Bxabrund,Byabrund],n2,rrundung);


R = test(:,1);
X = test(:,2);

Xk = repmat(X,1,n); %vielleicht

Yk = zeros(size(Xk)); 
Zk = Yk;
for i = 1:n2

    Yk(i,:) = sinu *R(i);
    Zk(i,:) = cosi *R(i);
end

Endcap1_.x = [];
Endcap1_.y = [];
Endcap1_.z = [];

for i = 1:n2-1

    [Xi,Yi,Zi]=...
    prisma([Xk(i,:)' Yk(i,:)' Zk(i,:)'],[Xk(i+1,:)' Yk(i+1,:)' Zk(i+1,:)'],c12);

    Endcap1_.x = [Endcap1_.x Xi];
    Endcap1_.y = [Endcap1_.y Yi];
    Endcap1_.z = [Endcap1_.z Zi];
end

% Punkte erstellen
patch(-Endcap1_.x,Endcap1_.y,Endcap1_.z,c12)

Endcap1_s.x = [Endcap1_.x -Endcap1_.x];
Endcap1_s.y = [Endcap1_.y  Endcap1_.y];
Endcap1_s.z = [Endcap1_.z  Endcap1_.z];

%% Schwarzer Ring

% Ring innen:
    yRi = sinu *rinnen;
    zRi = cosi *rinnen;
    xR  = 0.3+rrundung;
    xR = onsz(yRi,xR);

% Ring außen:
    yRa = sinu *rring;
    zRa = cosi *rring;

    Ring_.x = [];
    Ring_.y = [];
    Ring_.z = [];

[Ring_.x,Ring_.y,Ring_.z] = prisma([xR' yRi' zRi'],[xR' yRa' zRa'],'r');

Ring_s.x = [Ring_.x -Ring_.x];
Ring_s.y = [Ring_.y  Ring_.y];
Ring_s.z = [Ring_.z  Ring_.z];

patch(Ring_s.x,Ring_s.y,Ring_s.z,'k')

%% BasePlate
rmast = 0.13;

xBPa = cosi *runten;
xBPi = cosi *rmast;
yBPa = sinu *runten;
yBPi = sinu *rmast;

zBP = -.4;
zBP = onsz(xBPa,zBP);

BP_.x = [];
BP_.y = [];
BP_.z = [];
[BP_.x,BP_.y,BP_.z] = prisma([xBPa' yBPa' zBP'],[xBPi' yBPi' zBP'],'r');

%% Kombi aller Punkte        ...(außer die Ringe[andere Farbe])

Formteil_s.x = [ftu_.x ra_.x Endcap1_s.x BP_.x];
Formteil_s.y = [ftu_.y ra_.y Endcap1_s.y BP_.y];
Formteil_s.z = [ftu_.z ra_.z Endcap1_s.z BP_.z];

patch(Formteil_s.x+1,Formteil_s.y,Formteil_s.z,'r')



