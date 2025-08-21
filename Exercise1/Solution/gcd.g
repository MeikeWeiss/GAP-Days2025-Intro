gcd:=function(a,b)
    local remainder;

    while b <> 0 do
        remainder := b;
        b := a mod b;
        a := remainder;
    od;

    return a;
end;