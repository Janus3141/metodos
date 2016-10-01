deff('y = bigf(x)', 'y = [sum(x); sum(x.^2); exp(x(1)) + x(1)*x(2) - x(1)*x(3)]')
X = [0.1; 1.2; 2.5]
for k = 1:10
    F = bigf(X)
    J = numderivative(bigf, X)
    f por inversa de j
end
