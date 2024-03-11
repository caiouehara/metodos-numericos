import funcoes as mf
import math

def erro_absoluto(sol_exata, sol_numerica):
    N = len(sol_exata)
    erro_abs = []
    for i in range(N):
        erro_abs.append(abs(sol_exata[i] - sol_numerica[i]))
    return erro_abs


def f(t, y):
    return  ((2*y)/t) + (t**(2)) * (math.exp(t))
    
t, w_vetor = mf.euler(f, 0, 0.25, 1, 2)
print(w_vetor)

def f_exato(t):
    return t**2 * (math.exp(t) - math.exp(1))
    
sol_exata = []
for i in range(len(t)):
    sol_exata.append(f_exato(t[i]))

erro_abs = erro_absoluto(sol_exata, w_vetor)

print(erro_abs)