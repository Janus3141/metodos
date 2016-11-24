function [y,r,step] = power(A,x,M,del)
    r = 1
    for i = 1:M
        y = A*x
        r1 = y(2)/x(2)
        if norm(r1 - r) < del then break
        end
        x = y / norm(y)
        r = r1
    end
    step = i
endfunction
