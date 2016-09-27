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


deff('y = afunc(x)', 'y = x^-1 - tan(x)')

deff('y = bfunc(x)', 'y = x^-1 - 2^x')

deff('y = cfunc(x)', 'y = 2^-x + %e^x + 2*cos(x) - 6')

deff('y = dfunc(x)', 'y = (x^3 + 4*x^2 + 3*x + 5) / (2*x^3 - 9*x^2 + 18*x - 2)')
