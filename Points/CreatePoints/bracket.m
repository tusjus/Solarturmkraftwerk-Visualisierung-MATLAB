function [BracketO21, BracketU21] = bracket(pos)

c = [0.5 0.5 0.5]; %color

%% nEck
r = 0.03;
n = 22;
alpha = linspace(0,360-360/n,n); 
Pad_dicke = 0.02;

% nEck = [r*cosd(alpha)
%         r*sind(alpha)
%         ones(1,n)*-Pad_dicke]';
% 
% fill3(nEck(:,1),nEck(:,2),nEck(:,3),'c','linestyle','none')


%% Profil
dicke = 0.005;
dicke_SupportArms = 0.01;
seite1 = 0.12;
seite2 = 2*dicke + dicke_SupportArms;
breite = 0.05;

Profil = winkelprofil(seite1,seite2,dicke,5,0.5*dicke);

% z ist x (rotation)
z = -Profil(:,1) - Pad_dicke;
x = Profil(:,2) - dicke - dicke_SupportArms/2;
y = ones(length(x),1) * -0.5*breite;


BracketO21 = zeros(5*2+4,21*3);
BracketU21 = BracketO21;


for j = 1:size(pos,1)

    x1 = x+pos(j,1); y1 = y+pos(j,2); z1 = z+pos(j,3);
    x2 = x1;         y2 = y1+breite;          z2 = z1;

    fill3(x1,y1,z1,c,'linestyle','none')
    prisma([x1 y1 z1],[x2 y2 z2],c)
    fill3(x2,y2,z2,c,'linestyle','none');

    % Punkte erstellen
    BracketO21(:,j*3-2:j*3) = [x1 y1 z1];
    BracketU21(:,j*3-2:j*3) = [x2 y2 z2];

end



end