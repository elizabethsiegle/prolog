% relations
% female(person) % person is female
%  ; to generate all responses.
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(ling).
female(lisa).

% male(person) % person is male
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

% married(person1, person2) % person1 is/was married to person2
married(abraham, mona).
married(mona, abraham).
married(clancy, jackie).
married(jackie, clancy).
married(homer, marge).
married(marge, homer).

% parent(person1, person2) % person1 is a parent of person2
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


