# using BFS
wordProblem := function(n, generators, target)
    local queue, visited_elements, current_pair, current_el, current_word,
          next_element, new_word, g, identity;

    identity := 0;

    # [element, word] pairs.
    queue := [ [identity, []] ];
    
    visited_elements := [ identity ];

    if target = identity then
        return [];
    fi;

    while Length(queue) > 0 do
        current_pair := queue[1];
        Remove(queue, 1); 
        
        current_el   := current_pair[1];
        current_word := current_pair[2];

        for g in generators do
            next_element := (current_el + g) mod n;

            if not (next_element in visited_elements) then
                Add(visited_elements, next_element);
                new_word := Concatenation(current_word, [g]);
                
                if next_element = target then
                    return new_word;
                fi;
                
                Add(queue, [next_element, new_word]);
            fi;
        od;
    od;

    return fail; 
end;