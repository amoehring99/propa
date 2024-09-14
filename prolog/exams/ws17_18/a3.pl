% vim: filetype=prolog

permute([], []).
permute(L, [H|T]) :- select(H, L, R), permute(R, T).

makeTree([W], leaf(W)).
makeTree(Ws, node(T1, W, T2)) :- append(Ts1, [W|Ts2], Ws), makeTree(Ts1, T1), makeTree(Ts2, T2).

balanced(leaf(W), W).
balanced(node(T1,W,T2), S) :- balanced(T1, S1), balanced(T2, S2), S is W + S1, S is W + S2.

makeBalanced(Ws, T) :- permute(Ws, Vs), makeTree(Vs, T), balanced(T, _).

% ?- makeTree([1,2,3,4,5], T)
