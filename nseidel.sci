function x = nseidel(A,b,n,M,del)
	for i = 1:n
		x(i) = b(i) / A(i,i)
        y = x
    end
	for i = 1:M
        for j = 1:n
            x(j) = b(j)/A(j,j)
            for k = 1:n
                if j == k then continue
                else x(j) = x(j) - A(j,k)*x(k)/A(j,j)
                end
            end
        end
        if norm(y - x) < del then break
        else y = x
        end
    end
endfunction


B = [7, -6; -8, 9]; c = [3; -4]

C = [16, 3; 7, -11]; d = [11; 13]


//Ej 27 Kincaid
D = [3,1,1; 1,3,-1; 3,1,-5]; e = [5;3;-1]
E = [3,1,1; 3,1,-5; 1,3,-1]; f = [5;-1;3]
