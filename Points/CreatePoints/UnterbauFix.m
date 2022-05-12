n = 66;
r = 0.13;

alpha = linspace(0,360-360/n,n);

x1 = cosd(alpha) *r;
y1 = sind(alpha) *r;
z1 = onsz(y1,-0.2);


x2 = x1;
y2 = y1;
z2 = onsz(y2,-2.35);

[Mast_s.x, Mast_s.y, Mast_s.z] = prisma([x1' y1' z1'],[x2' y2' z2'],'r');







