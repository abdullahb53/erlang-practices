-module(anonym).

-compile(export_all).

%%  7> Fn = fun() -> a end.
%%  #Fun<erl_eval.20.67289768>
%%  8> Fn().
%%  a
%%  9> hhfuns:map(fun(X) -> X + 1 end, L).
%%  [2,3,4,5,6]
%%  10> hhfuns:map(fun(X) -> X - 1 end, L).
%%  [0,1,2,3,4]

%%  11> PrepareAlarm = fun(Room) ->
%%  11>                     io:format("Alarm set in ~s.~n",[Room]),
%%  11>                     fun() -> io:format("Alarm tripped in ~s! Call Batman!~n",[Room]) end
%%  11>                   end.
%%  #Fun<erl_eval.20.67289768>
%%  12> AlarmReady = PrepareAlarm("bathroom").
%%  Alarm set in bathroom.
%%  #Fun<erl_eval.6.13229925>
%%  13> AlarmReady().
%%  Alarm tripped in bathroom! Call Batman!
%%  ok

%% U cannot reach to C! wrong scope.
 base(A) ->
  B = A + 1,
  F = fun() -> C = A * B end,
  F(),
  C.

%% But child can reach parent's variables.
base(A) ->
  B = A + 1,
  F = fun() -> A * B end,
  F().