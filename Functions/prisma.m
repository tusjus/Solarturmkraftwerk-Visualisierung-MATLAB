function prisma(A,B,c)


    for j = 1:size(A,1)-1
    
        Wj = [A(j,:)
              A(j+1,:)
              B(j+1,:)
              B(j,:)];
    
        fill3(Wj(:,1),Wj(:,2),Wj(:,3),c,'linestyle','none')
    end
    
    Wend = [A(end,:)
            A(1,:)
            B(1,:)
            B(end,:)];
    fill3(Wend(:,1),Wend(:,2),Wend(:,3),c,'linestyle','none')
end