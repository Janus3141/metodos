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
