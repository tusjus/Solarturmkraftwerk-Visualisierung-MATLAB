function [A,map] = Gradient_test(ele,RGB,nFarben)

v = nonLinspace( 0.35, 1, 900, 'log10' );
A = repmat(v',1,3600);
A = 1-A; %invertieren
%A = flip(A); % auf den Kopf stellen
% von 1-300 statt 0-1; für Stauchung
%        A = round(A*300);

c0 = rgb(10, 40, 150); % Blau(Himmel)
c1 = RGB(uint16(ele*10),:); % Sonnenfarbe, RGB ist RGB(ele)!

%nFarben = 256;
r = linspace(c0(1),c1(1),nFarben);
g = linspace(c0(2),c1(2),nFarben);
b = linspace(c0(3),c1(3),nFarben);

map = [r',g',b'];
end


% imwrite(A,map,'Gradient.png')
% 
% clf, hold on
% 
% IMG = imread('Gradient.png');
% Himmel2('Gradient.png',R,0,0)
% 
% colormap(map)

