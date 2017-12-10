:- [final].
# :- [hp].
%  spouse(X, Y) % X is spouse of Y
spouse(X, Y) :- married(X, Y).

% father % x is father of y
father(X, Y) :- male(X), parent(X, Y).

% mother % X is mother to Y
mother(X, Y) :- female(X), parent(X, Y).

% sibling % X is sibling of Y
sibling(X, Y) :- father(Z, X), father(Z, Y), mother(A, X), mother(A, Y).

% brother % X is brother of Y
brother(X,Y) :- male(X), sibling(X, Y),!.

% sister % Y is sister of X
sister(X, Y) :- female(X), sibling(X, Y).

% grandparent % X is grandparent of Y
grandparent(X,Y):-parent(X,Z),parent(Z,Y).

% grandfather
grandfather(X, Z) :- male(X), grandparent(X, Z).

% grandmother % X is grandmother of Y
grandmother(X, Z) :- grandparent(X, Z), female(X).

% grandchild % A is grandchild of B
grandchild(A,B) :- parent(B,X), parent(X,A),!.

% grandson
grandson(A, B) :- grandchild(A, B), male(B),!.

% granddaughter
granddaughter(A, B) :- female(A), grandchild(A, B),!.

% ancestor
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% child % X is a parent of Y
child(X, Y) :- parent(Y, X).

% son
son(X, Y) :- male(X), parent(Y, X),!.

% daughter
daughter(X, Y) :- female(X), parent(Y, X),!.

% descendant
descendant(Y, X) :- ancestor(X, Y).

% uncle % X is uncle of Y
uncle(X,Y):- male(X), parent(Z,X), parent(Z,X1), parent(X1,Y), X1 \== X.

% aunt % X is aunt of Y
aunt(X,Y):- female(X), parent(Z,X), parent(Z,X1), parent(X1,Y), X1 \== X.

cousin(X, Y) :- aunt(A, X), parent(A, Y).
cousin(X, Y) :- uncle(A, X), parent(A, Y).

% nephew
nephew(Nephew, Aunt) :- aunt(Aunt, Nephew), male(Nephew).
nephew(Nephew, Uncle) :- uncle(Uncle, Nephew), male(Nephew).

% niece
niece(Niece, Uncle) :- uncle(Uncle, Niece),female(Niece).
niece(Niece, Aunt) :- aunt(Aunt, Niece), female(Niece).

% greatgrandparent % X is GGP to Z || Y is GGP to Z
greatgrandparent(X, Y) :- parent(P, Y), grandparent(X, P).

% greatgrandfather
greatgrandfather(X,Y) :- grandfather(X,Z), father(Z,Y).
greatgrandfather(X,Y) :- grandfather(X,Z), mother(Z, Y).

% greatgrandmother
greatgrandmother(X, Y) :- grandmother(X,Z), father(Z, Y).
greatgrandmother(X, Y) :- grandmother(X,Z), mother(Z,Y).

% greatgrandchild
greatgrandchild(X, Z) :- child(X, Y), grandchild(Y, Z).

% greatgrandson
greatgrandson(X, Z) :-  male(X), greatgrandchild(X, Z).

% greatgranddaughter
greatgranddaughter(X, Z) :- female(X), greatgrandchild(X, Z).