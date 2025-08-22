# Exercise 1

# a)

p1:=DigraphSymmetricClosure(DigraphByEdges([ [ 1, 2 ], [ 1, 5 ], [ 1, 6 ], [ 2, 3 ], [ 2, 7 ], [ 3, 4 ], [ 3, 8 ], [ 4, 5 ], [ 4, 9 ], [ 5, 10 ], [ 6, 8 ], [ 6, 9 ], [ 7, 9 ], [ 7, 10 ], [ 8, 10 ] ]));
p2:=DigraphByInNeighbours([ [ 2, 5, 6 ], [ 1, 3, 7 ], [ 2, 4, 8 ], [ 3, 5, 9 ], [ 1, 4, 10 ], [ 1, 8, 9 ], [ 2, 9, 10 ], [ 3, 6, 10 ], [ 4, 6, 7 ], [ 5, 7, 8 ] ]);

IsIsomorphicDigraph(p1,PetersenGraph());
IsIsomorphicDigraph(p2,PetersenGraph());

# b)

IsPlanarDigraph(PetersenGraph());

IsHamiltonianDigraph(PetersenGraph());

ChromaticNumber(PetersenGraph());

SubdigraphsMonomorphisms(PetersenGraph(),CompleteDigraph(4));

AutomorphismGroup(PetersenGraph());

# c)

OutDegrees(PetersenGraph());

# d)

Splash(DotSymmetricDigraph(PetersenGraph()),rec(path:="/mnt/c/Users/meike/OneDrive/Dokumente/",directory:="Promotion"));


# Exercise 2

# Implementation of Digraph Package
LineGraph:=function(D)
  local G, opt;

  if HasDigraphGroup(D) then
    G := DigraphGroup(D);
  else
    G := Group(());
  fi;
  if IsMutableDigraph(D) then
    opt := IsMutableDigraph;
  else
    opt := IsImmutableDigraph;
  fi;
  return Digraph(opt,
                 G,
                 Set(DigraphEdges(D), Set),
                 OnSets,
                 {x, y} -> x <> y and not IsEmpty(Intersection(x, y)));
end;