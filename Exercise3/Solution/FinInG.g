# Exercise 1

# a)
pg:=PG(2,2);

Size(Lines(pg));
Size(Points(pg));

# b)
point := VectorSpaceToElement(pg,[0,1,0]);
Coordinates(point);

lines:=Lines(pg);
Filtered(lines,l->IsIncident(l,point));


# c)
points:=Points(pg);
for p in points do
    if Length(Filtered(lines,l->IsIncident(l,p)))<>3 then
        Print("false\n");
    fi;
od;

for l in lines do
    if Length(Filtered(points,p->IsIncident(l,p)))<>3 then
        Print("false\n");
    fi;
od;´



# Exercise 2

# a)
pg:=PG(2,3);

p1:=List(Points(pg))[1];
p2:=List(Points(pg))[5];
p3:=List(Points(pg))[10];
p4:=List(Points(pg))[13];


# b)
IsArc:=function(ps,points)
    local lines, triple, l1, l2, l3;
    lines:=List(Lines(ps));
    for triple in Combinations(points,3) do
        l1:=Filtered(lines,l->triple[1] in l);
        l2:=Filtered(lines,l->triple[2] in l);
        l3:=Filtered(lines,l->triple[3] in l);
        if Intersection(l1,l2,l3)<>[] then
            return false;
        fi;
    od;
    return true;
end;