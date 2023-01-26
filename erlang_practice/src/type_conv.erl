-module(type_conv).
-export([todo_convert_example/2]).

%%todo_convert_example(X,TypeOfConv) ->
%%  case TypeOfConv of
%%     list ->  io:format("l->i~n"),list_to_integer(X);
%%     int  ->   io:format("i->l~n"),integer_to_list(X);
%%    _ ->    'wrong type need list or integer'
%%  end.


todo_convert_example(X,TypeOfConv) ->
  case TypeOfConv of
     list ->  io:format("l->i~n"),list_to_integer(X);
     int  ->   io:format("i->l~n"),integer_to_list(X);
    _ ->    'wrong type need list or integer'
  end.


