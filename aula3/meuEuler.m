function [t, w] = meuEuler(a,b, alfa, N)
    % 1- Construindo a malha
    h = (b-a)/N;
    t = a:h:b; % Criando um vetor t, com passo h, no intervalo [a,b]

    %  ------ Encontra a solução numérica do PVI ----------
    %  y' = f(t,y), a <= t <= b, y(a)= alfta
    % usando o método de Euler

    % Declaração da função
    f = @(t,y) t-y^(2) + 1;

    %for i=1: N+1
    %    t(i) = a+(i-1)*h;
    %end
    
    % Condição inicial
    w(1) = alfa;

    %Método de Euler
    for i=1: N 
        w(i+1) = w(i) + h*f(t(i), w(i))
    end


end