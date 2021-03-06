
[row col value] = find(im>0)

xyz = [row, col, value]

%% 

labels = num2str(xyz(:,3),2);
plot(xyz(:,1), xyz(:,2), 'o'), hold on
text(xyz(:,1)+1, xyz(:,2), labels), hold off

%% jetzt wieder meshgrid

x = 1:1:2
y = 1:1:2
[XI, YI] = meshgrid (x,y)

%% jetzt m�ssen die datan neu gemacht werden 



ZI = griddata(xyz(:,1), xyz(:,2), xyz(:,3), XI, YI, 'v4')
contour(XI, YI, ZI)


%%


[Yim Xim] = size (im);
Xim = Xim.* Factor; Yim = Yim.* Factor; 

maybe = zeros(Yim, Xim);

Nrounds = size(xyz(:,3));

for n = 1:Nrounds
    
    Ycoord=round(xyz(n,1).*Factor); Xcoord=round(xyz(n,2).*Factor);
    
    maybe(Ycoord, Xcoord)= xyz(n,3);
    
end

