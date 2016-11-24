function y = bisection(f, a, b, M, dlt, eps)
    u = f(a)
    v = f(b)
    e = b - a
    if sign(u*v) > 0 then
        error(144)
    end
    for k = 1:M
        e = e/2
        c = a+e
        w = f(c)
        if abs(e)>dlt & abs(w)>eps then
            if sign(w) <> sign(u) then
                b = c
                v = w
            else
                a = c
                u = w
            end
        else
            break
        end
    end
    y = [k;c;w;e]
endfunction

function y = g(x)
    y = log(x) + 12
endfunction


//-->bisection(g, 10^-15, 1, 100, 10^-22, 10^-22)
// ans  =
// 
//    65.        
//    0.0000061  
//    0.         
//    2.711D-20  
