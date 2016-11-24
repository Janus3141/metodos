function B = invupper(A)
    n = size(A,1)
    B = zeros(n,n)
    for j = n:-1:1
        for k = n:-1:(j+1)
            B(j,k) = (-1) * A(j,:) * B(:,k) / A(j,j)
        end
        B(j,j) = 1 / A(j,j)
    end
endfunction


function B = invlower(A)
    n = size(A,1)
    B = zeros(n,n)
    for j = 1:n
        for k = 1:(n-1)
            B(j,k) = (-1) * A(j,:) * B(:,k) / A(j,j)
        end
        B(j,j) = 1 / A(j,j)
    end
endfunction
