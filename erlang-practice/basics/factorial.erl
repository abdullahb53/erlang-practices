-module(factorial).

-export([calc/1,fact/1]).

-export([tailfac/1,tailfac/2]).

%% METHOD 1
calc(N)->
  case N of
    N when N =:= 0; N =:= 1; N<0 ->  1;
    _ -> N * calc(N-1)
  end.

%% METHOD 2
fact(0) ->1;
fact(N) when N > 0 -> N * fact(N-1).

%%
%% TAIL RECURSIVE (FAST METHOD.)
%%
tailfac(N)-> tailfac(N,1).
tailfac(0,Acc) -> Acc;
tailfac(N,Acc) when N > 0 -> tailfac(N-1,N*Acc).
%%  tailfac(3) -> tailfac(3,1)
%%  tailfac(3,Acc ) 3>0 true -> tailfac(2,3*Acc)
%%  tailfac(2,3*Acc) 2>0 true -> tailfac(1,2*3*Acc)
%%  tailfac(1,2*3*Acc) 1>0 true -> tailfac(0,1*2*3*Acc)
%%  tailfac(0,1*2*3*Acc) => 1*2*3*Acc => 6*Acc