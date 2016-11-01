//deff('y = bigf(x)', 'y = [sum(x) - 3; sum(x.^2) - 5; exp(x(1)) + x(1)*x(2) - x(1)*x(3) - //1]')
//X = [0.1; 1.2; 2.5]

deff('y = presion(x)', 'y = [x(1) * exp(x(2)) + x(3) - 10; x(1) * exp(x(2)*2) + 2*x(3) - 12; x(1) * exp(x(2)*3) + 3*x(3) - 15]')

function y = newton2(F, X, M, del, eps)
    for k = 1:M
        T = F(X)
        if norm(T) < eps then break
        end
        J = numderivative(F, X)
        H = inv(J)*T
        X = X - H
        if norm(H) < del then break
        end
    end
    y = X
endfunction
