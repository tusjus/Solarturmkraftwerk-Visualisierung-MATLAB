function [X,Y,Z] = prisma(A,B,c)

X = zeros(4,size(A,1));
Y = X; Z = X;

for j = 1:size(A,1)-1
    
        Wj = [A(j,:)
              A(j+1,:)
              B(j+1,:)
              B(j,:)];

        fill3(Wj(:,1),Wj(:,2),Wj(:,3),c,'linestyle','none')
        X(:,j) = Wj(:,1);
        Y(:,j) = Wj(:,2);
        Z(:,j) = Wj(:,3);
end
    
Wend = [A(end,:)
        A(1,:)
        B(1,:)
        B(end,:)];
fill3(Wend(:,1),Wend(:,2),Wend(:,3),c,'linestyle','none')

X(:,end) = Wend(:,1);
Y(:,end) = Wend(:,2);
Z(:,end) = Wend(:,3);
end


