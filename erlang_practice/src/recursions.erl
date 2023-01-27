%% C:/Users/tuba/erlang/erlang_practice/src
-module(recursions).

-export([duplicate/2,tail_duplicate/2,tail_duplicate/3]).
-export([reverse/1,tail_reverse/1,tail_reverse/2]).
-export([sublist/2,tail_sublist/2,tail_sublist/3]).

duplicate(0,_) ->
  [];
duplicate(N,Term) when N>0 ->
  [Term|duplicate(N-1,Term)].
%% duplicate(2,abdullah) when 2>0 true =>  [abdullah|duplicate(1,Abdullah)]
%% [abdullah|duplicate(1,Abdullah)]
%%             duplicate(1,Abdullah) 1>0 true => [Abdullah|duplicate(0,Abdullah)]
%%                                                                 [abdullah|[abdullah|[]]]

tail_duplicate(N,Term) -> tail_duplicate(N,Term,[]).

tail_duplicate(0,_,List) -> List;
tail_duplicate(N,Term,List) -> tail_duplicate(N-1,Term,[Term|List]).
%% tail_duplicate(2,abdullah) -> tail_duplicate(2,abdullah,[])
%%                               tail_duplicate(2,abdullah,[]) -> tail_duplicate(1,abdullah,[abdullah])
%%                                                                                tail_tuplicate(0,abdullah,[abdullah,abdullah]) -> [abdullah,abdullah]
%%

reverse([]) -> [];
reverse([H|T]) -> reverse(T)++[H].
%%
%% list:reverse/1 more faster than our implementation.
%%
tail_reverse(List) -> tail_reverse(List,[]).
tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T,[H|Acc]).
%%tail_reverse([1,2,3,4]) = tail_reverse([2,3,4], [1])
%%= tail_reverse([3,4], [2,1])
%%= tail_reverse([4], [3,2,1])
%%= tail_reverse([], [4,3,2,1])
%%= [4,3,2,1]

sublist(_,0)-> [];
sublist([H|T],N) when N > 0 -> [H|sublist(T,N-1)].

tail_sublist(List,N) -> tail_sublist(List,N,[]).
tail_sublist([], _, Acc) -> lists:reverse(Acc); %% added.
tail_sublist(_,0,Acc) -> lists:reverse(Acc);
tail_sublist([H|T],N,Acc) when N > 0 -> tail_sublist(T,N-1,[H|Acc]).













