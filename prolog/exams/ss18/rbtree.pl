% vim: filetype=prolog

lt(leaf,_).
lt(node(_,Left,Y,Right),X) :- Y =< X, lt(Left,X), lt(Right,X).

gt(leaf,_).
gt(node(_,Left,Y,Right),X) :- Y >= X, gt(Left,X), gt(Right,X).

sorted(leaf).
sorted(node(_,Left,X,Right)) :- lt(Left,X), gt(Right,X), sorted(Left), sorted(Right).

colorPath(leaf,[black]).
colorPath(node(Color,Left,_,_), [Color|L]) :- colorPath(Left,L).
colorPath(node(Color,_,_,Right), [Color|R]) :- colorPath(Right,R).

redRed(node(red,node(red,_,_,_),_,_)).
redRed(node(red,_,_,node(red,_,_,_))).
redRed(node(_,Left,_,_)) :- redRed(Left).
redRed(node(_,_,_,Right)) :- redRed(Right).
