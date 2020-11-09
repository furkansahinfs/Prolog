%This is base case which is empty list.
numberofelement([],_,0).

%If list[1] == given element, make count +1 and go on recursion
numberofelement([X|T],X,Y):- !, numberofelement(T,X,Z), Y is 1+Z.

%If list[1] != given element, go on recursion
numberofelement([_|T],X,Z):- numberofelement(T,X,Z).
unique(St,L):- numberofelement(L,St,1).

%Make the given array a list whose name is given by user (L).
makeList(Y,F) :-
append(Y,[],X),
F = X.

%If the count of given element is not 2, write the element.
control(List,X):- numberofelement(List, X,N),
N\=2 ->makeList([X],NL), member(X,NL),write(X).

% Travel each element of list. Fisrtly get the element and
% transfer it to control function.
iter_list(List) :- member(X, List), control(List,X) , nl ,fail.

%main function.
main_func :-
makeList([2, 3, 2, 4, 5, 5, 1, 6, 1, 3, 6],L),
iter_list(L).

%TO RUN THE CODE : ?-main_func.
