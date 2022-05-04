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
%prisma(MirrorU1,MirrorO1,[0.9 0.9 0.9]);

% Punkte xyz
    
[Mirror1.x,Mirror1.y,Mirror1.z] = prisma(MirrorU1,MirrorO1,[0.9 0.9 0.9]);
    % da cap auch ein 4-eck, alles in einer Matrix
Mirror1.x = [Mirror1.x MirrorO1(:,1) MirrorU1(:,1)];
Mirror1.y = [Mirror1.y MirrorO1(:,2) MirrorU1(:,2)];
Mirror1.z = [Mirror1.z MirrorO1(:,3) MirrorU1(:,3)];
% vllt den Mirror oben extra, für eine andere Farbe

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

Pads21.x = zeros(4,size(Pad_location,1)*n); % = 21
Pads21.y = Pads21.x;
Pads21.z = Pads21.x;
Pads21.Cap.x = zeros(n,21);
Pads21.Cap.y = Pads21.Cap.x;
Pads21.Cap.z = Pads21.Cap.x;


for j = 1:size(Pad_location,1) % n-Eck bei location plotten
  
    nEckj = nEck + repmat(Pad_location(j,:),size(nEck,1),1);

    nEckj_drueber = nEckj;
    nEckj_drueber(:,3) = ones(1,size(nEck,1))*-Pad_dicke;

    idx = j*n+1-n:j*n;
    [Pads21.x(:,idx),Pads21.y(:,idx),Pads21.z(:,idx)] = prisma(nEckj,nEckj_drueber,c1);
    patch(nEckj_drueber(:,1),nEckj_drueber(:,2),nEckj_drueber(:,3),c1,'linestyle','none')
    
    % Punkte erstellen  oben schon 3^ 
    Pads21.Cap.x(:,j) = nEckj_drueber(:,1);
    Pads21.Cap.y(:,j) = nEckj_drueber(:,2);
    Pads21.Cap.z(:,j) = nEckj_drueber(:,3);

    PadsO21(:,j*3-2:j*3) = nEckj;
    PadsU21(:,j*3-2:j*3) = nEckj_drueber;
end

% entpacken


%% Brackets (Winkeleisen)

[BracketO21, BracketU21] = bracket(Pad_location);


for j = 1:size(BracketO21,2)/3

    idx = (j-1)*14+1:j*14;
    idx2 = (j-1)*3+1:j*3;
    [Bracket21.x(:,idx),Bracket21.y(:,idx),Bracket21.z(:,idx)] = prisma(BracketO21(:,idx2),BracketU21(:,idx2),[0.9 0.9 0.9]);
end

Bracket21.Cap.x = [BracketO21(:,1:3:end) BracketU21(:,1:3:end)];
Bracket21.Cap.y = [BracketO21(:,2:3:end) BracketU21(:,2:3:end)];
Bracket21.Cap.z = [BracketO21(:,3:3:end) BracketU21(:,3:3:end)];


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
idx = 1;
for j = 1:size(pos_SpA,1)

    x1 = x+pos_SpA(j,1); y1 = y+pos_SpA(j,2); z1 = z+pos_SpA(j,3);
   
    fill3(x1,y1,z1,c,'linestyle','none')
    [SupArm3.x(:,idx:idx+13),SupArm3.y(:,idx:idx+13),SupArm3.z(:,idx:idx+13)]=prisma([x1 y1 z1],[x1 -y1 z1],c);
        idx = idx+14;
    fill3(x1,-y1,z1,c,'linestyle','none');

     % Punkte erstellen
     SupArmO3(:,j*3-2:j*3) = [x1 y1 z1];
     SupArmU3(:,j*3-2:j*3) = [x1 -y1 z1];
end

% xyz-Punkte
SupArm3.Cap.x = [SupArmO3(:,1:3:end) SupArmU3(:,1:3:end)];
SupArm3.Cap.y = [SupArmO3(:,2:3:end) SupArmU3(:,2:3:end)];
SupArm3.Cap.z = [SupArmO3(:,3:3:end) SupArmU3(:,3:3:end)];


%% Diagonals





%% Torque Tube







