# -----------------------------------------------------------------------------
# A script to find a "Goldilocks" group for a computational group theory tutorial.
#
# The script searches for a group G that is a good candidate for being
# computationally difficult. A good candidate satisfies:
# 1. It has non-trivial abelian invariants (it is not a perfect group).
# 2. It has at least one non-abelian simple composition factor.
#
# The script will print the first group it finds and then terminate.
# The user should then manually test if `Size(G)` is slow for this candidate.
# -----------------------------------------------------------------------------

# --- Configuration ---
# You can adjust these parameters to broaden or narrow the search.
SEARCH_ORDER_MIN := 1000;
SEARCH_ORDER_MAX := 1200;


# --- Script Body ---
Print( "### Starting search for a Goldilocks group candidate. ###\n" );
Print( Concatenation("    Range: Orders ", String(SEARCH_ORDER_MIN), " to ", String(SEARCH_ORDER_MAX), "\n\n") );

# 1. Build a list of all [order, index] pairs for the groups in the range.
all_groups := [];
Print("Building list of all groups in the specified range...\n");
for order in [SEARCH_ORDER_MIN .. SEARCH_ORDER_MAX] do
    # We directly call NumberSmallGroups. If an order is not in the library,
    # it returns 0, and the inner loop correctly does nothing.
    for index in [1 .. NumberSmallGroups(order)] do
        Add(all_groups, [order, index]);
    od;
od;
Print(Concatenation("Found ", String(Length(all_groups)), " groups to check. Shuffling list...\n\n"));

# 2. Shuffle the list in-place using a Fisher-Yates shuffle.
for i in [Length(all_groups), Length(all_groups)-1 .. 2] do
    j := Random(1, i);
    # Swap elements at positions i and j
    temp := all_groups[i];
    all_groups[i] := all_groups[j];
    all_groups[j] := temp;
od;

# --- Main Search Loop ---
found_group := false;

# 3. Iterate through the now-shuffled list of groups.
for coord in all_groups do
    order := coord[1];
    index := coord[2];

    lib_group := SmallGroup(order, index);
    iso := IsomorphismFpGroup(lib_group);
    fp_group := Range(iso);
    
    # TEST 1: Check for non-trivial abelian invariants.
    ab_inv := AbelianInvariants(fp_group);
    if ab_inv <> [] then
        # This group is not perfect, so it's a potential candidate.
        # Now, perform the second structural test.

        # TEST 2: Check for a non-abelian simple factor.
        factors := CompositionFactors(fp_group);
        has_non_abelian_factor := false;
        for f in factors do
            if not IsAbelian(f) then
                has_non_abelian_factor := true;
                break;
            fi;
        od;

        if has_non_abelian_factor then
            # SUCCESS! We found a group that meets both structural criteria.
            Print( "\n\n#######################################################\n" );
            Print( "###           CANDIDATE FOUND!                    ###\n" );
            Print( "#######################################################\n\n" );
            Print( "Found a group that is a good candidate for your tutorial.\n\n" );
            Print( "  - Library ID:          SmallGroup(", order, ", ", index, ")\n" );
            Print( "  - Abelian Invariants:  ", ab_inv, "\n" );
            Print( "  - Composition Factors: Contains at least one non-abelian simple group.\n\n" );
            Print( "Please test this group manually to see if `Size(G)` is slow.\n\n" );
            Print( "You can recreate this group in GAP with the following code:\n" );
            Print( "-------------------------------------------------------\n" );
            Print( "F := FreeGroup(", Length(GeneratorsOfGroup(fp_group)), ");\n" );
            Print( "G := F / ", RelatorsOfFpGroup(fp_group), ";\n" );
            Print( "-------------------------------------------------------\n\n" );

            found_group := true;
            break; # Exit the loop since we found a group.
        fi;
    fi;
od; # End of main search loop.

# --- Final Message ---
if not found_group then
    Print( "\n### Search complete. ###\n" );
    Print( "No suitable group candidate was found in the specified range.\n" );
    Print( "Consider increasing SEARCH_ORDER_MAX.\n" );
fi;
