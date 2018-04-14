% Madison Fichtner
% CSCI 305 Prolog Lab

mother(M,C) :- parent(M,C), female(M).
father(F,C) :- parent(F,C), male(F).

spouse(X,Y) :- parent(X,Z), parent(Y,Z), dif(X,Y).

child(X,Y) :- parent(Y,X).
son(X,Y) :- child(X,Y), male(X).
daughter(X,Y) :- child(X,Y), female(X).

sibling(X,Y) :- parent(Z,X), parent(Z,Y), dif(X,Y).
sister(X,Y) :- sibling(X,Y), female(X).
brother(X,Y) :- sibling(X,Y), male(X).

uncle(X,Y) :- parent(V,Y), brother(X,V).
aunt(X,Y) :- parent(V,Y), sister(X,V).

grandparent(X,Y) :- parent(V,Y), parent(X,V).
grandmother(X,Y) :- grandparent(X,Y), female(X).
grandfather(X,Y) :- grandparent(X,Y), male(X).
grandchild(X,Y) :- grandparent(Y,X).

ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(U,Y), ancestor(X,U).
descendant(X,Y) :- ancestor(Y,X).

older(X,Y) :- born(X, Xyear), born(Y, Yyear), Xyear < Yyear.
younger(X,Y) :- born(X, Xyear), born(Y,Yyear), Xyear > Yyear.

cousin(X,Y) :- parent(U,X), parent(W,Y), sibling(U,W).
