-module(zip4).

-export([zip/2,tail_zip/2,tail_zip/3]).

zip([],[])-> [];
zip([X|XT],[Y|YT]) -> [{X,Y}|zip(XT,YT)].

tail_zip(X,Y) -> tail_zip(X,Y,[]).

tail_zip([],[],Acc) -> lists:reverse(Acc);
tail_zip([X|Xs],[Y|Ys],Acc) -> tail_zip(Xs,Ys,[{X,Y}|Acc]).