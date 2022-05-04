abstd = 2.7; % Abstand zur Mitte *2

xlabel('x')
ylabel('y')
zlabel('z')


seite1 = 0.03;
seite2 = seite1;
dicke = 0.005;

n = 5;
Profil = winkelprofil(seite1,seite2,dicke,n,0.5*dicke);
Profil(:,1) = -Profil(:,1); % 180° drehung
Profil(:,2) = Profil(:,2)+(abstd/2); % y verschiebung

 hold on
plot(Profil(:,1),Profil(:,2))
view(3)
axis equal

pad_x_absnd = 1;

pos_Diagx = [Mittel_Pad_loc(1,:)-1-dicke 
            Mittel_Pad_loc(1,:)-dicke 
            Mittel_Pad_loc(1,:)+1-dicke];

ProfilALL3x = zeros(n*2+4,3); %allocate memory etagen->nEck zimmer->anzahl an Eisenwinkel

Profil(:,1) = Profil(:,1)+onsz(Profil(:,1),pos_Diagx(1)); %verschiebung, dass es Supportarms berührt

for i = 1:3
    ProfilALL3x(:,i) = Profil(:,1)+onsz(Profil(:,1),pos_Diagx(i)); %verschiebung, dass es Supportarms berührt
end     


ProfilO = [Profil onsz(Profil(:,1),-0.175)]; %Profil Oben                                                           
                                    % ^runter verschieben
ProfilU = [Profil onsz(Profil(:,1),-1.614)];

%prisma(ProfilO,ProfilU,[0.5,0,0])                                    

                          
                                    
%conct_sprt_arm_z = ; % 2/3 runter beim support arm




% Drehpunkt auf Winkelprofil bei: 


% x = mitte von seite ?  ; y abstand von oben auch

stange_ymin = min(Profil(:,2));
stange_ymax = max(Profil(:,2));

abstand_dreh = (stange_ymax-stange_ymin)/2;

drehpnkt = [pos_Diagx(1) stange_ymin+abstand_dreh -0.175-abstand_dreh];

plot3(drehpnkt(1),drehpnkt(2),drehpnkt(3),'o','color',"g")


% Profil hat die Punkte

% Rotation (mit verschiebung):
alpha = 16;
alpha = alpha-90;

R = rotx(alpha); % Rotationsmatrix

% verschieben  ...(unnötig die x-Koordinate mitzuverschieben aber trotzdem)
    ProfilOV = ProfilO - drehpnkt; % Profil Oben Verschoben
    ProfilUV = ProfilU - drehpnkt;
% drehen
    ProfilOVgd = R*ProfilOV'; % Profil Oben Verschoben gedreht
    ProfilUVgd = R*ProfilUV'; 
% rückverschieben
    ProfilOgd = ProfilOVgd' + drehpnkt; % Profil Oben gedreht
    ProfilUgd = ProfilUVgd' + drehpnkt; 
    %prisma(ProfilOgd,ProfilUgd,[1,0,1])% Pink




%% Punkte erstellen:

% x1 y1 z1 x2 y2...

% oben
    ProfilOgd2 = [ProfilOgd(:,1)+1 ProfilOgd(:,[2 3])]; % +1 weil das der x-abstand der Pads ist
    ProfilOgd3 = [ProfilOgd(:,1)+2 ProfilOgd(:,[2 3])];
    
    DiagonalsO3 = [ProfilOgd ProfilOgd2 ProfilOgd3];
    
    minus1y = repmat([1 -1 1],n*2+4,3);% um nur die y-werte zu SPIEGELN
    DiagonalsO6 = [DiagonalsO3 DiagonalsO3.*minus1y];


% unten
    ProfilUgd2 = [ProfilUgd(:,1)+1 ProfilUgd(:,[2 3])];
    ProfilUgd3 = [ProfilUgd(:,1)+2 ProfilUgd(:,[2 3])];
    
    DiagonalsU3 = [ProfilUgd ProfilUgd2 ProfilUgd3];
    DiagonalsU6 = [DiagonalsU3 DiagonalsU3.*minus1y];




% Punkte
idx = 1:14;
for i = 1:3:size(DiagonalsO6,2)
    idx = idx+14;
    [Diagonals6.x(:,idx),Diagonals6.y(:,idx),Diagonals6.z(:,idx)] = prisma(DiagonalsO6(:,i:i+2),DiagonalsU6(:,i:i+2),rgb(132, 66, 245));
    endcap(DiagonalsO6(:,i:i+2),rgb(132, 66, 245))
    endcap(DiagonalsU6(:,i:i+2),rgb(132, 66, 245))
end



Diagonals6.Cap.x = [DiagonalsO6(:,1:3:end) DiagonalsU6(:,1:3:end)];
Diagonals6.Cap.y = [DiagonalsO6(:,2:3:end) DiagonalsU6(:,2:3:end)];
Diagonals6.Cap.z = [DiagonalsO6(:,3:3:end) DiagonalsU6(:,3:3:end)];




