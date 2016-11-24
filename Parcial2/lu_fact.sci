function [low,upp] = lu_fact(A,n,m)
    low = eye(n,n)
    for i = 1:(n-1)
        for k = (i+1):n
            razon = A(k,i) / A(i,i)
            low(k,i) = razon
            A(k,:) = A(k,:) - A(i,:)*razon
        end
    end
    upp = A
endfunction
