% males and females
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(ling).

% maritals
married(abraham, mona).
married(mona, abraham).
married(clancy, jackie).
married(jackie, clancy).
married(homer, marge).
married(marge, homer).

% parents
parent(abraham, herb).
parent(mona, herb).
parent(abraham, homer).
parent(mona, homer).
parent(clancy, marge).
parent(jackie, marge).
parent(clancy, patty).
parent(jackie, patty).
parent(clancy, selma).
parent(jackie, selma).
parent(homer, bart).
parent(marge, bart).
parent(homer, lisa).
parent(marge, lisa).
parent(homer, maggie).
parent(marge, maggie).
parent(selma, ling).

spouse(p) :- married(p,_).
%husband
%wife
father(F) :- male(F), parent(F,_).
mother(M) :- female(M), parent(M,_).
sibling(A, B) :- parent(P, A), parent(P, B).
brother(X,Y) :- male(X), sibling(X, Y).
sister(X, Y) :- female(X), sibling(X, Y).
grandparent(X,Y):- parent(Z,X), parent(Y,Z).
%grandfather
grandfather(X,Y) :- father(X, Z), father(Z, Y), X \= Y.
grandfather(X, Y) :- father(X, Z), mother(Z, Y), X \= Y.

%grandmother
grandmother(X,Y) :- mother(X, Z), mother(Z, Y), X \= Y.
grandmother(X, Y) :- mother(X, Z), father(Z, Y), X \= Y.
%grandchild
%grandson
%granddaughter
%ancestor
ancestor(X,Y) :- father(X,Z),  greatgrandmother(Z,Y).
ancestor(X,Y) :- father(X, Z), greatgrandfather(Z,Y).
ancestor(X,Y) :- mother(X,Z),  greatgrandmother(Z,Y).
ancestor(X,Y) :- mother(X, Z), greatgrandfather(Z,Y).

child(X, Y) :- parent(Y, X).
son(X, Y) :- male(X), parent(Y, X).
daughter(X, Y) :- female(X), parent(Y, X).
%descendant
%uncle
uncle1(X, Y) :- male(X), brother1(X, Z), parent(Z,Y), X \= Y, format('~w is the uncle of ~w. ~n', [X,Y]).
uncle2(X, Y) :- male(X), brother2(X,Z), parent(Z,Y), X \= Y, format('~w is the uncle of ~w. ~n', [X,Y]).
%aunt
aunt1(X, Y) :- female(X), sister1(X, Z), parent(Z,Y), X \= Y, format('~w is the aunt of ~w. ~n', [X,Y]).
aunt2(X, Y) :- female(X), sister2(X,Z), parent(Z,Y), X \= Y, format('~w is the aunt of ~w. ~n', [X,Y]).
cousin(A, B) :- parent(P1, A), parent(P2, B), siblings(P1, P2).
%nephew
%niece
%greatgrandparent
greatgrandparent(X,Y,Z) :- greatgrandmother(X,Z), greatgrandfather(Y, Z).
%greatgrandfather
greatgrandfather(X,Y) :- grandfather(X,Z), father(Z,Y).
greatgrandfather(X,Y) :- grandfather(X,Z), mother(Z, Y).
%greatgrandmother
greatgrandmother(X, Y) :- grandmother(X,Z), father(Z, Y).
greatgrandmother(X, Y) :- grandmother(X,Z), mother(Z,Y).
%greatgrandchild
%greatgrandson
%greatgranddaughter