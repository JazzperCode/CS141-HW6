%my_reverse(L,R).
my_reverse([],[]).
my_reverse(L, R) :- my_reverse(L,[],R).

my_reverse([], R, R).
my_reverse([H|T], L, R) :- my_reverse(T, [H|L], R).

%my_length(L,Y)

my_length([],0).
my_length([_|T], Y) :- my_length(T,Len), Y is Len + 1.

%my_subset(Relation, L, Y).
my_subset(Relation, L, Y) :- my_subset(Relation,L,[],Y).

my_subset(_,[],L,Y) :- my_reverse(L,Y).
my_subset(Relation,[H|T],L,Y) :- Bool =.. [Relation,H], Bool, my_subset(Relation,T,[H|L],Y).
my_subset(Relation,[_|T],L,Y) :- my_subset(Relation,T,L,Y).

%my_member(X,Y).

my_member(X,[X|_]).
my_member(X,[_|T]) :- my_member(X,T).

%my_intersect(L1,L2,R).
my_intersect(L1,L2,R) :- my_intersect(L1,L2,[],R).

my_intersect([],_,L,R) :- my_reverse(L,R).
my_intersect([H|T],L2,L,R) :- my_member(H,L2), my_intersect(T,L2,[H|L],R).
my_intersect([_|T],L2,L,R) :- my_intersect(T,L2,L,R). 

%compute_change(Total,Q,D,N,P).
compute_change(Total,Q,D,N,P) :- compute_change(Total,Q,D,N,P,[0,0,0,0]).

compute_change(0,Q,D,N,P,[Q,D,N,P]).
compute_change(Total,Q,D,N,P,[_,B,C,D]) :-  Y is Total//25, Y \=0, Left is Total mod 25, compute_change(Left,Q,D,N,P,[Y,B,C,D]). 
compute_change(Total,Q,D,N,P,[A,_,C,D]) :-  Y is Total//10, Y \=0, Left is Total mod 10, compute_change(Left,Q,D,N,P,[A,Y,C,D]). 
compute_change(Total,Q,D,N,P,[A,B,_,D]) :-  Y is Total//5,  Y \=0, Left is Total mod 5, compute_change(Left,Q,D,N,P,[A,B,Y,D]).
compute_change(Total,Q,D,N,P,[A,B,C,_]) :- compute_change(0,Q,D,N,P,[A,B,C,Total]).



%compose(L1,L2,L3).
compose(L1,L2,L3) :- compose(L1,L2,[],L3).

compose([],[],L3,L3).
compose([],L2,Y,L3) :- append(Y,L2,L3).
compose(L1,[],Y,L3) :- append(Y,L1,L3).
compose([H1|T1],[H2|T2],Y,L3):- append(Y,[H1,H2],L),compose(T1,T2,L,L3).

%palindrome(L,R).
palindrome(L,R) :- my_reverse(L,Y), append(L,Y,R). 