
# Lists
res:=0;
for i in [1..100] do
    res:=res+i;
od;

res:=0;
i:=1;
while i<=100 do
    res:=res+i;
    i:=i+1;
od;

L:=[1,2,3,4,5,6];
List(L,i->i^2);

M:=[1,2,4,6,9,12,25];
Filtered(M,i->IsEvenInt(i));



# Groups

G:=Group((1,2,3,4),(5,6,7,8),(1,5)(2,6)(3,7)(4,8));
Order(G);
center:=Center(G);
StructureDescription(center);
Index(G,center);


G:=Group((1,2,3,4),(5,6,7,8),(1,5)(2,6)(3,7)(4,8));
S:=Elements(G);#{[1..20]};
conjS:=[];
for s in S do
    include:=true;
    for c in conjS do
        if IsConjugate(G,s,c) then
            include:=false;
        fi;
    od;
    if include then
        Add(conjS,s);
    fi;
od;



# Matrices
M:=[[1,2],[3,4]];
v:=[1,1];

M*v;
v*M;

Determinant(M);
Eigenvalues(Rationals,M);
Eigenvectors(Rationals,M);