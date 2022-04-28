function A_ = spglV(A)
% verschieben weil Spiegelverkehrt
V = 3.15;

A_ = A;
A_(:,1:3:size(A,2)) = A(:,1:3:size(A,2))-V;
end