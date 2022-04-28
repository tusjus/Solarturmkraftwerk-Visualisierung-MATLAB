clf, hold on, axis equal

c = [0.5 0.5 0.5];
c1 = [0.7 0.7 0.7];

%% Mirrors
Luecke = 0.4;
Luecke05 = Luecke/2;
Breite = 2.75;
Hoehe =  4;
Dicke = 0.01; %Spiegeldicke = 0.005 aber das ist bisschen zu dünn

% Rechteck unten
MirrorU1 = [Luecke05 Luecke05+Breite Luecke05+Breite Luecke05 % x
      -Hoehe/2 -Hoehe/2 Hoehe/2 Hoehe/2                 % y
      0 0 0 0                                  ]';      % z
patch(MirrorU1(:,1),MirrorU1(:,2),MirrorU1(:,3),[0.9 0.9 0.9],'linestyle','none')

% rechteck oben
MirrorO1 = MirrorU1;
MirrorO1(:,3) = ones(4,1)*Dicke;
patch(MirrorO1(:,1),MirrorO1(:,2),MirrorO1(:,3),[0.97 0.97 0.99],'linestyle','none')

% Wände
prisma(MirrorU1,MirrorO1,[0.9 0.9 0.9])


%% Pads
Pad_xAbstand = 1;
Pad_yAbstand = 0.6;

Mittel_Pad_loc = [Breite/2+Luecke05 
                  0 
                  0                ];

Pad_location = zeros(7*3,3); % allocate memory
n = 1;
for j = -1:1

    for k = linspace(-Pad_yAbstand*3,Pad_yAbstand*3,7)
        
        Pad_location(n,:) = [Mittel_Pad_loc(1)+j
                             Mittel_Pad_loc(2)+k
                             0                  ];
        n = n+1;
    end
end


% n-Eck
r = 0.05;
n = 22;
alpha = linspace(0,360-360/n,n); 

nEck = [r*cosd(alpha)
        r*sind(alpha)
        zeros(1,n)]';

Pad_dicke = 0.02;

PadsO21 = zeros(n,14*3);
PadsU21 = zeros(n,14*3);

for j = 1:size(Pad_location,1) % n-Eck bei location plotten
  
    nEckj = nEck + repmat(Pad_location(j,:),size(nEck,1),1);

    nEckj_drueber = nEckj;
    nEckj_drueber(:,3) = ones(1,size(nEck,1))*-Pad_dicke;

    prisma(nEckj,nEckj_drueber,c1)
    patch(nEckj_drueber(:,1),nEckj_drueber(:,2),nEckj_drueber(:,3),c1,'linestyle','none')

    % Punkte erstellen
    PadsO21(:,j*3-2:j*3) = nEckj;
    PadsU21(:,j*3-2:j*3) = nEckj_drueber;
end

% entpacken


%% Brackets (Winkeleisen)

[BracketO21, BracketU21] = bracket(Pad_location);



%% Support arms

dicke_SupportArm = 0.01;
seite1 = 0.1;
seite2 = 0.04;


Profil_SpA = winkelprofil(seite1,seite2,dicke_SupportArm,5,0.5*dicke_SupportArm);
%plot(Profil_SpA(:,1),Profil_SpA(:,2))

z = Profil_SpA(:,1)-seite1 -0.12; %nach unten verschieben (um wie viel noch ändern)
x = Profil_SpA(:,2);

                                            ueberhang = 0.1; % noch etwas reduzieren
y = ones(length(x),1)* (6/2)*Pad_yAbstand + ueberhang;

    pos_Spax = [Mittel_Pad_loc(1,:)-1 
                Mittel_Pad_loc(1,:) 
                Mittel_Pad_loc(1,:)+1];
    pos_Spax = pos_Spax - dicke_SupportArm/2; % Verschiebung, damits unterm Nippel ist



pos_SpA = zeros(3);
pos_SpA(:,1) = pos_Spax;

SupArmO3 = zeros(length(x),3*size(pos_SpA,1));
SupArmU3 = SupArmO3;
for j = 1:size(pos_SpA,1)

    x1 = x+pos_SpA(j,1); y1 = y+pos_SpA(j,2); z1 = z+pos_SpA(j,3);
   
    fill3(x1,y1,z1,c,'linestyle','none')
    prisma([x1 y1 z1],[x1 -y1 z1],c)
     fill3(x1,-y1,z1,c,'linestyle','none');

     % Punkte erstellen
     SupArmO3(:,j*3-2:j*3) = [x1 y1 z1];
     SupArmU3(:,j*3-2:j*3) = [x1 -y1 z1];
end


%% Diagonals





%% Torque Tube







