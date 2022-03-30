function alp = xwinkelpm(p,m)

mx = m(1);      my = m(2);
px = p(:,1)-mx; py = p(:,2)-my;

% winkel zur (positiven) x-achse 

alp = atan(py./px);

%linke Kreisseite fixen
linke_winkel = alp(px<0); 
               alp(px<0) = onsz(linke_winkel,pi)+linke_winkel; 

%jetzt noch alle übrigen (rechts unten) fixen (alp<0)
uebrig = alp(alp<0);
         alp(alp<0) = onsz(uebrig,2*pi)+uebrig;
end