-module(kitchen).
-compile(export_all).

fridge1() ->
  receive
    {From, {store, _Food}} ->
      From ! {self(), ok},
      fridge1();
    {From, {take, _Food}} ->
%% uh....
      From ! {self(), not_found},
      fridge1();
    terminate ->
      ok
  end.


store(Pid, Food) ->
  Pid ! {self(), {store, Food}},
  receive
    {Pid, Msg} -> Msg
  end.

take(Pid, Food) ->
  Pid ! {self(), {take, Food}},
  receive
    {Pid, Msg} -> Msg
  end.


start(FoodList) ->
  spawn(?MODULE, fridge2, [FoodList]).