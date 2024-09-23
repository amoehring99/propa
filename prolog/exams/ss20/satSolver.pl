% vim: filetype=prolog

contradict(A) :- member(pos(V)), member(neg(V)).

solve(P, []).
solve([L|Ls], [A|As]) :- solve(L,A)
