
 function dydx = f(x,y,region,re,a) % equations being solved
dydx = zeros(3,1);
dydx(1) = y(2);
dydx(2) = y(3);
switch region
    case 1    % x in [-1 0]
        dydx(1) = y(2);
        dydx(2) = y(3);
        dydx(3) = 2*a*re*y(1)*y(2)-4*0.0873^2*y(2);
    case 2    % x in [0 1]
        dydx(1) = y(2);
        dydx(2) = y(3);
        dydx(3) = 2*a*re*y(1).*y(2)-4*0.0873^2*y(2);
end
end
%-------------------------------------------
