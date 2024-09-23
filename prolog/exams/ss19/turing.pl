% vim: filetype=prolog
transition(3, s1, 4, left, s2). 

band(A,([],M,R)) :- append([M],R,Y), A == Y.

move(([L|Ls],M,Rs),left,(L2,M2,R2)) :- L2 == Ls, M2 == L, R2 == [M|Rs].
move(B,none,B).

step((L,M,R),S,B2,S2) :- transition(M,S,M2,D,S2), move((L,M2,R),D,B2).

turing(B,S,B2,S2) :- step(B,S,B3,S3), turing(B3,S3,B2,S2).
turing(B,S,B,S) :- not(step(B,S,_,_)).
