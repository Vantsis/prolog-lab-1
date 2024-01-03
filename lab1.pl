majority([A],A):-!.
majority(L,X):-
    occurance(L,_,X,0,0,1),!.

occurance([],Element,Element,_,Number,Number).
occurance([H|T],_,Element,Max,_,Numbr):-
    aggregate_all(count,member(H,[H|T]),C),
    delete(T,H,T1),
    C>Max,
    occurance(T1,H,Element,C,1,Numbr).

occurance([H|T],E1,Element,Max,N1,Numbr):-
    aggregate_all(count,member(H,[H|T]),C),
    delete(T,H,T1),
    C<Max,
    occurance(T1,E1,Element,Max,N1,Numbr).

occurance([H|T],_,Element,Max,N1,Numbr):-
    aggregate_all(count,member(H,[H|T]),C),
    delete(T,H,T1),
    C=:=Max,
    N is N1+1,
    occurance(T1,H,Element,C,N,Numbr).


expand(Output,Output):-
    length(Output,L),
    check_power(L),!.
expand(Input,Output):-
    length(Input,L),
    not(check_power(L)),
    append(Input,[0],O),
    expand(O,Output).

check_power(X):-
  X>0,
  X is X/\(-X).






