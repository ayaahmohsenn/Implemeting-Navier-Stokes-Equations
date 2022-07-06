%% 1D Steady Flow Simulation between two plates
clear;
clc;
u1=0;
u4=40;
L=0.04;
nx=100;
delx=L/(nx-1);
mu=2e-4;
dpdx=100;
%% Solver
D=(delx*dpdx)/mu;
y=0:delx:L;
dist=y';
p(1,1)=1;
p(1,2:nx)=0;
q(1,nx)=1;
q(1,1:nx-1)=0;
r=toeplitz([2 -1 zeros(1,nx-4)]);
s(1,1)=-1;
s(2:nx-2,1)=0;
t(nx-2,1)=-1;
t(1:nx-3,1)=0;
A(1,:)=p;
A(nx,:)=q;
A(2:nx-1,1)=s;
A(2:nx-1,nx)=t;
A(2:nx-1,2:nx-1)=r;
B(1,1)=u1;
B(nx,1)=u4;
B(2:nx-1,1)=D;
V=inv(A)*B;

%%
plot(V,dist);
streamline(V,dist)
xlabel('Velocity of Flowing Fluid');
ylabel('Distance between the plates');
title(['Velocity Profile of Flowing Fluid between Two Parallel Plates']);

grid on;