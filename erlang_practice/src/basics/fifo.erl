%%
%% USE FIFO
%%
-module(fifo).
-export([new/0, push/2, pop/1, empty/1]).
-export([get_tail_head/1]).

new() -> {fifo, [], []}.

push({fifo,In,Out},X) -> {fifo, [X|In],Out}. %% to be like this -> X:7 -> {fifo, [7] , []}

pop({fifo,[],[]}) -> erlang:error('empty fifo');
pop({fifo, In, []}) -> pop({fifo, [], lists:reverse(In)}); %% {fifo, [3,2,1] , []} -> {fifo, [] , [1,2,3]}
pop({fifo, In,[H|T]}) -> {H,{fifo,In,T}}. %% {fifo, [] , [3|[1,2,3]]} -> {3,{fifo,In,[1,2,3]}}

empty({fifo, [], []}) -> true;
empty({fifo, _, _}) -> false.

get_tail_head({L})->
  [H|T] = L,
  io:format("~p",[H]),
  io:format("~p",[T]).