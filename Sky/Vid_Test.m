
framerate = 30;
tfinal = 30;
nframes = round(framerate*tfinal);
filename = 'Videos/Testvideo2.mp4';
v = VideoWriter(filename,'MPEG-4');
v.FrameRate = framerate;
v.Quality = 100;


videosize = [1920 1080];
figure('Position',[0 0 videosize])
set(gca,'Position',[.1 .1 .8 .8]);

t = linspace(0,tfinal,nframes);



open(v)

eleM = 0.1;


clf, hold on, grid on
axis([-1000 1000 -1000 1000 0 1000])
%axis equal
view([4 4 4])


for i = 1:nframes
 
    
    filename = ['Bilder/Sonnen2bild90' num2str(eleM*10) '.png'];
    Himmel = Himmel2(filename,RG,0,0);
    
    eleM = eleM+0.1;


    frame = getframe(gcf);
    writeVideo(v,frame);
    delete(Himmel)

end

close(v)



% for eleM = 0.1:0.1:20
% 
%     
%     filename = ['Sonnenbild90' num2str(eleM*10) '.png'];
%     Himmel = Himmel2(filename,RG,0,0);
%     pause(1)
%     delete(Himmel)
% 
% 
% end