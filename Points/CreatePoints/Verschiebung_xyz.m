load Punkte.mat


Breite = 2.75;
Luecke = 0.4;

xOffset = Breite + Luecke;
yOffset = 0;
zOffset = '?';

       Mirror1_.x =        Mirror1.x - xOffset;
        Pads21_.x =         Pads21.x - xOffset;
    Pads21_.Cap.x =     Pads21.Cap.x - xOffset;
     Bracket21_.x =      Bracket21.x - xOffset;
 Bracket21_.Cap.x =  Bracket21.Cap.x - xOffset;
       SupArm3_.x =        SupArm3.x - xOffset;
   SupArm3_.Cap.x =    SupArm3.Cap.x - xOffset;
    Diagonals6_.x =     Diagonals6.x - xOffset;
Diagonals6_.Cap.x = Diagonals6.Cap.x - xOffset;
   TorqueTube2_.x =    -TorqueTube2.x; 



