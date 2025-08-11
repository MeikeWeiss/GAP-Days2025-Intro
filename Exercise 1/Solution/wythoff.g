# Returns the n-th number of the wythoff array (i,j)
wythoffNumber:=function(n, i, j)
    if n = 0 then
        return i;
    elif n = 1 then
        return j;
    else
        return wythoffNumber(n-1) + wythoffNumber(n-2);
    fi;
end;;