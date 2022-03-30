function unterbau(xvschieb,yvschieb,alpha)


C = rgb(236,236,236);


%[x,y] = Kreise(r,x,y)


%% Vom Boden nach oben:

r = 0.5;
n = 30;

[X,Y,Z] = cylinder(r,n);

X = X(1,:);
Y = Y(1,:);
%Z wird manuell gesetzt (h)
h = 7;


% Kreise
fill3(verschieb(X,xvschieb),verschieb(Y,yvschieb),zeros(size(X)),C) %unten
fill3(verschieb(X,xvschieb),verschieb(Y,yvschieb),ones(size(X)).*h,C) %oben



%% viereck aus x,y,z


% index erstellen:
idx_z = [1 1 2 2];

for u = 1:length(X)-1    

    idx_xy = [u u+1 u+1 u];    
    fill3(verschieb(X(idx_xy),xvschieb),verschieb(Y(idx_xy),yvschieb),[0 0 h h],C)
end

%% Horizontal

Z1 = ones(size(X))*-5;
Z2 = ones(size(X))*5;


% Rotieren
X1r = X*cosd(alpha) - Z1*sind(alpha); % für Kreise
X2r = X*cosd(alpha) - Z2*sind(alpha);
Z1r = X*sind(alpha) + Z1*cosd(alpha);
Z2r = X*sind(alpha) + Z2*cosd(alpha);
Yr = Y;


Yh = Y+ones(size(Y)).*7;

for u = 1:length(X)-1    % Zylinder

    idx_xy = [u u+1 u+1 u];   

    XX = X(idx_xy);
    ZZ = [-5 -5 5 5];               % hier wird erst das Rechteck erstellt
    YY = Yh(idx_xy);                % und dann rotert ... lieber andersrum?
                                        % (rotierte werte von oben nehmen)
    
    % Rotieren
    XXr = XX*cosd(alpha) - ZZ*sind(alpha);
    ZZr = XX*sind(alpha) + ZZ*cosd(alpha);
   %ZZr = ZZr

    fill3(verschieb(XXr,xvschieb),verschieb(ZZr,yvschieb),YY,rgb(236,236,236))
end


% Kreise

fill3(verschieb(X1r,xvschieb),verschieb(Z1r,yvschieb),Yh,rgb(236,236,236)) %unten
fill3(verschieb(X2r,xvschieb),verschieb(Z2r,yvschieb),Yh,rgb(236,236,236)) %oben
end