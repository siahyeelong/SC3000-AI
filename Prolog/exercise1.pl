/* Exercise 1 */

% Facts
company(sumsum). % sumsum is a company
company(appy). % appy is a company

nice_smart_phone_tech(sumsum, galactica-s3). % sumsum produced some nice smart phone tech

boss(appy, stevey). % the app of appy is stevey

competitor(sumsum, appy). % sumsum is a competitor of appy


% Rules
competitor(X,Y) :- % if X is a competitor of Y, then Y is a competitor of X
    company(X), % X is a company
    company(Y), % Y is also a company
    company(X) \= company(Y), % X and Y are not the same company
    competitor(Y,X). % Y is also a competitor of X

rival(X,Y) :- competitor(X,Y). % competitor relationship same as rivalry

unethical(Person) :- % a boss is unethical if he steals business from rivals
    boss(Boss_Company,Person), % if the person in question is a boss of a company
    rival(Boss_Company, Rival_Company), % if boss's company has a rival company
    nice_smart_phone_tech(Rival_Company, Product), % if a product belongs to the rival company
    steal(Person, Product). % that the person has stolen

steal(stevey,galactica-s3).