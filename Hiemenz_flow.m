function Hiemenz_flow
options=bvpset('stats','off','RelTol',1e-6);
solinit=bvpinit(linspace(0,3,100),[0,0,1]);
sol=bvp4c(@f, @OdeBC, solinit, options);
figure
plot(sol.y(2,:),sol.x);
title('Hiemenz flow - two-dimensional stagnation-point flow')
xlabel('u/a*x') 
ylabel('alpha*y') 
end
  
