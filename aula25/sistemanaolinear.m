function solucao=sistemanaolinear(x0)        
    F=@(x) [x(1)^2+x(2)^2-1;x(1)-x(2)];
    solucao = fsolve(F,x0);
end