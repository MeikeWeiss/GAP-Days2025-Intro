fibonacciNumber:=function(n)
    if n = 0 then
        return 0;
    elif n = 1 then
        return 1;
    else
        return fibonacciNumber(n-1) + fibonacciNumber(n-2);
    fi;
end;;