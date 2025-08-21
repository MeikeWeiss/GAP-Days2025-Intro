permutationSign := function(perm)
    local list, n, inversion_count, i, j;
    n := LargestMovedPoint(perm);
    list := ListPerm(perm);
    inversion_count := 0;

    for i in [1..n-1] do
        for j in [i+1..n] do
            if list[i] > list[j] then
                inversion_count := inversion_count + 1;
            fi;
        od;
    od;

    if (inversion_count mod 2) = 0 then
        return 1;
    else
        return -1;
    fi;
end;