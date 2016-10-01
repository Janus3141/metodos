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
    y = [k, c, w, e]
endfunction


function y = newtons(f, x, M, del, eps)
    v = f(x)
    if abs(v) < eps | M == 0 then
        k = 0
        x1 = x
    else
        for k = 1:M
            x1 = x - v/numderivative(f,x)
            v = f(x1)
            if abs(x1 - x) < del | abs(v) < eps then break
            else
                x = x1
                continue
            end
        end
    end
    y = [k, x1, v]
endfunction


function y = secant(f, a, b, M, del, eps)
    v = f(a)
    w = f(b)
    k = 0
    if abs(v) < eps then
        x = a
        w = v
    elseif  abs(w) < eps | M == 0 then
        x = b
    else
        for k = 1:M
            x = b - w*(b - a)/(w - v)
            v = w
            w = f(x)
            if abs(x - b) < del | abs(w) < eps then break
            else
                a = b
                b = x
                continue
            end
        end
    end
    y = [k, x, w]
endfunction


function y = fixedpoint(f, x0, M, eps)
    for i = 1:M
        x = f(x0)
        if abs(x0 - x) < eps then
            break
        else
            x0 = x
        end
    end
    y = [M, x]
endfunction
