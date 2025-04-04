/* Exercise 2.2 */
% Facts gender: not necessary as gender is not considered in monarch.
/*female(queen_elizabeth).
male(prince_charles).
female(princess_ann).
male(prince_andrew).
male(prince_edward).*/

% Parent-child relation: parent(Parent, Child).
parent(queen_elizabeth, prince_charles).
parent(queen_elizabeth, princess_ann).
parent(queen_elizabeth, prince_andrew).
parent(queen_elizabeth, prince_edward).

% Define order of birth : older(OlderSibling, YoungerSibling).
older(prince_charles, princess_ann).
older(princess_ann, prince_andrew).
older(prince_andrew, prince_edward).

% Transitive rule to determine if someone is older than another
% is_older(PersonA, PersonB) means PersonA is older than PersonB.
is_older(X, Y) :- older(X, Y). % Base case: Directly older
is_older(X, Y) :- older(X, Z), is_older(Z, Y). % Recursive case: Older via intermediate sibling

% Removed all cases related to gender for new succession rule.
% Predicate is updated to not need Monarch as there is no need to
% search if P1, P2 are children of the Monarch again
compare_succession(<, P1, P2) :-
    is_older(P1, P2). % P1 comes before P2
compare_succession(>, P1, P2) :-
    is_older(P2, P1). % P2 comes before P1


% Rule to determine the line of succession for a given monarch.
line_of_succession(Queen, SuccessionList) :-
    findall(Child, parent(Queen, Child), Children),
    predsort(compare_succession, Children, SuccessionList).
