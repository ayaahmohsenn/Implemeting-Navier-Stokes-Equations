L = 20;
y = linspace(0,L,30);
t = [linspace(0,0.05,30), linspace(0.5,5,0.2)];
m = 0;
sol = pdepe(m,@stoke1stprob,@icfun,@bcfunc,y,t);
plot (sol);