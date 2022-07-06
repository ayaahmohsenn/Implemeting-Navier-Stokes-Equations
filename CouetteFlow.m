clc,
clear all,
close all,

mu = 2e-4;       % Dynamic Viscosity
Ut = 40;     % Upper Plate Velocity (m/s)
H = 0.04;       % Plates Spacing (m)
dt = 0.1;       % Time Step (sec.)
dy = 0.001;     % Distance Step (m)
T = 3;          % Required Solution Time (sec.)
Bu = [0 40];    % Boundary Conditions [U(0,t) U(H,t)]
Iu = [0 40];    % Initial Conditions [U(0,0) U(H,0)]

D = mu*dt/dy^2;  % Diffusion Factor
j_max = floor(T/dt+1); % Number of time nodes
i_max = floor(H/dy+1); % Number of space nodes
%%
for t = 1:j_max
    for i = 1:i_max
       if t==1
          B = zeros(i_max,1);
          B(end) = Bu(2);
       else
          B = U{t-1};
       end
       A = zeros(i_max,i_max);
       for j = 1:i_max
           if j == 1
               A(j,j)=1;
           elseif j == i_max
               A(j,j)=1;
           else
               A(j,j-1) = -D;
               A(j,j) = 1+2*D;
               A(j,j+1) = -D;
           end
           
       end
       U{t} = inv(A)*B;
    end
end

%% Plots
figure
hold on
grid on
for j = 1:j_max
plot(U{j},0:dy:dy*(i_max-1))
end
xlabel('Velocity "U" (m)')
ylabel('Hight "Y" (m)')
title('Couette flow')