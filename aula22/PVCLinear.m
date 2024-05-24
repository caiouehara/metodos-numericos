function PVCLinear(N)

%Resolve um PVC do tipo y'' = p(x)y' + q(x)y + r(x)
% a<=x<=b, y(a)=alfa, y(b)=beta
%Dados de entrada

a=0;
b=1;
alfa=0;
beta=2;
p= @(x) 0;
q= @(x) 4;
r= @(x) -4*x;

%Malha
h=(b-a)/N;
x=a:h:b;

%inicializar matriz e vetor com zeros
mat=zeros(N-1,N-1);
vet=zeros(N-1,1);

%preenchendo da matriz e do vetor
%linha 1
mat(1,1)=-2-(h^2)*q(x(2));
mat(1,2)=1-(h/2)*p(x(2));
vet(1)=(h^2)*r(x(2))-(1+(h/2))*p(x(2))*alfa;

%linha 2 até N-2
for i=2: N-2
    mat(i,i-1)=1-(h^2)*p(x(i+1));
    mat(i,i)=-2-(h^2)*q(x(i+1));  
    mat(i,i+1)=1-(h/2)*p(x(i+1));
    vet(i)=(h^2)*r(x(i+1));
end

%linha 2 até N-1
mat(N-1,N-2)=-1-(h^2)*p(x(N));
mat(N-1,N-1)=-2-2*(h^2)*q(x(N));
vet(N-1)=(h^2)*r(x(N))-(1-(h/2))*p(x((N)))*beta;

mat
vet

%resolve o sistema linear
w_aux=linsolve(mat,vet);

%constroi o vetor w das soluções
w(1)=alfa;
w(N+1)=beta;
for i=2:N
    w(i)=w_aux(i-1);
end

%imprime saida
x
w