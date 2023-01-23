%%%-------------------------------------------------------------------
%% @doc erlang_basics public API
%% @end
%%%-------------------------------------------------------------------

-module(erlang_basics_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    erlang_basics_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
