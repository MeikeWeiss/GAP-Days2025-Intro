Size(g);
IsNilpotent(g);
IsSolvable(g);

# compute prime decomposition of size of group
Collected(Factors(1080));

omega:=RightCosets(g, DerivedSubgroup(g));
phi:=ActionHomomorphism(g, omega, OnRight);
im:=Image(phi);
# Is isomorphic to C_4 \times C_2

g2:=DerivedSubgroup(g);
omega2:=RightCosets(g2, DerivedSubgroup(g2));
phi2:=ActionHomomorphism(g2, omega2, OnRight);
im2:=Image(phi2);
Size(im2);
IsTransitive(im2);
IsAbelian(im2);

