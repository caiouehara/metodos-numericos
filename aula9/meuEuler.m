function [t, w, erro] = meuEuler(a,b, alfa, N)
    %  ------ Encontra a solução numérica do PVI ----------
    %  y' = f(t,y), a <= t <= b, y(a)= alfta
    % usando o método de Euler

    % Declaração da função
    f = @(t,y) y-t^(2) + 1;

    %Solução exata
    y = @(t) (t+1)^2-0.5*exp(t);

    % 1- Construindo a malha
    h = (b-a)/N;
    t = a:h:b; % Criando um vetor t, com passo h, no intervalo [a,b]
    
    % 2 - Condição inicial
    w=zeros(1, N+1);
    w(1) = alfa;

    yvet=zeros(1, N+1);
    yvet(1) = y(a);

    % 3 - Aplicação do Método de Euler
    for i=1: N 
        w(i+1) = w(i) + h*f(t(i), w(i));
        yvet(i+1) = y(t(i+1));
    end

    %Imprimindo o plot
    plot(t,w, 'ro'); hold on; fplot(y, [a,b], 'b-'); hold off;

    % 4 - Cálculo erro absoluto
    erro = max(abs(w-yvet))

end