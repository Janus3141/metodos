function [A2,b2] = gauss(A, b, n)
    for i = 1:(n-1)
        for k = (i+1):n
            razon = A(k, i)/A(i, i)
            A(k,:) = A(k,:) - A(i,:)*razon
            b(k) = b(k) - b(i)*razon
        end
    end
    A2 = A
    b2 = b
endfunction


function [A2, b2, P] = pivotgauss(A, b, n)
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
            razon = A(P(k),i) / A(P(i),i)
            A(P(k),:) = A(P(k),:) - A(P(i),:)*razon
            b(P(k)) = b(P(k)) - b(P(i))
        end
    end
    A2 = A
    b2 = b
endfunction
