function endcap(A,c)

    for i = 1:3:size(A,2)
    
        fill3(A(:,i),A(:,i+1),A(:,i+2),c)
    end    
end