/* Exercise 2 */

/* Facts */
% Gender
female(queen_elizabeth).
female(princess_ann).
male(prince_charles).
male(prince_andrew).
male(prince_edward).
% Order of birth
child_of(queen_elizabeth, prince_charles, 1).
child_of(queen_elizabeth, princess_ann, 2).
child_of(queen_elizabeth, prince_edward, 3).
child_of(queen_elizabeth, prince_andrew, 4).

/* Rules */
% Succession rules
successor_old(KQ) :-
    child_of(KQ, Child, Order),
    male(Child), Order()
