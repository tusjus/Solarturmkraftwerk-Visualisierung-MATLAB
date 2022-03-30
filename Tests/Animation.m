


for i = -80:80

    clf, hold on, axis equal, axis([-8 8 -8 8 0 15]), grid on, view(3)
    unterbau(0,0,i*2)
    %obendrauf(0,0,i*2,i)
    pause(0.01)
end