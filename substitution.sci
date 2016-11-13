function x = forward_subs(A,b,n)
    x = zeros(n,1)
    for i = 1:n
        x(i) = (b(i) - A(i,:)*x) / A(i,i)
    end
endfunction


function x = back_subs(A,b,n)
    x = zeros(n,1)
    for i = n:-1:1
        x(i) = (b(i) - A(i,:)*x) / A(i,i)
    end
endfunction


function x = backsubs_perm(P,A,b,n)
    x = zeros(n,1)
    for i = 1:n
        x(P(i)) = (b(P(i)) - A(P(i),:)*x) / A(i,i)
    end
endfunction


function x = forwsubs_perm(P,A,b,n)
    x = zeros(n,1)
    for i = n:-1:1
        x(P(i)) = (b(P(i)) - A(P(i),:)*x) / A(i,i)
    end
endfunction
