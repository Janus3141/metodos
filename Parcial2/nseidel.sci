function x = nseidel(A,b,M,del)
    n = size(A,1)
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

//Ej 13
//C = [1,2,3,4; 1,4,9,16; 1,8,27,64; 1,16,81,256]; c = [2;10;44;190]
//D = [1,-1,2,-1; 2,-2,3,-3; 1,1,1,0; 1,-1,4,3]; d = [-8;-20;-2;4]

//Ej 27 Kincaid
//E = [3,1,1; 1,3,-1; 3,1,-5]; e = [5;3;-1]
//F = [3,1,1; 3,1,-5; 1,3,-1]; f = [5;-1;3]

//Ej 11
//G = [10,1,2,3,4; 1,9,-1,2,-3; 2,-1,7,3,-5; 3,2,3,12,-1; 4,-3,-5,-1,15]
//g = [12;-27;14;-17;12]
