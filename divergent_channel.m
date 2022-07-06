re = [60 117 436 873];   %raynold nambers
a = 0.0872664626;        %divergent angle
figure
for j = 1:4
xc = 0;
xmesh = [-1:0.001:-0.001 xc xc 0.001:0.001:1];
yinit = [0; 0;0];
sol = bvpinit(xmesh,yinit);
sol = bvp5c(@(x,y,r) f(x,y,r,re(j),a), @bc, sol);
computed = 1/sol.y(1,end);
x = 0:1;
plot(sol.x,sol.y(1,:))
title('Flow in divergent channels with 5 degrees')
xlabel({'x', 'phi/divergence angle'})
ylabel('u/u-max')
hold on
end
legend({'re=60','re=117','re=436','re=873'},'Location','southwest')
line([-1 1], [0 0], 'Color', 'k')   %x-axis

