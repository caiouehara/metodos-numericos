function [w] = meuRungeKutta4(N)
    %  ------ Encontra a solucao numerica do PVI ----------
    %  y' = f(t,y), a <= t <= b, y(a)= alfa
    % usando o metodo RK-4

    % Declarando parametros da funcao
    s = 0.1; % Taxa de poupanca
    n = 0.0126; % Taxa de crescimento populacional
    gama = 0.12; % Taxa de depreciacao do capital
    a = 0;
    b = 60;

    % Declaracao da funcao
    f = @(t,k) s * (k*1/2) - (n + gama)*k;

    % 1- Construindo a malha
    h = (b-a)/N;
    t = a:h:b; % Criando um vetor t, com passo h, no intervalo [a,b]
    w=zeros(1, N+1);

    % 2 - Condicao inicial
    w(1) = 0.5;

    % 3 - Aplicacao do RK4
    for i=1: N 
        % Calculando os Ks
        k1 = f(t(i), w(i));
        k2 = f(t(i)+h/2, w(i)+h/2*k1);
        k3 = f(t(i)+h/2, w(i)+h/2*k2);
        k4 = f(t(i)+h, w(i)+h*k3);
        
        k = (k1+2*k2+2*k3+k4)/6;
        
        % Calculando o proximo ponto
        w(i+1) = w(i) + h* k;
    end

    % Imprimindo o plot
    hold on;
    plot(t,w, 'r-');
    grid on;
    hold off;

end
