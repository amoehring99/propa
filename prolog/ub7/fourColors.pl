% vim: filetype=prolog

farbe(blau).
farbe(gruen).
farbe(rot).
%farbe(gelb).

nachbar(X,Y) :- farbe(X), farbe(Y), X \= Y.

deutschland(VW02,VW03,VW04,VW05,VW06,VW07,VW08,VW09) :-
    nachbar(VW02,VW05), nachbar(VW02,VW06),
    nachbar(VW03,VW04), nachbar(VW03,VW05), nachbar(VW03,VW06), nachbar(VW03,VW09),
    nachbar(VW04,VW05),
    nachbar(VW05,VW06),
    nachbar(VW06,VW07), nachbar(VW06,VW09),
    nachbar(VW07,VW08), nachbar(VW07,VW09),
    nachbar(VW08,VW09).

% ?- deutschland(VW02,VW03,VW04,VW05,VW06,VW07,VW08,VW09).
% ?- aggregate_all(count, deutschland(VW02,VW03,VW04,VW05,VW06,VW07,VW08,VW09), Count).
