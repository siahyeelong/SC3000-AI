/* Exercise 1 */

% Facts
competitor(sumsum, appy). % sumsum is a competitor of appy
competitor(appy, sumsum). % appy is also a competitor of sumsum
develop(sumsum, galactica-s3). % sumsum produced some nice smart phone tech
steal(stevey,galactica-s3).
boss(appy, stevey). % the boss of appy is stevey

% Rules
rival(X,Y) :- competitor(X,Y). % competitor relationship same as rivalry

unethical(Person) :- % a boss is unethical if he steals business from rivals
    boss(Boss_Company,Person), % if the person in question is a boss of a company
    rival(Boss_Company, Rival_Company), % if boss's company has a rival company
    develop(Rival_Company, Technology), % if a technology belongs to the rival company
    business(Technology), % if the technology is a business
    steal(Person, Technology). % that the person has stolen

business(galactica-s3).