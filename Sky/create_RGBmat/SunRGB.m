% Sonnenfarbe aus Ele



n = 256;

Rmin = 256/256;
Rmax = 256/256;
R = linspace(Rmin,Rmax,n);

Gmin = 160/256;
Gmax = 256/256;
G = nonLinspace(Gmin,Gmax,n,'log10');

Bmin = 150/256;
Bmax = 256/256;
B = nonLinspace(Bmin,Bmax,n,'exp10');


RGB = [R' G' B'];

map = RGB;

map900RGB10= RGB;





644/256;

idx = nonLinspace(1,255,644,'log10');
idx = round(idx);
%idx = 256 - flip(idx);
%idx = [1 1 2 2 3 4];
a = 0;
for i = idx

    mittelwert = (RGB(i+a,:) + RGB(i+a+1,:)) /2;
    
    RGB = [RGB(1:i+a,:); mittelwert; RGB(i+a+1:end,:)];
    a = a+1;
end

imwrite(RGB,'RGB.png');





%% 

ele = 10;
c0 = rgb(10, 40, 150); % Blau(Himmel)
c1 = RGB(ele*10,:); % Sonne


nFarben = 256;

r = linspace(c0(1),c1(1),nFarben);
g = linspace(c0(2),c1(2),nFarben);
b = linspace(c0(3),c1(3),nFarben);



map = [r',g',b'];

colormap(map)














