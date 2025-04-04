/* Exercise 2.1 */
% Facts gender: male(Person). female(Person).
female(queen_elizabeth).
male(prince_charles).
female(princess_ann).
male(prince_andrew).
male(prince_edward).

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

% Rule defining the old succession preference:
% succeeds_before(Heir1, Heir2, Queen) means Heir1 comes before Heir2
% Case 1: A male heir comes before a female heir.
succeeds_before(Heir1, Heir2, Monarch) :-
    parent(Monarch, Heir1),
    parent(Monarch, Heir2),
    male(Heir1),
    female(Heir2).

% Case 2: Both are male; the older one comes first.
succeeds_before(Heir1, Heir2, Monarch) :-
    parent(Monarch, Heir1),
    parent(Monarch, Heir2),
    male(Heir1),
    male(Heir2),
    is_older(Heir1, Heir2).

% Case 3: Both are female; the older one comes first.
succeeds_before(Heir1, Heir2, Monarch) :-
    parent(Monarch, Heir1),
    parent(Monarch, Heir2),
    female(Heir1),
    female(Heir2),
    is_older(Heir1, Heir2).

% Helper predicates for sorting based on the succession rule.
% Order is '<' if Person1 precedes Person2, '>' if Person2 precedes Person1.
compare_succession(<, P1, P2) :-
    succeeds_before(P1, P2, queen_elizabeth). % P1 comes before P2
compare_succession(>, P1, P2) :-
    succeeds_before(P2, P1, queen_elizabeth). % P2 comes before P1


% Rule to determine the line of succession for a given monarch.
line_of_succession(Queen, SuccessionList) :-
    findall(Child, parent(Queen, Child), Children),
    predsort(compare_succession, Children, SuccessionList).
