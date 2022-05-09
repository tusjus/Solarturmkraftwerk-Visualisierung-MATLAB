dicke = 0.004;
Breite = 0.05; 

%seite1 = 0.1#;

% muss leicht angewinkelt sein, damit es über dem supportarm und hinter den
% Diagonals ist. 

% -> 4 punkte bei Suparm und 4 bei Diagonlas
%       dann daraus Prisma

%% Punkte aus Suparm und Diag
x1SA = min(min(SupArm3.Cap.x));
x2SA = x1SA - dicke;
x1Di = x1SA+dicke;
x2Di = x1SA;

y1 = Breite/2;
y2 = -y1;

zo = min(min(SupArm3.Cap.z))+0.027;
zu = min(min(Diagonals6.Cap.z))-0.005;

%% Rechtecke:
Ax = [x2SA x1SA x1SA x2SA];
Ay = [y1 y1 y2 y2];
Az = [zo zo zo zo];
A = [Ax' Ay' Az'];
Bx = [x2Di x1Di x1Di x2Di];
By = [y1 y1 y2 y2];
Bz = [zu zu zu zu];
B = [Bx' By' Bz'];

[Mittelding3.x,Mittelding3.y,Mittelding3.z] = prisma(A,B,rgb(111, 111, 121));

%% Cap hinzufügen
Mittelding3.x = [Mittelding3.x A(:,1) B(:,1)];
Mittelding3.y = [Mittelding3.y A(:,2) B(:,2)];
Mittelding3.z = [Mittelding3.z A(:,3) B(:,3)];

%% Für die anderen 2                 1.                 2.
xabst = 1;                         % V                  V 
Mittelding3.y = [Mittelding3.y Mittelding3.y       Mittelding3.y];
Mittelding3.z = [Mittelding3.z Mittelding3.z       Mittelding3.z];
Mittelding3.x = [Mittelding3.x Mittelding3.x+xabst Mittelding3.x+2*xabst];

fill3(Mittelding3.x,Mittelding3.y,Mittelding3.z,rgb(20, 236, 35))





