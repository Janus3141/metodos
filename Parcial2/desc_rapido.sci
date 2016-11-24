function y = desc_rapido(A,x,b,M)
    for i = 1:(M-1)
        v = b - A*x
        t = (v'*v) / (v'*(A*v))
        x = x + t*v
    end
    y = x
endfunction
