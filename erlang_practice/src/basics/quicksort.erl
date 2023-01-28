-module(quicksort).

-export([qck_sort/1,lc_quicksort/1]).

qck_sort([]) -> [];
qck_sort([Pivot|Rest]) ->
  {Smaller,Larger} = partition(Pivot,Rest,[],[]), qck_sort(Smaller) ++ [Pivot] ++ qck_sort(Larger).

partition(_,[],Smaller,Larger) -> {Smaller,Larger};
partition(Pivot,[H|T],Smaller,Larger) ->
  if H =< Pivot -> partition(Pivot,T,[H|Smaller],Larger);
    H > Pivot -> partition(Pivot,T,Smaller,[H|Larger])
  end.

lc_quicksort([]) -> [];
lc_quicksort([Pivot|Rest]) ->
  lc_quicksort([Smaller || Smaller <- Rest, Smaller =< Pivot])
  ++ [Pivot] ++
    lc_quicksort([Larger || Larger <- Rest, Larger > Pivot]).