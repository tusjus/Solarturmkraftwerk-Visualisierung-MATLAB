% clf, hold on
% patch(    Mirror1.x,    Mirror1.y,    Mirror1.z,rgb(235,235,235),'linestyle','none');
% 
% patch(     Pads21.x,     Pads21.y,     Pads21.z,rgb(200,20 ,20 ),'linestyle','none');
% patch( Pads21.Cap.x, Pads21.Cap.y, Pads21.Cap.z,rgb(200,20 ,20 ),'linestyle','none');
% 
% patch(  Bracket21.x,  Bracket21.y,  Bracket21.z,rgb(200,200,20 ),'linestyle','none');
% patch(  Bracket21.Cap.x,  Bracket21.Cap.y,  Bracket21.Cap.z,rgb(200,200,20 ),'linestyle','none');
% 
% patch(    SupArm3.x,    SupArm3.y,    SupArm3.z,rgb(200,200,200),'linestyle','none');
% patch(SupArm3.Cap.x,SupArm3.Cap.y,SupArm3.Cap.z,rgb(200,200,200),'linestyle','none');
% 
% patch( Diagonals6.x, Diagonals6.y, Diagonals6.z,rgb(20 ,200,200),'linestyle','none');
% patch( Diagonals6.Cap.x, Diagonals6.Cap.y, Diagonals6.Cap.z,rgb(20 ,200,200),'linestyle','none');
% 
% patch(TorqueTube2.x,TorqueTube2.y,TorqueTube2.z,rgb(200,20 ,200),'linestyle','none');
% 
% fill3(Mittelding3.x,Mittelding3.y,Mittelding3.z,rgb(20, 236, 35),'linestyle','none');
% 
% 
% patch(    Mirror1_.x,    Mirror1.y,    Mirror1_.z,rgb(235,235,235),'linestyle','none');
% 
% patch(     Pads21_.x,     Pads21.y,     Pads21_.z,rgb(200,20 ,20 ),'linestyle','none');
% patch( Pads21_.Cap.x, Pads21.Cap.y, Pads21_.Cap.z,rgb(200,20 ,20 ),'linestyle','none');
% 
% patch(  Bracket21_.x,  Bracket21.y,  Bracket21_.z,rgb(200,200,20 ),'linestyle','none');
% patch(  Bracket21_.Cap.x,  Bracket21.Cap.y,  Bracket21_.Cap.z,rgb(200,200,20 ),'linestyle','none');
% 
% patch(    SupArm3_.x,    SupArm3.y,    SupArm3_.z,rgb(200,200,200),'linestyle','none');
% patch(SupArm3_.Cap.x,SupArm3.Cap.y,SupArm3_.Cap.z,rgb(200,200,200),'linestyle','none');
% 
% patch( Diagonals6_.x, Diagonals6.y, Diagonals6_.z,rgb(20 ,200,200),'linestyle','none');
% patch( Diagonals6_.Cap.x, Diagonals6.Cap.y, Diagonals6_.Cap.z,rgb(20 ,200,200),'linestyle','none');
% 
% patch(TorqueTube2_.x,TorqueTube2.y,TorqueTube2_.z,rgb(200,20 ,200),'linestyle','none');
% 
% fill3(Mittelding3_.x,Mittelding3.y,Mittelding3_.z,rgb(20, 236, 35),'linestyle','none');
% axis equal

load Punkte_s.mat


%patch(    Mirror1_s.x,    Mirror1_s.y,    Mirror1_s.z,rgb(235,235,235),'linestyle','none');
patch(    Mirror1top_s.x,    Mirror1top_s.y,    Mirror1top_s.z,rgb(237,241,240),'linestyle','none');
patch(    Mirror1bot_s.x,    Mirror1bot_s.y,    Mirror1bot_s.z,rgb(235,235,235),'linestyle','none');

patch(     Pads21_s.x,     Pads21_s.y,     Pads21_s.z,rgb(200,200,200),'linestyle','none');
patch( Pads21_s.Cap.x, Pads21_s.Cap.y, Pads21_s.Cap.z,rgb(200,200,200),'linestyle','none');

patch(  Bracket21_s.x,  Bracket21_s.y,  Bracket21_s.z,rgb(200,200,200),'linestyle','none');
patch(  Bracket21_s.Cap.x,  Bracket21_s.Cap.y,  Bracket21_s.Cap.z,rgb(200,200,200),'linestyle','none');

patch(    SupArm3_s.x,    SupArm3_s.y,    SupArm3_s.z,rgb(200,200,200),'linestyle','none');
patch(SupArm3_s.Cap.x,SupArm3_s.Cap.y,SupArm3_s.Cap.z,rgb(200,200,200),'linestyle','none');

patch( Diagonals6_s.x, Diagonals6_s.y, Diagonals6_s.z,rgb(200 ,200,200),'linestyle','none');
patch( Diagonals6_s.Cap.x, Diagonals6_s.Cap.y, Diagonals6_s.Cap.z,rgb(200,200,200),'linestyle','none');

patch(TorqueTube2_s.x,TorqueTube2_s.y,TorqueTube2_s.z,rgb(140,144 ,147),'linestyle','none');

fill3(Mittelding3_s.x,Mittelding3_s.y,Mittelding3_s.z,rgb(100, 100, 100),'linestyle','none');

patch(Formteil_s.x,Formteil_s.y,Formteil_s.z,rgb(240,240,250),'linestyle','none');
patch(Ring_s.x,Ring_s.y,Ring_s.z,rgb( 50, 10,  10),'linestyle','none');
patch(Mast_s.x,Mast_s.y,Mast_s.z,rgb(140,144 ,147),'linestyle','none');


axis equal

