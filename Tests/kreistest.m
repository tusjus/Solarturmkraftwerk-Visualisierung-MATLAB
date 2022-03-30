n = 77;
r = 0.5;
cnt = linspace(0,2*(pi-0.1),n);

xk = r * cos(cnt);
yk = r * sin(cnt);

plot(xk,yk)

kp = [xk' yk']; % wird nie benutzt

agl1 = atan(yk./xk);

%idx = xk<0;

%linke Kreisseite fixen
linke_winkel = agl1(xk<0); %später xpunkt < x-mittelpunkt, zur verschiebung
               agl1(xk<0) = onsz(linke_winkel,pi)+linke_winkel; 

%jetzt noch alle übrigen (rechts unten) fixen (agl1<0)

uebrig = agl1(agl1<0);
         agl1(agl1<0) = onsz(uebrig,2*pi)+uebrig;



% if xk<0
% 
%     agl1 = pi-agl1;
% ed


% if agl1<0 --> +360° 

x = 1:77;
plot(x,agl1)

agl1d = agl1/pi*180;


% alternativ: verschiebung > normierung > mappen
