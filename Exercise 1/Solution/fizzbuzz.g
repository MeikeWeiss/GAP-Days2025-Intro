fizzBuzz:=function(n)
    local res, curr, i;
    res:=[];
    for i in [1..n] do
        curr:="";
        if i mod 3 = 0 then
            curr:= Concatenation(curr, "Fizz");
        fi;
        if i mod 5 = 0 then
            curr:=Concatenation(curr, "Buzz");
        fi;
        if curr="" then
            curr := i;
        fi;
        Add(res, curr);
    od;
    return res;
end;;