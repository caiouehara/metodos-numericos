function [w] = meuRungeKutta4_3(N)
    %  ------ Encontra a solucao numerica do PVI ----------
    %  y' = f(t,y), a <= t <= b, y(a)= alfa
    % usando o método RK-4

    % Declarando parametros da funcao
    n1 = -0.0023; % Taxa de natalidade n1 (Coreia)
    n2 = 0.0378; % Taxa de natalidade n2 (Níger)
    n3 = 0.0153; % Taxa de natalidade n3 (Sudão do Sul)
    n4 = 0.0038; % Taxa de natalidade n4 (EUA)

    gama = 0.12; % Taxa de depreciacao do capital
    a = 0;
    b = 60;
    s = 0.1; % Taxa de poupanca

    % Declaracao da funcao
    f1 = @(t,k) s * (k*1/2) - (n1 + gama)*k;
    f2 = @(t,k) s * (k*1/2) - (n2 + gama)*k;
    f3 = @(t,k) s * (k*1/2) - (n3 + gama)*k;
    f4 = @(t,k) s * (k*1/2) - (n4 + gama)*k;
    
    % Expandindo as funcoes em celulas
    f = cell(4,1);
    f{1} = f1;
    f{2} = f2;
    f{3} = f3;
    f{4} = f4;

    % 1- Construindo a malha
    h = (b-a)/N;
    t = a:h:b; % Criando um vetor t, com passo h, no intervalo [a,b]

    % Expandindo os vetores de solucoes numericas em uma matriz
    w = zeros(4, N+1);

    % 2 - Condicao inicial
    w(1, 1) = 0.5;
    w(2, 1) = 0.5;
    w(3, 1) = 0.5;
    w(4, 1) = 0.5;

    % 3 - Aplicacao do RK4

    for j=1: 4 % Percorrendo a celula de funcoes
        for i=1: N 
            % Calculando os Ks
            k1 = f{j}(t(i), w(j,i));
            k2 = f{j}(t(i)+h/2, w(j,i)+h/2*k1);
            k3 = f{j}(t(i)+h/2, w(j,i)+h/2*k2);
            k4 = f{j}(t(i)+h, w(j,i)+h*k3);
            
            k = (k1+2*k2+2*k3+k4)/6;
            
            % Calculando o proximo ponto
            w(j, i+1) = w(j, i) + h* k;
        end
    end

    % Imprimindo o plot
    hold on;
    plot(t, w(1, :), 'r-');
    plot(t, w(2, :), 'g-');
    plot(t, w(3, :), 'b-');
    plot(t, w(4, :), 'c-');
    grid on
    hold off;

end
