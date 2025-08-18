cc:=function(group) return Length(CompositionSeries(group)); end;;
gpp:=function(group) return Size(DerivedSubgroup(DerivedSubgroup(group))); end;;
lrs:=function(group) 
    P:=PresentationFpGroup(Image(IsomorphismFpGroup(group)));
    TzGoGo(P);
    return Length(RelatorsOfFpGroup(FpGroupPresentation(P)));
end;;
grps:=AllSmallGroups(Size, [1002..1002], cc, [4], gpp, [2..1000], lrs, [2..5]);

F := IsomorphismFpGroup(G);

G:=Image(F);

P:=PresentationFpGroup(Image(IsomorphismFpGroup(grps[1])));
TzGoGo(P);
RelatorsOfFpGroup(FpGroupPresentation(P));