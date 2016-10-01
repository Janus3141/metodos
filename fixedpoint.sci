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
