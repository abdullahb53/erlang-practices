-module(what_if).

-export([it_is_fine/0]).

-export([oh_god/1]).

-export([animal_sound/1]).

%% As such, when Erlang can't find a way to have a guard succeed,
%% it will crash: it cannot not return something. "14.row.."
it_is_fine()->
  if 1=:=1 ->
    works
  end,
  if 1=:=2; 1=:=1 ->
    works
  end,
  if 1=:=2, 1=:=1 -> %% , wrong. -> 'if 1=:=2, 1=:=1 ->'
    fails
  end.

%% It shows us what is the else on erlang.
oh_god(N)->
  if N =:= 2 -> might_succeed;
    true -> always_does  %% this is Erlang's if's 'else!'
end.

%% Catch animals sounds.
animal_sound(Animal)->
  Talk = if Animal == cat -> "meow";
           Animal == dog -> "bark";
           Animal == beef -> "moo";
           Animal == tree -> "bark";
           true-> "asdaseqwe"
         end,
  {Animal,"says" ++ Talk ++ "!"}.

