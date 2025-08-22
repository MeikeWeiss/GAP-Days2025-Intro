# Exercise 1

# a)
G := Z(3)^0 * [[1,0,1,1],[0,1,1,2]];

C := GeneratorMatCode( G, GF(3) );


# b) 
WordLength(C);
Dimension(C);
MinimumDistance(C);

# c)
c:= "12"*C; # encode
Decode(C, c);

# d)
Decode(C, c+"0002");