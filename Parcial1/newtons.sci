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
