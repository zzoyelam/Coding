[x,y] = meshgrid(-1.5:0.2:2,-1.5:0.2:2);
u = -x + y + x.*y;
v = -x + y.^2;

figure
quiver(x,y,u,v)
startx = -1:0.2:2;
starty = -1:0.2:2 ;
streamline(x,y,u,v,startx,starty)