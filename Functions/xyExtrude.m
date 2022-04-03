function xyExtrude(x,y,h,c)
% fill3 from x and y (extrude shape into Z direction)

    for u = 1:length(x)-1    
    
        idx_xy = [u u+1 u+1 u];    
        fill3(x(idx_xy),y(idx_xy),[0 0 h h],c,'LineStyle','none')
    end

    %vv closing the shape 
    fill3([x(1) x(end) x(end) x(1)],[y(1) y(end) y(end) y(1)],[0 0 h h],c,'LineStyle','none') % closing the shape

% Boden, Deckel
fill3(x,y,zeros(length(x)),c,'LineStyle','none')
fill3(x,y,onsz(x,h),c,'LineStyle','none')
end

