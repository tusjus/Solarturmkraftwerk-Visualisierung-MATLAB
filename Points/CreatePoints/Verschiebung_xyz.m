load Punkte.mat


Breite = 2.75;
Luecke = 0.4;

xOffset = Breite + Luecke;
yOffset = 0;
zOffset = 0.4;

       Mirror1_.x =        Mirror1.x - xOffset;
        Pads21_.x =         Pads21.x - xOffset;
    Pads21_.Cap.x =     Pads21.Cap.x - xOffset;
     Bracket21_.x =      Bracket21.x - xOffset;
 Bracket21_.Cap.x =  Bracket21.Cap.x - xOffset;
       SupArm3_.x =        SupArm3.x - xOffset;
   SupArm3_.Cap.x =    SupArm3.Cap.x - xOffset;
    Diagonals6_.x =     Diagonals6.x - xOffset;
Diagonals6_.Cap.x = Diagonals6.Cap.x - xOffset;
   TorqueTube2_.x =   -TorqueTube2.x; 
   Mittelding3_.x =    Mittelding3.x - xOffset;

       Mirror1_.z =        Mirror1.z + zOffset;
        Pads21_.z =         Pads21.z + zOffset;
    Pads21_.Cap.z =     Pads21.Cap.z + zOffset;
     Bracket21_.z =      Bracket21.z + zOffset;
 Bracket21_.Cap.z =  Bracket21.Cap.z + zOffset;
       SupArm3_.z =        SupArm3.z + zOffset;
   SupArm3_.Cap.z =    SupArm3.Cap.z + zOffset;
    Diagonals6_.z =     Diagonals6.z + zOffset;
Diagonals6_.Cap.z = Diagonals6.Cap.z + zOffset;
   TorqueTube2_.z =    TorqueTube2.z + zOffset; 
   Mittelding3_.z =    Mittelding3.z + zOffset;

       Mirror1_.y =        Mirror1.y;
        Pads21_.y =         Pads21.y;
    Pads21_.Cap.y =     Pads21.Cap.y;
     Bracket21_.y =      Bracket21.y;
 Bracket21_.Cap.y =  Bracket21.Cap.y;
       SupArm3_.y =        SupArm3.y;
   SupArm3_.Cap.y =    SupArm3.Cap.y;
    Diagonals6_.y =     Diagonals6.y;
Diagonals6_.Cap.y = Diagonals6.Cap.y;
   TorqueTube2_.y =    TorqueTube2.y; 
   Mittelding3_.y =    Mittelding3.y;





