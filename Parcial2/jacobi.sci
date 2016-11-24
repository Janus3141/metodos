function x = jacobi(A,b,M,del)
    n = size(A,1)
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
endfunction


//Ej 11
I = [10,1,2,3,4; 1,9,-1,2,-3; 2,-1,7,3,-5; 3,2,3,12,-1; 4,-3,-5,-1,15]
j = [12;-27;14;-17;12]
