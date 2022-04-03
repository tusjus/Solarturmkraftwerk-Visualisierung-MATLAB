function stahlwinkel(P1,P2,specs)

% specs: seite1,seite2,dicke,n,r,l,c
% todo: Ausrichtung 

wnkl_prof = winkelprofil(specs.seite1,specs.seite2,specs.dicke,specs.n,specs.r);
xyExtrude(wnkl_prof(:,1),wnkl_prof(:,2),specs.l,specs.c)
end