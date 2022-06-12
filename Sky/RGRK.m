% Bild erstellen
for eleM = 0.1:0.1:90

RK = 300; % Radius kleine Kugel
RG = 1000; % Radius große Kugel

Aazi = 0.1:0.1:360;
Aele = 0.1:0.1:90;        
[Ax,Ay,Az] = Vazieler2xyz(Aazi-90,Aele,RG);% Punkte von Pixeln im Raum## -90 für das bild, (wird wohl nicht bei N sondern W gewraped) (später noch wo anders hischreiben?)

aziM = 90; % für mitte vom Bild
%eleM = 5;
[x,y,z] = azieler2xyz(aziM,eleM,RG);
M = [x,y,z];
richtung_M = M/norm(M);

MA = sqrt((M(1)-Ax).^2 +(M(2)-Ay).^2 +(M(3)-Az).^2); % länge von M nach A
MA(MA>RK) = 0;
betaD0MA = acosd(MA/(2*RG)); % Dreieck O M A siehe Skizze
alphaD0MA = 180-2*betaD0MA;

Norm_mpa = cosd(alphaD0MA)*RG;% länge von O nach mpa gleich zu: Norm_Ompa
mpaX = Norm_mpa *richtung_M(1);% Punkt siehe Skizze
mpaY = Norm_mpa *richtung_M(2);
mpaZ = Norm_mpa *richtung_M(3);

Xmpa_A = Ax-mpaX; % x-Komponente von mpa nach A
Ympa_A = Ay-mpaY; % y     "       "   "    "  "
Zmpa_A = Az-mpaZ; % z     "       "   "    "  "
Norm_mpa_A = sqrt(Xmpa_A.^2 +Ympa_A.^2 +Zmpa_A.^2);

richtungXmpa_A = Xmpa_A./Norm_mpa_A;
richtungYmpa_A = Ympa_A./Norm_mpa_A;
richtungZmpa_A = Zmpa_A./Norm_mpa_A;
richtungZmpa_A(uint16(eleM*10),1800) = 500; %Mittelpunkt auf z=500 setzen oder sowas

% Test
% clf, hold on, grid on, axis equal
% %plot3(richtungXmpa_A(MA>0),richtungYmpa_A(MA>0),richtungZmpa_A(MA>0),'o')
% 
% plot3(mpaX(MA>0),mpaY(MA>0),mpaZ(MA>0),'o','color','r')
% plot3(Ax(MA>0),Ay(MA>0),Az(MA>0),'o','color','b')
%  
% 
% tausendX = richtungXmpa_A *1000 +mpaX;
% tausendY = richtungYmpa_A *1000 +mpaY;
% tausendZ = richtungZmpa_A *1000 +mpaZ;
% 
% 
% % Ax2 = mpaX+Xmpa_A;
% % Ay2 = mpaY+Ympa_A;
% % Az2 = mpaZ+Zmpa_A;
% % plot3(Ax2(MA>0),Ay2(MA>0),Az2(MA>0),'o','color','g')
% 
% 
% plot3(tausendX(MA>0),tausendY(MA>0),tausendZ(MA>0),'o','color','k')
% 

%% Großes Dreieck
betaD0MCo = acosd(RK/(2*RG)); % Co-Dreieck siehe Skizze
alphaD0MCo = 180-2*betaD0MCo;

Norm_mpco = cosd(alphaD0MCo)*RG;% länge von O nach mpa gleich zu: Norm_Ompa
mpco = Norm_mpco*richtung_M; % Punkt siehe Skizze
laenge = sind(alphaD0MCo)*RG;

c0x = richtungXmpa_A *laenge +mpco(1);
c0y = richtungYmpa_A *laenge +mpco(2);
c0z = richtungZmpa_A *laenge +mpco(3); 
    c0z(MA==0) = 0; % Mittelpunkt und Hintergrund entfernen
    eleC0 = asind(c0z/RG); % Das was gesucht war

clf, hold on, grid on, axis equal
%plot3(c0x(MA>0),c0y(MA>0),c0z(MA>0),'o')



%%
% Farbe aus 2 Farben: Farbe 1 = FarbeC0 (Matrix)(i̶n̶ ̶2̶5̶6̶ ̶s̶c̶h̶r̶e̶i̶b̶w̶e̶i̶s̶e̶)
%                     Farbe 2 = Farbe Sonne (Skal(ele))


% Mischungsverhältnis über Abst

FarbeSonne = 1;

%+900, dann Matrix um 900 erweitern

load RGB.mat
[Gradient,map] = Gradient_test(eleM,RGB,256);

Erweiterung = onsz(Gradient,Gradient(1,1));
Gradient_erweitert = [Erweiterung
                      Gradient];

eleC0_erweitert = eleC0+90; 
idx_erweitert = uint16(eleC0_erweitert*10); % dadurch wird das negative V nicht weggenommen. 

Abst = sqrt((Ax-M(1)).^2 + (Ay-M(2)).^2 + (Az-M(3)).^2);

FarbeC065 =Gradient_erweitert(uint16(idx_erweitert)) ;
FarbeC065(Abst>RK) = Gradient(Abst>RK);

% Rand zumschluss entfernen
%indexiertes Bild von 0 bis 1, dann am schluss *256

SonnenMatrix = onsz(FarbeC065,FarbeSonne); % = ones(900,3600)

RSonne = RK/4.5;

% Wenn Abst>RK -> faktor = 0; 
% Wenn Abst<=RSonne; faktor = 1;
Test1 = (Abst-RSonne)/(RK-RSonne); % Formel zum Farbenmischen 
Test1(Test1>1) = 1; % entfernen von Hintergrund
Test1(Test1<0) = 0; % entfernen von Sonnenfleck

% Test1 = Faktor
Test1 = Test1.^0.6; % um es am rand heller zu machen

      % Sonne     % Hintergrund
TB1 = (1-Test1) + FarbeC065.*Test1;

colormap(map);

% TB1(Abst>RK+10) = NaN;
% TB1(Abst<RK-10) = NaN;
% image(TB1*256)
image(TB1*256)

filename = ['Bilder/Sonnen2bild90' num2str(eleM*10) '.png'];
imwrite(TB1*256,map,filename)
end



