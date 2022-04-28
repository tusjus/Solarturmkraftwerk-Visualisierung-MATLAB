laenge = 2.7;
r = 0.11;
wandstaerke = 0.005;
r2 = r + wandstaerke;
r = [r r2]';

n = 40;
alpha = linspace(0,360-360/n,n);

% Grundprofiel
ztt = r * cosd(alpha); % z und nicht x, damit es richtig gedreht ist
ytt = r * sind(alpha);

xtt = zeros(size(ytt));

% verscheiben
ztt = ztt -0.4 ;

for i = 1:2
prisma([xtt(i,:)' ytt(i,:)' ztt(i,:)'],[xtt(i,:)'+laenge ytt(i,:)' ztt(i,:)'],'r');
end


% Prisma(innenring,ausenring) für ringscheibe
prisma([xtt(1,:)' ytt(1,:)' ztt(1,:)'],[xtt(1,:)' ytt(2,:)' ztt(2,:)'],'r');
xtt(2,:) = xtt(2,:)+laenge;
prisma([xtt(2,:)' ytt(1,:)' ztt(1,:)'],[xtt(2,:)' ytt(2,:)' ztt(2,:)'],'r');


%% Punkte erzeugen:

TorqueTubeO2 = [xtt(1,:)',ytt(1,:)',ztt(1,:)',xtt(1,:)',ytt(2,:)',ztt(2,:)'];
TorqueTubeU2 = [xtt(2,:)',ytt(1,:)',ztt(1,:)',xtt(2,:)',ytt(2,:)',ztt(2,:)'];
TorqueTubeRingO2 = [xtt(1,:)',ytt(1,:)',ztt(1,:)',xtt(2,:)',ytt(1,:)',ztt(1,:)'];
TorqueTubeRingU2 = [xtt(1,:)',ytt(2,:)',ztt(2,:)',xtt(2,:)',ytt(2,:)',ztt(2,:)'];

% entpacken(TorqueTubeO2,TorqueTubeU2,'g')
% entpacken(TorqueTubeRingO2,TorqueTubeRingU2,'b')



