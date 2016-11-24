function y = cholesky(A, n)
    for i = 1:n
        A(i,i) = sqrt(A(i,i))
        lii = A(i,i)
        for j = (i+1):n
            A(j, i) = A(j, i)/lii
            A(i, j) = A(j, i)
            for k = (i+1):j
                A(j, k) = A(j, k) - A(i, j)*A(i, k)
                A(k, j) = A(j, k)
            end
        end
    end
    y = A
endfunction


test = [4, 12,-16;
       12, 37,-43;
      -16,-43, 98]

test2 = [25, 15, -5;
         15, 18,  0;
         -5,  0, 11]

//Ejercicio prac 3
mat3 = [16, -12, 8, -16;
        -12, 18, -6,  9;
         8,  -6,  5, -10;
        -16, 9, -10, 46]
