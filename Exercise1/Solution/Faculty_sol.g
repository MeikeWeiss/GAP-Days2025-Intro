n:=10;

res:=1;
for i in [1..n] do
    res:=res*i;
od;

Print("Faculty of ", n, " is ", res);