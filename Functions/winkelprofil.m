function Arund = winkelprofil(seite1,seite2,dicke,n,r)
% erstellt 2D-Punkte für ein Winkelprofil 

%Ecke = [0 0], Seite1 x+, Seite2 y+

A = [0 seite1 seite1 dicke dicke 0
     0 0 dicke dicke seite2 seite2]';


%% Abrundung

rundung1 = abrundung90(A(1,:),A(6,:),A(2,:),n,r*1.5);
rundung2 = abrundung90(A(4,:),A(3,:),A(5,:),n,r);

Arund = [rundung1   %Ecken durch Rundungen ersetzen
         A(2:3,:) 
         rundung2
         A(5:6,:)]; 
end

