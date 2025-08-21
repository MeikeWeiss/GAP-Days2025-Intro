
list:=[3,5,5,1,8];

sorted:=[];
rest:=ShallowCopy(list);
while rest<>[] do
    min:=Minimum(rest);
    Remove(rest,Position(rest,min));
    Add(sorted,min);
od;

Print("The sorted list of ", list, " is ", sorted);