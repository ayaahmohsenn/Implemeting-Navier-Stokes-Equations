function res = OdeBC(ya,yb)
res = [ya(1)
    ya(2)
    yb(2)-1
    ];
end