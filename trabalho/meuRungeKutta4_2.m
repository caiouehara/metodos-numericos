function [w] = meuRungeKutta4_2(N)
    %  ------ Encontra a solucao numerica do PVI ----------
    %  y' = f(t,y), a <= t <= b, y(a)= alfa
    % usando o método RK-4

    % Declarando parametros da funcao
    s1 = 0.1; % Taxa de poupanca s1
    s2 = 0.3; % Taxa de poupanca s2
    s3 = 0.5; % Taxa de poupanca s3

    n = 0.0126; % Taxa de crescimento populacional
    gama = 0.12; % Taxa de depreciacao do capital
    a = 0;
    b = 60;

    % Declaracao da funcao
    f1 = @(t,k) s1 * (k*1/2) - (n + gama)*k;
    f2 = @(t,k) s2 * (k*1/2) - (n + gama)*k;
    f3 = @(t,k) s3 * (k*1/2) - (n + gama)*k;
    
    % Expandindo as funcoes em celulas
    f = cell(3,1);
    f{1} = f1;
    f{2} = f2;
    f{3} = f3;

    % 1- Construindo a malha
    h = (b-a)/N;
    t = a:h:b; % Criando um vetor t, com passo h, no intervalo [a,b]

    % Expandindo os vetores de solucoes numericas em uma matriz
    w = zeros(3, N+1);

    % 2 - Condicao inicial
    w(1, 1) = 0.5;
    w(2, 1) = 0.5;
    w(3, 1) = 0.5;

    % 3 - Aplicacao do RK4

    for j=1: 3 % Percorrendo a celula de funções
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
    set(gca, 'YScale', 'log') % Configurando escala Log no eixo Y
    plot(t, w(1, :), 'r-');
    plot(t, w(2, :), 'g-');
    plot(t, w(3, :), 'b-');
    grid on
    hold off;

end
