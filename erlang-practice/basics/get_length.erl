-module(get_length).

-export([main/1]).

-export([len/1]).

-export([len_tail_rec/1,len_tail_rec/2]).

%% get length.
main(X) ->
  case X of
    [] -> 0;
    X -> length(X)
  end.

%% get length.
len([]) -> 0;
len([_|T]) -> 1 + len(T).

len_tail_rec(N) -> len_tail_rec(N,0).
len_tail_rec([],Acc) -> Acc;
len_tail_rec([_|T],Acc) -> len_tail_rec(T, Acc+1).

%% len_tail_rec([1,2,3]) -> len_tail_rec([1,2,3],0). -> len_tail_rec([1,[2,3]],0). -> len_tail_rec([2,3],0+1)
%% len_tail_rec([2,3],1) -> len_tail_rec([2,[3]],1+1) -> len_tail_rec([3],2) -> len_tail_rec([],3)
%% len_tail_rec([],3) -> 3.



