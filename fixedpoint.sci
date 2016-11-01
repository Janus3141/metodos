function y = fixedpoint(f, x0, M, eps)
    for i = 1:M
        x = f(x0)
        if abs(x0 - x) < eps then
            break
        else
            x0 = x
        end
    end
    y = [i]
endfunction


function y = g(x)
    y = x - (x^3 - log(1+2*x))/20
endfunction


tabla = [4:20]'

for j = 4:20
    tabla(j-3,1) = 10^-j
    tabla(j-3,2) = fixedpoint(g,1,1000,10^-j)
end


//  Precision    |   Nro de pasos

//-->tabla
// tabla  =
// 
//    0.0001       30.   
//    0.00001      47.   
//    0.000001     63.   
//    1.000D-07    80.   
//    1.000D-08    97.   
//    1.000D-09    113.  
//    1.000D-10    130.  
//    1.000D-11    146.  
//    1.000D-12    163.  
//    1.000D-13    179.  
//    1.000D-14    196.  
//    1.000D-15    212.  
//    1.000D-16    227.  
//    1.000D-17    227.  
//    1.000D-18    227.  
//    1.000D-19    227.  
//    1.000D-20    227.  
