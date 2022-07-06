re = [50 100 118 209 581];   %raynold nambers
a = - 0.0872664626;          %convergant angle
figure
for j = 1:5
xc = 0;
xmesh = [-1:0.001:-0.001 xc xc 0.001:0.001:1];
yinit = [0; 0;0];
sol = bvpinit(xmesh,yinit);
sol = bvp5c(@(x,y,r) f(x,y,r,re(j),a), @bc, sol);
computed = 1/sol.y(1,end);
plot(sol.x,sol.y(1,:))
title('Flow in convergent channels with 5 degrees')
xlabel({'x', 'phi/divergence angle'})
ylabel('u/u-max')
hold on
end
legend({'re=50','re=100','re=118','re=209','re=581'},'Location','southwest')
line([-1 1], [0 0], 'Color', 'k')   %x-axis
