function entpacken(O,U,c)

    for i = 1:3:size(O,2)
    
        prisma(O(:,i:i+2),U(:,i:i+2),c)
    end
end