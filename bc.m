function res = bc(YL,YR) % boundary conditions
       res = [YL(1,1)               % v(0) = 0
       YR(1,1) - 1
       YR(1,1) - YL(1,2)     % Continuity of v(x) at x=1
       YR(2,1) - YL(2,2)     % Continuity of C(x) at x=1
       YR(3,1) - YL(3,2)     % Continuity of v(x) at x=1
       YR(1,end) ];       % C(lambda) = 1
end