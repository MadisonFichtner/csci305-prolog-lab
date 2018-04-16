% Madison Fichtner
% CSCI 305 Prolog Lab

% X is the parent in question, and Y is the child. Checks if X is the parent, then if X is female for mother or male for father
mother(X,Y) :- parent(X,Y), female(X).
father(X,Y) :- parent(X,Y), male(X).

% if duo share children, and are different they are spouses
spouse(X,Y) :- parent(X,Z), parent(Y,Z), dif(X,Y).

% child is inverse of parent; son is child and checks if child is male; daughter is child and checks if child is female
child(X,Y) :- parent(Y,X).
son(X,Y) :- child(X,Y), male(X).
daughter(X,Y) :- child(X,Y), female(X).

% sibling checks if parents are the same. X and Y have to be different; Sister is sibling but checks that X is female; Brother is sibling but checks that X is male
sibling(X,Y) :- parent(Z,X), parent(Z,Y), dif(X,Y).
sister(X,Y) :- sibling(X,Y), female(X).
brother(X,Y) :- sibling(X,Y), male(X).

% uncle checks that Y's parent's brother is X; aunt checks that Y's parent's sister is X
uncle(X,Y) :- parent(V,Y), brother(X,V).
aunt(X,Y) :- parent(V,Y), sister(X,V).

% grandparent checks that the parent of Y's parent is X; grandmother is grandparent but checks that X is female; grandfather is grandparent but checks that X is male; grandchild is the inverse of grandparet
grandparent(X,Y) :- parent(V,Y), parent(X,V).
grandmother(X,Y) :- grandparent(X,Y), female(X).
grandfather(X,Y) :- grandparent(X,Y), male(X).
grandchild(X,Y) :- grandparent(Y,X).

% ancestor is recursive. X is the parent of Y, and U is their ancestor
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(U,Y), ancestor(X,U).
descendant(X,Y) :- ancestor(Y,X).

% older is if X's birth year is less than Y's birth year, they are younger, younger is the inverse
older(X,Y) :- born(X, Xyear), born(Y, Yyear), Xyear < Yyear.
younger(X,Y) :- born(X, Xyear), born(Y,Yyear), Xyear > Yyear.

% regentWhenBorn checks is the year Y is born is between the years X reigned
regentWhenBorn(X,Y) :- reigned(X,Syear,Eyear), born(Y,Yyear), Syear =< Yyear, Yyear =< Eyear.

% if X's parent and Y's parent are siblings then they are cousins
cousin(X,Y) :- parent(U,X), parent(W,Y), sibling(U,W).
