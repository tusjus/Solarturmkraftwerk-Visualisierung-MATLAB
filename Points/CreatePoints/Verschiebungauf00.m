% Mittelpunkt rohr = z=0
% Da spiegelverkehrt, noch ins negative schieben, aber nicht spiegeln, also
% -... NICHT *(-1)!

% Rohr trotzdem spiegeln.


% XPunkt = XPunkt - (spiegelXbreite + Spiegelabstand)

Breite = 2.75;
Luecke = 0.4;

add1 = Breite + Luecke;

MirrorO1_ = spglV(MirrorO1);
MirrorU1_ = MirrorU1;
MirrorO1_(:,1) = MirrorO1(:,1)-add1;
MirrorU1_(:,1) = MirrorU1(:,1)-add1;
entpacken(MirrorO1_,MirrorU1_,'g')
endcap(MirrorO1_,[0.5 0.1 0.4])
endcap(MirrorU1_,[0.7 0.7 0.7])

PadsO21_ = spglV(PadsO21);
PadsU21_ = spglV(PadsU21);
entpacken(PadsO21_,PadsU21_,'b')
endcap(PadsU21_,'g')
endcap(PadsU21,'g')

BracketO21_ = spglV(BracketO21);
BracketU21_ = spglV(BracketU21);
entpacken(BracketO21_,BracketU21_,[0.5 0.1 0.4])
endcap(BracketO21_,'g')
endcap(BracketU21_,'g')

SupArmO3_ = spglV(SupArmO3);
SupArmU3_ = spglV(SupArmU3);
entpacken(SupArmO3_,SupArmU3_,[0.5 0.1 0.4])
endcap(SupArmO3_,'g')
endcap(SupArmU3_,'g')

DiagonalsO6_ = spglV(DiagonalsO6);
DiagonalsU6_ = spglV(DiagonalsU6);
entpacken(DiagonalsO6_,DiagonalsU6_,[0.2 0.5 0.2])
endcap(DiagonalsO6_,'g')
endcap(DiagonalsU6_,'g')






