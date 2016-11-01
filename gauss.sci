function y = gauss(A, n)
    L = eye(n,n)
    for i = 1:(n-1) // Filas pivot
        for k = (i+1):n // Siguientes filas
            razon = A(k, i)/A(i, i)
            A(k,i) = razon
            for j = (i+1):n // Columnas
                A(k, j) = A(k, j) - razon * A(i, j)
            end
        end
    end
    y = A
endfunction


function [y, P] = pivotgauss(A, n)
    P = 1:n
    for i = 1:(n-1)

        // Selección de pivot
        s = [P(i), A(P(i),i) / max(abs(A(P(i),:)))]
        for l = i:n
            current = A(P(l),i) / max(abs(A(P(l),:)))
            if current > s(2) then
                s = [l, current]
            end
        end
        swap = P(i)
        P(i) = P(s(1))
        P(s(1)) = swap

        // Factorización
        for k = (i+1):n
            razon = A(P(k), i)/A(P(i), i)
            A(P(k), i) = razon
            for j = (i+1):n
                A(P(k), j) = A(P(k), j) - razon * A(P(i), j)
            end
        end
    end
    y = A
endfunction


function y = gauss_solver(A, n, b)
    A = gauss(A,n)
    for i = 1:n     // Lb' = b
        for j = 1:(i-1)
            b(i) = b(i) - A(i, j) * b(j)
        end
    end
    for i = n:-1:1
        for j = n:-1:(i+1)
            b(i) = b(i) - A(i, j) * b(j)
        end
        b(i) = b(i) / A(i, i)
    end
    y = b
endfunction


function y = pivotgauss_solver(A, n, b)
    [A,P] = pivotgauss(A,n)
    //printf("P = (%d,%d,%d)\n", P(1), P(2), P(3))
    for i = 1:n
        for j = 1:(i-1)
            b(P(i)) = b(P(i)) - A(P(i), j) * b(P(j))
        end
    end
    for i = n:-1:1
        for j = n:-1:(i+1)
            b(P(i)) = b(P(i)) - A(P(i), j) * b(P(j))
        end
        b(P(i)) = b(P(i)) / A(P(i), i)
    end
    y = b
endfunction

mata = [10^-12, 1; 1, 1]; veca = [1;2]

matb = [4,5,-6;2,0,-7;-5,-8,0]; vecb = [-28; 29; -64]

matc = [1,2,-1,0,0,3,1;
        1,2,2,1,-4,1,0;
        0,1,-1,3,-3,0,0;
        0,1,-1,2,1,1,0;
        0,0,1,-2,1,0,1;
        0,0,0,2,0,0,3;
        0,0,0,1,1,-1,0]
        
vecc = [-2; -2; 2; 5; -7; -8; 2]
