# Exercise 1

# a)
# Use the definition of the Petersen graph as a Kneser graph
P := Graph( SymmetricGroup(5), [[1,2]], OnSets,function(x,y) return Intersection(x,y)=[]; end );

gr:=Group([ (1,2,3,5,7)(4,6,8,9,10), (2,4)(6,9)(7,10) ]); # Automorphism group of Petersen graph acting on the vertices
h:=Stabilizer(gr,1);
orbs:=List(Orbits(h,[1..10]),Set);
y:=First(orbs,x->Length(x)=3)[1]; # Orbit that contains all neighbours of 1
G := EdgeOrbitsGraph( gr, [[1,y]], 10 );

# b)
UndirectedEdges(P);

ChromaticNumber(Digraph(P)); # without using Digraph() for me not possible

CompleteSubgraphs(P,4);

# c)
VertexDegrees(P);



# Exercise 2

EdgeThreeColouring:=function(gamma)
    local g, n, subs, orbs, res, adjacent, o, col, c;

    g:=gamma.group;
    edges:=UndirectedEdges(gamma);
    subs:=Filtered(AllSubgroups(g),s->Length(Orbits(s,edges,OnSets))=3);
    orbs:=List(subs,s->Orbits(s,edges,OnSets));
 
    res:=[];
   
    for o in orbs do
        col:=List([1..Length(edges)],i->0);
        adjacent:=false;
        for c in [1..3] do
            if not IsDuplicateFree(Flat(o[c])) then
                adjacent:=true;
            fi;
        od;

        if not adjacent then
            for c in [1..3] do
                for r in o[c] do
                    col[Position(edges,r)]:=c;
                od;
            od;
        fi;
        if col<>List([1..Length(edges)],i->0) then
            Add(res,col);
        fi;
    od;
    return res;
end;