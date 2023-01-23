-module(functions).

-export([head/1]).
-export([second/1]).
-export([same/2]).
-export([valid_date/1]).
-export([old_enough/1]).

%% It gives you first element.
head([H|_])->
  H.

%% It gives you second element.
second([_,S|_])->
  S.

%% Same things or not.
same(X,X)->
  true;
same(_,_)->
  false.

%% Control timestamp.
valid_date({Date = {Y,M,D},Time = {H,Min,S}})->
  io:format("Date is (~p) and Year:~p,Month:~p,Day:~p ~n",[Date,Y,M,D]),
  io:format("Time is (~p) and Hour:~p,Minute:~p,Second:~p",[Time,H,Min,S]);
valid_date(_)->
  io:format("Don't feed me wrong timestamp. ~n").

%% Permission check for car drivers. "," -> andalso *** ";" -> orelse

%%In guard expressions, the semi-colon (;) acts like the orelse operator:
%% if the first guard fails, it then tries the second,
%% and then the next one, until either one guard succeeds or they all fail.
old_enough(X) when X > 25, X =< 80 ->
  io:format("U have permission for driving a car.");
old_enough(_)->
  io:format("U don't have permission. :(").
