function x = jacobi(A,b,n,M,del)
	for i = 1:n
		x(i) = 0
    end
	for i = 1:M
        for j = 1:n
            y(j) = b(j) / A(j,j)
            for k = 1:n
                if j == k then continue
                else y(j) = y(j) - A(j,k)*x(k)/A(j,j)
                end
            end
        end
        if norm(x - y) < del then break
        else x = y
        end
    end
    printf("M = %d\n", i)
endfunction


B = [7, -6; -8, 9]; c = [3; -4]
