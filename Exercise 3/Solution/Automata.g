# Exercise 1

# a)
x:=Automaton("det",4,2,[[4,3,2,],[2,1,4,3]],[1],[2]);
Display(x);

# b)
AutomatonToRatExp(x);
RatExpToAut(last);
last<>x;

# c)
g:=TransitionSemigroup(x);
GeneratorsOfSemigroup(g);