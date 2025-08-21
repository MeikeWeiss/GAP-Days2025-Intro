g:=GL(4, 53);

orb:=Orbit(g, [1,0,0,0]*Z(53)^0, OnPoints);;
hom:=ActionHomomorphism(g, orb, OnPoints);
p:=Image(hom);

Size(p);
# is very slow, I did not get it to finish
Size(g)
# finishes fast, even though both groups are the same