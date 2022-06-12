function [x,y,z] = Vazieler2xyz(azi,ele,R)

%% für Azi,Ele = 0,0:
%x = 0;
%y = R;
%z = 0;

%% ele durch rot um x-Achse:
%x = onsz(ele,0); 
y = R * cosd(ele');
z = R * sind(ele');

%% azi durch rot um z-Achse:
R2 = y;% Radius von Kreis um Z-achse auf dem [xele yele zele] liegen. (= abstnd zur z-achse)
x = R2 * sind(azi);
y = R2 * cosd(azi);
z = repmat(z,1,3600);
end