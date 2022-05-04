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

j = 1;
for i = 1:2
    idx = j:j+n-1;
    [TorqueTube2.x(:,idx),TorqueTube2.y(:,idx),TorqueTube2.z(:,idx)] ...
     = prisma([xtt(i,:)' ytt(i,:)' ztt(i,:)'],[xtt(i,:)'+laenge ytt(i,:)' ztt(i,:)'],'r');
    j = n+1;
end


% Prisma(innenring,ausenring) für ringscheibe
idxR1 = n*2+1:n*3; % Ringe an 3. und 4. Stelle in der Matrix (n-er Päckchen)
idxR2 = n*3+1:n*4;
[TorqueTube2.x(:,idxR1),TorqueTube2.y(:,idxR1),TorqueTube2.z(:,idxR1)]...
= prisma([xtt(1,:)' ytt(1,:)' ztt(1,:)'],[xtt(1,:)' ytt(2,:)' ztt(2,:)'],'r');

xtt(2,:) = xtt(2,:)+laenge;
[TorqueTube2.x(:,idxR2),TorqueTube2.y(:,idxR2),TorqueTube2.z(:,idxR2)]...
= prisma([xtt(2,:)' ytt(1,:)' ztt(1,:)'],[xtt(2,:)' ytt(2,:)' ztt(2,:)'],'r');


%% Punkte erzeugen:

TorqueTubeO2 = [xtt(1,:)',ytt(1,:)',ztt(1,:)',xtt(1,:)',ytt(2,:)',ztt(2,:)'];
TorqueTubeU2 = [xtt(2,:)',ytt(1,:)',ztt(1,:)',xtt(2,:)',ytt(2,:)',ztt(2,:)'];
TorqueTubeRingO2 = [xtt(1,:)',ytt(1,:)',ztt(1,:)',xtt(2,:)',ytt(1,:)',ztt(1,:)'];
TorqueTubeRingU2 = [xtt(1,:)',ytt(2,:)',ztt(2,:)',xtt(2,:)',ytt(2,:)',ztt(2,:)'];



% entpacken(TorqueTubeO2,TorqueTubeU2,'g')
% entpacken(TorqueTubeRingO2,TorqueTubeRingU2,'b')





