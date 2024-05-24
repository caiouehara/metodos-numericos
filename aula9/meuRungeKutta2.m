function [t, w, erro] = meuRungeKutta2(N)
    %  ------ Encontra a solução numérica do PVI ----------
    %  y' = f(t,y), a <= t <= b, y(a)= alfta
    % usando o método de Euler

    %% Exemplo 1
    f1 = @(t,y) y-t^(2)+1;
    y1 = @(t) (t+1)^2-0.5*exp(t);
    a=0; b=2; alfa=0.5;

    %% Exemplo 2
    f2 = @(t,y) 2*y/t + t^2*exp(t);
    y2 = @(t) t^2*(exp(t)-exp(1));
    %a=1; b=2; alfa=0; 
    %% 
    
    % 1- Construindo a malha
    h = (b-a)/N;
    t = a:h:b; % Criando um vetor t, com passo h, no intervalo [a,b]
    
    % 2 - Condição inicial
    w=zeros(1, N+1);
    w(1) = alfa;

    yvet=zeros(1, N+1);
    yvet(1) = y1(a);

    % 3 - Aplicação de Runge Kutta de 2 ordem
    for i=1: N 
        %w(i+1) = w(i) + h*f2(t(i)+h/2, w(i)+ h/2 * f2(t(i),w(i)));
        k1 = f1(t(i),w(i));
        k2 = f1(t(i)+h/2,w(i)+h/2*k1);
        w(i+1) = w(i) + h*k2;
        yvet(i+1) = y1(t(i+1));
    end

    %Imprimindo o plot
    plot(t,w, 'ro'); hold on; fplot(y1, [a,b], 'b-'); hold off;

    % 4 - Cálculo erro absoluto
    erro = max(abs(w-yvet))

end