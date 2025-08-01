# more difficult

list:=[3,5,5,1,8];

sorted:=[];
rest:=list;
while rest!=[] do
    min:=Minimum(rest);
    Remove(rest,Position(min));
    Add(sorted,min);
od;

Print("The sorted list of ", list, " is ", sorted);