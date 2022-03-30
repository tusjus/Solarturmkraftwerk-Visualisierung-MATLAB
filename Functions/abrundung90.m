function [p1rp2] = abrundung90(p,p1,p2,n,r)
% abrundung für 90° winkel

% p = Eckpunkt
% p1, p2 = Nachbarecke 1, 2
% n = anzahl an Zwischenpunkten
% r = Radius

%% TangentialPunkte berrechnen

v1 = (p1-p)/norm(p1-p); %richtungs-einheitsvektor
v2 = (p2-p)/norm(p2-p);

tp1 = p + v1*r; 
tp2 = p + v2*r;

%% Mittelpunkt

m = tp1+(tp2-p);

%% Rest

alp12 = xwinkelpm([tp1' tp2']',m); % winkel der tang.punkte zur pos x-Achse

alp = linspace(alp12(1),alp12(2),n);

xk = r * cos(alp) +m(1);
yk = r * sin(alp) +m(2);

p1rp2 = [xk' yk'];



%% visual

% clf, hold on
% plot(m(1),m(2),'o','color','k')
% plot(p(1),p(2),'o','color','r')
% plot(p1(1),p1(2),'o','color','b')
% plot(p2(1),p2(2),'o','color','b')
% 
% plot(tp1(1),tp1(2),'o','color','g')
% plot(tp2(1),tp2(2),'o','color','g')
% 
% plot(xk,yk,'o')
% 
% axis equal
end