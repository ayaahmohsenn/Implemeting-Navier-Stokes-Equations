function dy = f(x,y)
dy(1) = y(2);
dy(2) = y(3);
dy(3) = -y(1).*y(3)+(y(2).^2)-1;
 end